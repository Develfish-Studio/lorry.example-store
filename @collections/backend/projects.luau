--!strict

local Meta = require('@lorry.utils/lib/Meta')
local Project = require('@lorry.project/lib/Project')

local projects = Meta:table {}

export type Projects = typeof(projects)

projects.project = Project:from('store_backend')
projects.project_ddl = Project:from('store_migrate')

return projects
