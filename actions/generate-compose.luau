--!strict

local Lorry = require("@develfish-repo.utils/lib/Lorry")
local Project = require('@develfish-repo.project/lib/Project')
local Compose = require('@develfish-repo.project-compose/lib/Compose')
local Haproxy = require('@develfish-repo.project-compose/lib/Haproxy')
local Postgres = require('@develfish-repo.project-compose/lib/Postgres')
local Pgadmin = require('@develfish-repo.project-compose/lib/Pgadmin')
local Keycloak = require('@develfish-repo.project-compose/lib/Keycloak')
local Kafka = require('@develfish-repo.project-compose/lib/Kafka')
local KafkaUi = require('@develfish-repo.project-compose/lib/KafkaUi')
local Minio = require('@develfish-repo.project-compose/lib/Minio')
local Kcadm = require('@develfish-repo.project-compose/lib/Kcadm')
local Mcli = require('@develfish-repo.project-compose/lib/Mcli')
local App = require('@develfish-repo.project-compose/lib/App')
local Spa = require('@develfish-repo.project-compose/lib/Spa')
local SwaggerUi = require('@develfish-repo.project-compose/lib/SwaggerUi')

local project = Project:from('store_starter')

local datasource_keycloak = {
  uri = 'jdbc:postgresql://env-postgres:5432/keycloak',
  username = 'keycloak',
  password = 'keycloak'
}

local datasource_app = {
  uri = 'jdbc:postgresql://env-postgres:5432/app',
  username = 'app',
  password = 'app'
}

local openid_client = {
  client_id = 'api',
  client_secret = '4Ggxc50xzu5j1qFk5rZ4OPHwvNFXLpNX'
}

local minio_client = {
  uri = 'http://env-minio:9000',
  access_key = 'y5LeRZ84J4SsenpaIxMl',
  secret_key = 'AZitoDkffcEYFYUmV4CGv1jr2fiXWIw4uSvdFlDu'
}

local volume_kafka = Compose.Volume:from('env-kafka')
local volume_postgres = Compose.Volume:from('env-postgres')
local volume_minio = Compose.Volume:from('env-minio')
local network_default = Compose.Network:from('default')

Lorry:generate "@develfish-repo.project-compose/compose" {
  target = '@',
  variables = Compose
    :from(project)
    :with_include "compose/env/env-haproxy.compose.yaml"
    :with_include "compose/env/env-kafka.compose.yaml"
    :with_include "compose/env/env-kafka-ui.compose.yaml"
    :with_include "compose/env/env-pgadmin.compose.yaml"
    :with_include "compose/env/env-postgres.compose.yaml"
    :with_include "compose/env/env-swagger-ui.compose.yaml"
    :with_include "compose/env/env-keycloak.compose.yaml"
    :with_include "compose/env/env-kcadm.compose.yaml"
    :with_include "compose/env/env-minio.compose.yaml"
    :with_include "compose/env/env-mcli.compose.yaml"
    :with_include "compose/app/app-assembly-web.compose.yaml"
    :with_include "compose/app/app-admin-ui.compose.yaml"
    :setup {
      network_default,
      volume_kafka,
      volume_postgres,
      volume_minio,
    }
}

Lorry:generate "@develfish-repo.project-compose/kafka" {
  target = '@',
  variables = Kafka
    :from(project, "env-kafka")
    :with_volume_ref(volume_kafka, "/bitnami/kafka")
    :with_network(network_default)
}

Lorry:generate "@develfish-repo.project-compose/kafka-ui" {
  target = '@',
  variables = KafkaUi
    :from(project, "env-kafka-ui")
    :with_depends_on "env-kafka"
    :with_network(network_default)
}

Lorry:generate "@develfish-repo.project-compose/pgadmin" {
  target = '@',
  variables = Pgadmin
    :from(project, "env-pgadmin")
    :with_depends_on "env-postgres"
    :with_datasource(datasource_keycloak)
    :with_datasource(datasource_app)
    :with_network(network_default)
  }

Lorry:generate "@develfish-repo.project-compose/postgres" {
  target = '@',
  variables = Postgres
    :from(project, "env-postgres")
    :with_volume_ref(volume_postgres, "/var/lib/postgresql/data")
    :with_volume_source('../../config/env/env-postgres/docker-entrypoint-initdb.d/', '/docker-entrypoint-initdb.d/')
    :with_datasource(datasource_keycloak)
    :with_datasource(datasource_app)
    :with_network(network_default)
}

Lorry:generate "@develfish-repo.project-compose/keycloak" {
  target = '@',
  variables = Keycloak
    :from(project, "env-keycloak", datasource_keycloak)
    :with_depends_on "env-postgres"
    :with_network(network_default)
}

Lorry:generate "@develfish-repo.project-compose/kcadm" {
  target = '@',
  variables = Kcadm
    :from(project, "env-kcadm", "application")
    :with_client(openid_client)
    :with_realm_role 'admin'
    :with_realm_role 'support'
    :with_group 'admin'
    :with_group 'support'
    :with_user('admin@example.com', 'Qwerty123')
    :with_user('support01@example.com', 'Qwerty123')
    :with_user('support02@example.com', 'Qwerty123')
    :with_user('user01@example.com', 'Qwerty123')
    :with_user('user02@example.com', 'Qwerty123')
    :with_member('admin', 'admin')
    :with_member('support01', 'support')
    :with_member('support02', 'support')
    :with_grant('group:admin', 'realm:admin')
    :with_grant('group:admin', 'realm:support')
    :with_grant('group:support', 'realm:support')
    :with_volume_source('../../config/env/env-kcadm/scripts', '/opt/scripts')
    :with_network(network_default)
}

Lorry:generate "@develfish-repo.project-compose/minio" {
  target = '@',
  variables = Minio
    :from(project, "env-minio")
    :with_volume_ref(volume_minio, '/bitnami/minio/data')
    :with_link("env-haproxy", "minio.local.example.com")
    :with_network(network_default)
}

Lorry:generate "@develfish-repo.project-compose/mcli" {
  target = '@',
  variables = Mcli
    :from(project, "env-mcli")
    :with_user('api', 'Qwerty123')
    :with_grant('api', 'readwrite')
    :with_key('api', minio_client.access_key, minio_client.secret_key)
    :with_open_bucket 'app-product-image'
    :with_open_bucket 'app-product-image-variant'
    :with_open_bucket 'app-public-image'
    :with_open_bucket 'app-public-document'
    :with_bucket 'app-user-document'
    :setup {
      Mcli.KafkaTarget
        :from('app_product_image')
        :with_broker 'env-kafka:29092'
        :with_topic 'app_product_image'
        :with_event('app-product-image', 'put')
        :with_event('app-product-image', 'delete'),
      Mcli.KafkaTarget
        :from('onec_employee_table')
        :with_broker 'env-kafka:29092'
        :with_topic('onec_employee_table')
        :with_event('onec-employee-table', 'put'),
    }
}

Lorry:generate "@develfish-repo.project-compose/app" {
  target = '@',
  variables = App
    :from(project, 'app-assembly-web', 'store/assembly_web:1.0-SNAPSHOT')
    :with_depends_on('env-kafka')
    :with_depends_on('env-postgres')
    :with_depends_on('env-keycloak')
    :with_depends_on('env-minio')
    :with_spring_datasource(datasource_app)
    :with_app_openid_client(openid_client)
    :with_app_minio_client(minio_client)
    :with_env_variable('JAVA_OPTS', '-Xmx512m -Xms256m')
    :with_env_variable('SPRING_KAFKA_BOOTSTRAP_SERVERS', 'env-kafka:29092')
    :with_env_variable('APP_MINIO_BUCKETS_0_NAME', 'app-public-document')
    :with_env_variable('APP_MINIO_BUCKETS_1_NAME', 'app-public-image')
    :with_env_variable('APP_MINIO_BUCKETS_1_UPLOAD_POLICY_CONTENT_TYPE', 'image/')
    :with_env_variable('APP_MINIO_BUCKETS_1_UPLOAD_POLICY_CONTENT_LENGTH', '10M')
    :with_env_variable('APP_MINIO_BUCKETS_2_NAME', 'app-product-image')
    :with_env_variable('APP_MINIO_BUCKETS_2_UPLOAD_POLICY_CONTENT_TYPE', 'image/')
    :with_env_variable('APP_MINIO_BUCKETS_2_UPLOAD_POLICY_CONTENT_LENGTH', '10M')
    :with_link('env-haproxy:auth.local.example.com')
    :with_network(network_default)
}

Lorry:generate "@develfish-repo.project-compose/spa" {
  target = '@',
  variables = Spa
    :from(project, 'app-admin-ui', 'store/admin_ui:1.0-SNAPSHOT')
    :with_network(network_default)
}

Lorry:generate "@develfish-repo.project-compose/swagger-ui" {
  target = '@',
  variables = SwaggerUi
    :from(project, "env-swagger-ui")
    :with_entry("Assembly Web", "http://api.local.example.com/api/assembly_web/v3/api-docs")
    :with_entry("Service Structure", "http://api.local.example.com/api/service_structure/v3/api-docs")
    :with_entry("Service Catalogue", "http://api.local.example.com/api/service_catalog/v3/api-docs")
    :with_entry("Service Profiles", "http://api.local.example.com/api/service_profile/v3/api-docs")
    :with_entry("Service Events", "http://api.local.example.com/api/service_events/v3/api-docs")
    :with_entry("Service Payments", "http://api.local.example.com/api/service_payments/v3/api-docs")
    :with_entry("Service Security", "http://api.local.example.com/api/service_security/v3/api-docs")
    :with_entry("Service Uploads", "http://api.local.example.com/api/service_uploads/v3/api-docs")
    :with_network(network_default)
}

Lorry:generate "@develfish-repo.project-compose/haproxy" {
  target = '@',
  variables = Haproxy:from(project, "env-haproxy")
    :with_arrow('http://kafka-ui.local.example.com', 'http://env-kafka-ui:8080')
    :with_arrow('http://pgadmin.local.example.com', 'http://env-pgadmin:80')
    :with_arrow('http://swagger-ui.local.example.com', 'http://env-swagger-ui:8080')
    :with_arrow('http://minio.local.example.com', 'http://env-minio:9000')
    :with_arrow('http://minio-ui.local.example.com', 'http://env-minio:9001')
    :setup {
      Haproxy.Route
        :from_arrow('http://auth.local.example.com', 'http://env-keycloak:8080')
        :with_redirect_prefix('/auth');
      Haproxy.Route
        :from_uri_string('http://admin-ui.local.example.com')
        :setup {
          Haproxy.Proxy
            :from_path_string '/'
            :with_optional_server 'http://app-admin-ui:80'
            :with_optional_backup_server 'http://host.docker.internal:5173'
        };
      Haproxy.Route
        :from_uri_string('http://api.local.example.com')
        :with_name('api')
        :setup {
          Haproxy.Proxy
            :from_path_string '/api/assembly_web'
            :with_cors '*'
            :with_optional_server 'http://app-assembly-web:8080'
            :with_optional_backup_server 'http://host.docker.internal:8080';
          Haproxy.Proxy
            :from_path_string '/api/assembly_web'
            :with_cors '*'
            :with_optional_server 'http://host.docker.internal:8080';
          Haproxy.Proxy
            :from_path_string '/api/service_structure'
            :with_cors '*'
            :with_optional_server 'http://host.docker.internal:8081';
          Haproxy.Proxy
            :from_path_string '/api/service_catalog'
            :with_cors '*'
            :with_optional_server 'http://host.docker.internal:8082';
          Haproxy.Proxy
            :from_path_string '/api/service_profile'
            :with_cors '*'
            :with_optional_server 'http://host.docker.internal:8083';
          Haproxy.Proxy
            :from_path_string '/api/service_events'
            :with_cors '*'
            :with_optional_server 'http://host.docker.internal:8084';
          Haproxy.Proxy
            :from_path_string '/api/service_payments'
            :with_cors '*'
            :with_optional_server 'http://host.docker.internal:8085';
          Haproxy.Proxy
            :from_path_string '/api/service_security'
            :with_cors '*'
            :with_optional_server 'http://host.docker.internal:8086';
          Haproxy.Proxy
            :from_path_string '/api/service_uploads'
            :with_cors '*'
            :with_optional_server 'http://host.docker.internal:8087';
        };
    }
}