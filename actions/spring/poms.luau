local Meta = require('@develfish-repo.core/Meta')
local POM = require('@develfish-repo.spring/POM')

local projects = require('./projects')

local poms: {[string]: POM.POM} = Meta:table {}

poms.pom = POM:from(projects.project, 'com.example', 'application', {
  "assembly_web",
  "common_api",
  "common_events",
  "common_jpa",
  "common_minio",
  "common_security",
  "common_web",
  "common_ws",
  "service_catalog",
  "service_events",
  "service_payments",
  "service_profile",
  "service_security",
  "service_structure",
  "service_uploads",
  "gateway_events",
  "gateway_payments",
  "gateway_profile",
  "shared_api",
})

return poms
