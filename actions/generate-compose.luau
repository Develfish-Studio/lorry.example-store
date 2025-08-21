--!strict
--#region Imports
local Lorry = require("@develfish-repo.utils/lib/Lorry")
local Project = require('@develfish-repo.project/lib/Project')
local Compose = require('@develfish-repo.project-compose/lib/Compose/Compose')
local Haproxy = require('@develfish-repo.project-compose/lib/Haproxy/Haproxy')
local Postgres = require('@develfish-repo.project-compose/lib/Postgres/Postgres')
local Pgadmin = require('@develfish-repo.project-compose/lib/Pgadmin/Pgadmin')
local Keycloak = require('@develfish-repo.project-compose/lib/Keycloak')
local Kafka = require('@develfish-repo.project-compose/lib/Kafka')
local KafkaUi = require('@develfish-repo.project-compose/lib/KafkaUi')
local Minio = require('@develfish-repo.project-compose/lib/Minio/Minio')
local Kcadm = require('@develfish-repo.project-compose/lib/Kcadm/Kcadm')
local Mcli = require('@develfish-repo.project-compose/lib/Mcli/Mcli')
local SpringApp = require('@develfish-repo.project-compose/lib/SpringApp/SpringApp')
local NginxSpa = require('@develfish-repo.project-compose/lib/NginxSpa')
local SwaggerUi = require('@develfish-repo.project-compose/lib/SwaggerUi/SwaggerUi')
local Make = require("@develfish-repo.project-compose/lib/Make/Make")
--#endregion Imports

local project = Project:from('store_starter')

local datasource_keycloak = {
  url = 'jdbc:postgresql://env-postgres:5432/keycloak',
  username = 'keycloak',
  password = 'keycloak'
}

local datasource_app = {
  url = 'jdbc:postgresql://env-postgres:5432/app',
  username = 'app',
  password = 'app'
}

local kafka_client = {
  bootstrap_servers = 'env-kafka:29092',
}

local openid_client = {
  url = 'http://env-keycloak:8080/auth',
  client_id = 'api',
  client_secret = '4Ggxc50xzu5j1qFk5rZ4OPHwvNFXLpNX'
}

local user_admin = {
  username = 'admin@example.com',
  password = 'GfhjkmRfhjkm1'
}

local minio_client = {
  target_server = 'http://env-minio:9000',
  access_key = 'y5LeRZ84J4SsenpaIxMl',
  secret_key = 'AZitoDkffcEYFYUmV4CGv1jr2fiXWIw4uSvdFlDu'
}

local network_default = Compose.Network:from('default')
local volume_kafka = Compose.Volume:from('env-kafka')
local volume_postgres = Compose.Volume:from('env-postgres')
local volume_minio = Compose.Volume:from('env-minio')

-- make
Lorry:generate "@develfish-repo.project-compose/make" {
  target = '@',
  variables = Make
    :from(project)
    :with_profile 'env'
    :with_profile 'app'
    :with_image("assembly_web", "app", "store")
}

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

Lorry:generate "@develfish-repo.project-compose/containers/bitnami/kafka" {
  target = '@',
  variables = Kafka
    :from(project, "env-kafka")
    :configure {
      function(manifest) manifest
        :with_volume_ref(volume_kafka, "/bitnami/kafka")
      end
    }
}

Lorry:generate "@develfish-repo.project-compose/containers/provectuslabs/kafka-ui" {
  target = '@',
  variables = KafkaUi
    :from(project, "env-kafka-ui")
    :with_cluster("local", "env-kafka:29092")
    :configure {
      function(manifest) manifest
        :with_depends_on("env-kafka")
      end
    }
}

Lorry:generate "@develfish-repo.project-compose/containers/official/postgres" {
  target = '@',
  variables = Postgres
    :from(project, "env-postgres")
    :with_datasource(datasource_keycloak)
    :with_datasource(datasource_app)
    :configure {
      function (manifest) manifest
        :with_volume_ref(volume_postgres, "/var/lib/postgresql/data")
        :with_volume_source('../../config/env/env-postgres/docker-entrypoint-initdb.d/', '/docker-entrypoint-initdb.d/')
      end
    }
}

Lorry:generate "@develfish-repo.project-compose/containers/dpage/pgadmin" {
  target = '@',
  variables = Pgadmin
    :from(project, "env-pgadmin")
    :with_datasource(datasource_keycloak)
    :with_datasource(datasource_app)
    :configure {
      function (manifest) manifest
        :with_depends_on("env-postgres")
      end
    }
  }

Lorry:generate "@develfish-repo.project-compose/containers/bitnami/keycloak" {
  target = '@',
  variables = Keycloak
    :from(project, "env-keycloak")
    :with_datasource(datasource_keycloak)
    :with_admin(user_admin.username, user_admin.password)
    :configure {
      function (manifest) manifest
        :with_depends_on("env-postgres")
      end
    }
}

Lorry:generate "@develfish-repo.project-compose/containers/bitnami/kcadm" {
  target = '@',
  variables = Kcadm
    :from(project, "env-kcadm", "application")
    :with_remote(openid_client.url, 'master', user_admin.username, user_admin.password)
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
}

Lorry:generate "@develfish-repo.project-compose/containers/bitnami/minio" {
  target = '@',
  variables = Minio
    :from(project, "env-minio")
    :with_admin("admin", "admin")
    :configure {
      function (manifest) manifest
        :with_volume_ref(volume_minio, '/bitnami/minio/data')
        :with_link("env-haproxy", "minio.local.example.com")
      end
    }
}

Lorry:generate "@develfish-repo.project-compose/containers/bitnami/mcli" {
  target = '@',
  variables = Mcli
    :from(project, "env-mcli")
    :with_remote(minio_client.target_server, "admin", "admin")
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

Lorry:generate "@develfish-repo.project-compose/containers/official/spring-app" {
  target = '@',
  variables = SpringApp
    :from(project, 'app-assembly-web', 'store/assembly_web:1.0-SNAPSHOT')
    :with_spring_datasource(datasource_app)
    :with_spring_kafka(kafka_client)
    :with_minio_client(minio_client)
    :with_minio_bucket('app-public-document')
    :with_minio_bucket('app-public-image', { content_type = 'image/', content_length = '10M' })
    :with_minio_bucket('app-product-image', { content_type = 'image/', content_length = '10M' })
    :configure {
      function (manifest) manifest
        :with_depends_on('env-kafka')
        :with_depends_on('env-postgres')
        :with_depends_on('env-keycloak')
        :with_depends_on('env-minio')
        :with_env_variable('JAVA_OPTS', '-Xmx512m -Xms256m')
        :with_link('env-haproxy:auth.local.example.com')
      end
    }
}

Lorry:generate "@develfish-repo.project-compose/containers/official/nginx-spa" {
  target = '@',
  variables = NginxSpa
    :from(project, 'app-admin-ui', 'store/admin_ui:1.0-SNAPSHOT')
}

Lorry:generate "@develfish-repo.project-compose/containers/swaggerapi/swagger-ui" {
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
}

Lorry:generate "@develfish-repo.project-compose/containers/official/haproxy" {
  target = '@',
  variables = Haproxy
    :from(project, "env-haproxy")
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
