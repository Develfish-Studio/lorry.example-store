local Module = require('@lorry.project-spring/lib/Module')

local roots = require('./roots')
local profiles = require('./profiles')

local modules = {}

export type Modules = typeof(modules)

modules.assembly_web = Module
  :from(roots.root, 'assembly', 'assembly_web')
  :with_profile('local', profiles.profile_local_full:copy():with_server_port(8080))

modules.shared_api = Module
  :from(roots.root, 'lib', 'shared_api')
  :with_dependency('studio.develfish.guppy', 'common-events')

modules.service_structure = Module
  :from(roots.root, 'web', 'service_structure')
  :with_profile('local', profiles.profile_local:copy():with_server_port(8081))
  :with_dependency('studio.develfish.guppy', 'common-jpa')
  :with_dependency('studio.develfish.guppy', 'common-web')
  :with_dependency('studio.develfish.guppy', 'common-events')
  :with_plugins {
    'shared_api'
  }

modules.service_catalog = Module
  :from(roots.root, 'web', 'service_catalog')
  :with_profile('local', profiles.profile_local:copy():with_server_port(8082))
  :with_dependency('studio.develfish.guppy', 'common-jpa')
  :with_dependency('studio.develfish.guppy', 'common-web')
  :with_dependency('studio.develfish.guppy', 'common-events')
  :with_plugins {
    'shared_api'
  }

modules.service_profile = Module
  :from(roots.root, 'web', 'service_profile')
  :with_profile('local', profiles.profile_local:copy():with_server_port(8083))
  :with_dependency('studio.develfish.guppy', 'common-jpa')
  :with_dependency('studio.develfish.guppy', 'common-web')
  :with_dependency('studio.develfish.guppy', 'common-events')
  :with_plugins {
    'shared_api'
  }

modules.service_events = Module
  :from(roots.root, 'web', 'service_events')
  :with_profile('local', profiles.profile_local:copy():with_server_port(8084))
  :with_dependency('studio.develfish.guppy', 'common-jpa')
  :with_dependency('studio.develfish.guppy', 'common-web')
  :with_dependency('studio.develfish.guppy', 'common-ws')
  :with_dependency('studio.develfish.guppy', 'common-events')
  :with_plugins {
    'shared_api'
  }

modules.service_payments = Module
  :from(roots.root, 'web', 'service_payments')
  :with_profile('local', profiles.profile_local:copy():with_server_port(8085))
  :with_dependency('studio.develfish.guppy', 'common-jpa')
  :with_dependency('studio.develfish.guppy', 'common-web')
  :with_dependency('studio.develfish.guppy', 'common-events')
  :with_plugins {
    'shared_api'
  }

modules.service_security = Module
  :from(roots.root, 'security', 'service_security')
  :with_profile('local', profiles.profile_local_with_openid_client:copy():with_server_port(8086))
  :with_dependency('studio.develfish.guppy', 'common-web')
  :with_dependency('studio.develfish.guppy', 'common-events')
  :with_dependency('studio.develfish.guppy', 'common-security')
  :with_plugins {
    'shared_api'
  }

modules.service_uploads = Module
  :from(roots.root, 'uploads', 'service_uploads')
  :with_profile('local', profiles.profile_local_with_minio_client:copy():with_server_port(8087))
  :with_dependency('studio.develfish.guppy', 'common-web')
  :with_dependency('studio.develfish.guppy', 'common-events')
  :with_dependency('studio.develfish.guppy', 'common-minio')
  :with_plugins {
    'shared_api'
  }

modules.gateway_payments = Module
  :from(roots.root, 'gateway', 'gateway_payments')
  :with_profile('local', profiles.profile_local:copy():with_server_port(8088))
  :with_dependency('studio.develfish.guppy', 'common-jpa')
  :with_dependency('studio.develfish.guppy', 'common-web')
  :with_dependency('studio.develfish.guppy', 'common-events')
  :with_plugins {
    'shared_api'
  }

modules.gateway_profile = Module
  :from(roots.root, 'gateway', 'gateway_profile')
  :with_profile('local', profiles.profile_local:copy():with_server_port(8089))
  :with_dependency('studio.develfish.guppy', 'common-jpa')
  :with_dependency('studio.develfish.guppy', 'common-web')
  :with_dependency('studio.develfish.guppy', 'common-events')
  :with_plugins {
    'shared_api'
  }

modules.gateway_events = Module
  :from(roots.root, 'gateway', 'gateway_events')
  :with_profile('local', profiles.profile_local:copy():with_server_port(8090))
  :with_dependency('studio.develfish.guppy', 'common-jpa')
  :with_dependency('studio.develfish.guppy', 'common-web')
  :with_dependency('studio.develfish.guppy', 'common-events')
  :with_dependency('com.google.firebase', 'firebase-admin', '9.1.1')
  :with_plugins {
    'shared_api'
  }

return modules