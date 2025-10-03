--!strict

local Meta = require('@lorry.utils/lib/Meta')
local POM = require('@lorry.project-spring/lib/POM')

local projects = require('./projects')

local roots = Meta:table {}

export type Roots = typeof(roots)

roots.root = POM
  :from_root(projects.project, 'com.example', 'application')
  :with_module "assembly_web"
  :with_module "service_catalog"
  :with_module "service_events"
  :with_module "service_payments"
  :with_module "service_profile"
  :with_module "service_security"
  :with_module "service_structure"
  :with_module "service_uploads"
  :with_module "gateway_events"
  :with_module "gateway_payments"
  :with_module "gateway_profile"
  :with_module "shared_api"

return roots
