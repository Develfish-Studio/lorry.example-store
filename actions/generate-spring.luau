-- return require "./test"

print "Hello from lua!"
-- print(require)

-- local lorry = require("@develfish-repo.core/lorry")

-- local test = require('/home/ipavlenko/Projects/Develfish/develfish-root/develfish-example/store/generate/test.luau')
-- local projects = require('./spring/projects')

-- local poms = require('./spring/poms')
-- local profiles = require('../local/definitions/profiles')
-- local modules = require('../local/definitions/modules')
-- local dockerfiles = require('../local/definitions/dockerfiles')
-- local units = require('../local/definitions/units')
-- local exchanges = require('../local/definitions/exchanges')
-- local projections = require('../local/definitions/projections')
-- local assemblies = require('../local/definitions/assemblies')
-- local listeners = require('../local/definitions/listeners')
-- local resources = require('../local/definitions/resources')
-- local statements = require('../local/definitions/statements')

-- Generate Projects
-- for _, pom in poms do
--   lorry.generate "@/project" { target = '@store', variables = pom:unwrap() }
-- end

-- -- Generate Build Scripts
-- for _, docker in dockerfiles do
--   lorry.generate "@/docker" { target = '@store', variables = docker:unwrap() }
-- end

-- -- Generate Assemblies
-- for _, assembly in assemblies do
--   lorry.generate "@/assembly" { target = '@store', variables = assembly:unwrap() }
-- end

-- -- Generate Modules
-- for _, item in modules do
--   if item.kind == 'web' then
--     lorry.generate "@/module_web" { target = '@store', variables = item:unwrap() }
--   elseif item.kind == 'lib' then
--     lorry.generate "@/module_lib" { target = '@store', variables = item:unwrap() }
--   elseif item.kind == 'gateway' then
--     lorry.generate "@/module_web" { target = '@store', variables = item:unwrap() }
--   elseif item.kind == 'security' then
--     lorry.generate "@/module_security" { target = '@store', variables = item:unwrap() }
--   elseif item.kind == 'uploads' then
--     lorry.generate "@/module_uploads" { target = '@store', variables = item:unwrap() }
--   end
-- end