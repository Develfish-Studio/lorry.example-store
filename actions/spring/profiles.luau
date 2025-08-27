--!strict

local Meta = require('@lorry.utils/lib/Meta')
local PropTypes = require('@lorry.project/lib/PropTypes')
local Profile = require('@lorry.project-spring/lib/Profile/Profile')

local profiles = Meta:table {}

export type Profiles = typeof(profiles)

local server_port = 8080

local datasource: PropTypes.Datasource = {
  url = 'jdbc:postgresql://localhost:5432/app',
  username = 'app',
  password = 'app',
}

local openid_remote: PropTypes.OpenidRemote = {
  url = 'http://env-keycloak:8080/auth',
  client_id = 'api',
  client_secret = '4Ggxc50xzu5j1qFk5rZ4OPHwvNFXLpNX',
  issuer_uri = 'http://auth.local.example.com/auth/realms/application',
  redirect_uri = '{referer}/auth/callback',
}

local minio_remote: PropTypes.MinioRemote = {
  target_server = 'http://minio.local.example.com',
  access_key = 'y5LeRZ84J4SsenpaIxMl',
  secret_key = 'AZitoDkffcEYFYUmV4CGv1jr2fiXWIw4uSvdFlDu',
}

local firebase_config = {
  push = {
    ['config-file'] = 'classpath:firebase-service-account.json',
  }
}

local huawei_config = {
  push = {
    ['client-id'] = 111569649,
    ['client-secret'] = 'fd7c6891686f73fd66a7661b2bc971c04fa7f058b431eb0e35526da1549c2c76',
    ['token-url'] = 'https://oauth-login.cloud.huawei.com/oauth2/v3/token',
    ['api-url'] = 'https://push-api.cloud.huawei.com/v1/${app.huawei.client-id}/messages:send',
  }
}

profiles.profile_local_with_minio_client = Profile
  :from('local')
  :with_server_port(server_port)
  :with_app_minio_client(minio_remote)
  :configure {
    function(impl) assert(impl.app_minio_client)
      :with_bucket 'app-public-document'
      :with_bucket('app-public-image', { content_type = 'image/', content_length = '10M' })
      :with_bucket('app-product-image', { content_type = 'image/', content_length = '10M' })
    end
  }

profiles.profile_local_with_openid_client = Profile
  :from('local')
  :with_server_port(8080)
  :with_app_openid_remote(openid_remote)

profiles.profile_local = Profile
  :from('local')
  :with_server_port(server_port)
  :with_spring_jpa(true)
  :with_spring_datasource(datasource)

profiles.profile_local_full = Profile
  :from('local')
  :with_server_port(server_port)
  :with_spring_jpa(true)
  :with_spring_datasource(datasource)
  :with_app_openid_remote(openid_remote)
  :with_app_minio_client(minio_remote)
  :with_app_entry('firebase', firebase_config)
  :with_app_entry('huawei', huawei_config)
  :configure {
    function(impl) assert(impl.app_minio_client)
      :with_bucket 'app-public-document'
      :with_bucket('app-public-image', { content_type = 'image/', content_length = '10M' })
      :with_bucket('app-product-image', { content_type = 'image/', content_length = '10M' })
    end
  }

return profiles
