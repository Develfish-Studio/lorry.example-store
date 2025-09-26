--!strict
--#region Imports
local Lorry = require("@lorry.utils/lib/Lorry")
local Module = require('@lorry.project-spring/lib/Module/Module')
local roots = require('./backend/roots')
local modules = require('./backend/modules')
local dockerfiles = require('./backend/dockerfiles')
local units = require('./backend/units')
local exchanges = require('./backend/exchanges')
local assemblies = require('./backend/assemblies')
local listeners = require('./backend/listeners')
local resources = require('./backend/resources')
local statements = require('./backend/statements')

--#endregion Imports

-- Generate Roots
for _, root in roots do
  Lorry:generate "@lorry.project-spring/root" { target = '@', variables = root }
end

-- Generate Build Scripts
for _, docker in dockerfiles do
  Lorry:generate "@lorry.project-spring/docker" { target = '@', variables = docker }
end

-- Generate Assemblies
for _, assembly in assemblies do
  Lorry:generate "@lorry.project-spring/assembly" { target = '@', variables = assembly }
end

-- Generate Modules
for _, module in modules do
  local item = module::Module.Module
  if item.kind == 'web' then
    Lorry:generate "@lorry.project-spring/module_web" { target = '@', variables = item }
  elseif item.kind == 'lib' then
    Lorry:generate "@lorry.project-spring/module_lib" { target = '@', variables = item }
  elseif item.kind == 'gateway' then
    Lorry:generate "@lorry.project-spring/module_web" { target = '@', variables = item }
  elseif item.kind == 'security' then
    Lorry:generate "@lorry.project-spring/module_security" { target = '@', variables = item }
  elseif item.kind == 'uploads' then
    Lorry:generate "@lorry.project-spring/module_uploads" { target = '@', variables = item }
  end
end

-- Generate Exchanges
for _, exchange in exchanges do
  Lorry:generate "@lorry.project-spring/exchange" { target = '@', variables = exchange }
end

-- Generate Units
for _, unit in units do
  Lorry:generate "@lorry.project-spring/unit" { target = '@', variables = unit }
end

-- Generate Resources
for _, resource in resources do
  Lorry:generate "@lorry.project-spring/resource" { target = '@', variables = resource }
end

-- Generate Listeners
for _, listener in listeners do
  Lorry:generate "@lorry.project-spring/listener" { target = '@', variables = listener }
end

-- Generate DDL Statements
for _, statement in statements do
  Lorry:generate "@lorry.project-spring/ddl" { target = '@', variables = statement }
end
