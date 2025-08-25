--!strict
--#region Imports
local Lorry = require("@develfish-repo.utils/lib/Lorry")
-- local Project = require('@develfish-repo.project/lib/Project')
-- local projects = require('./spring/projects')
local roots = require('./spring/roots')
local profiles = require('./spring/profiles')
local modules = require('./spring/modules')
-- local dockerfiles = require('../local/definitions/dockerfiles')
-- local units = require('../local/definitions/units')
-- local exchanges = require('../local/definitions/exchanges')
-- local projections = require('../local/definitions/projections')
local assemblies = require('./spring/assemblies')
-- local listeners = require('../local/definitions/listeners')
-- local resources = require('../local/definitions/resources')
-- local statements = require('../local/definitions/statements')
local Module = require('@develfish-repo.project-spring/lib/Module/Module')
--#endregion Imports

for _, root in roots do
  Lorry:generate "@develfish-repo.project-spring/root" { target = '@', variables = root }
end

-- -- Generate Build Scripts
-- for _, docker in dockerfiles do
--   lorry.generate "@/docker" { target = '@store', variables = docker:unwrap() }
-- end

-- Generate Assemblies
for _, assembly in assemblies do
  Lorry:generate "@develfish-repo.project-spring/assembly" { target = '@', variables = assembly }
end

-- Generate Modules
for _, module in modules do
  local item = module::Module.Module
  if item.kind == 'web' then
    Lorry:generate "@develfish-repo.project-spring/module_web" { target = '@', variables = item }
  elseif item.kind == 'lib' then
    Lorry:generate "@develfish-repo.project-spring/module_lib" { target = '@', variables = item }
  elseif item.kind == 'gateway' then
    Lorry:generate "@develfish-repo.project-spring/module_web" { target = '@', variables = item }
  elseif item.kind == 'security' then
    Lorry:generate "@develfish-repo.project-spring/module_security" { target = '@', variables = item }
  elseif item.kind == 'uploads' then
    Lorry:generate "@develfish-repo.project-spring/module_uploads" { target = '@', variables = item }
  end
end
