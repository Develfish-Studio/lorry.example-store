--!strict
--#region Imports
local Lorry = require("@develfish-repo.utils/lib/Lorry")
local Module = require('@develfish-repo.project-spring/lib/Module/Module')
local roots = require('./spring/roots')
local modules = require('./spring/modules')
local dockerfiles = require('./spring/dockerfiles')
local units = require('./spring/units')
local exchanges = require('./spring/exchanges')
local assemblies = require('./spring/assemblies')
local listeners = require('./spring/listeners')
local resources = require('./spring/resources')
local statements = require('./spring/statements')
--#endregion Imports

for _, root in roots do
  Lorry:generate "@develfish-repo.project-spring/root" { target = '@', variables = root }
end

-- Generate Build Scripts
for _, docker in dockerfiles do
  Lorry:generate "@develfish-repo.project-spring/docker" { target = '@', variables = docker }
end

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

-- Generate Exchanges
for _, exchange in exchanges do
  Lorry:generate "@develfish-repo.project-spring/exchange" { target = '@', variables = exchange }
end

-- Generate Units
for _, unit in units do
  Lorry:generate "@develfish-repo.project-spring/unit" { target = '@', variables = unit }
end

-- Generate Resources
for _, resource in resources do
  Lorry:generate "@develfish-repo.project-spring/resource" { target = '@', variables = resource }
end

-- Generate Listeners
for _, listener in listeners do
  Lorry:generate "@develfish-repo.project-spring/listener" { target = '@', variables = listener }
end

-- Generate DDL Statements
for _, statement in statements do
  Lorry:generate "@develfish-repo.project-spring/ddl" { target = '@', variables = statement }
end
