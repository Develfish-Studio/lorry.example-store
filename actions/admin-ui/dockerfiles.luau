--!strict

local Docker = require('@lorry.project-vue/lib/Docker/Docker')

local projects = require('./projects')

local dockerfiles = {}

dockerfiles.docker = Docker
  :from(projects.project)
  :with_namespace 'store'
  :with_image 'admin_ui'

return dockerfiles
