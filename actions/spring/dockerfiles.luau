local Docker = require('@lorry.project-spring/lib/Docker/Docker')

local roots = require('./roots')

local dockerfiles = {}

dockerfiles.docker = Docker
  :from(roots.root)
  :with_image('assembly_web')
  :with_namespace('store')

return dockerfiles
