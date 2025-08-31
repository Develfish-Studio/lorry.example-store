--!strict
--#region Imports
local Lorry = require("@lorry.utils/lib/Lorry")
local roots = require('./admin-ui/roots')
local dockerfiles = require('./admin-ui/dockerfiles')
-- local routers = require('./admin-ui/routers')
local remotes = require('./admin-ui/remotes')
local structures = require('./admin-ui/structures')
local symbols = require('./admin-ui/symbols')
local selects = require('./admin-ui/selects')
local searches = require('./admin-ui/searches')
local uploads = require('./admin-ui/uploads')
local editors = require('./admin-ui/editors')
local widgets = require('./admin-ui/widgets')
local requests = require('./admin-ui/requests')
local queries = require('./admin-ui/queries')
--#endregion Imports

-- local views = require('vue/definitions/views')
-- local grids = require('vue/definitions/grids')
-- local fieldsets = require('vue/definitions/fieldsets')
-- local editors = require('vue/definitions/editors')
-- local toolbars = require('vue/definitions/toolbars')
-- local pages = require('vue/definitions/pages')
-- local menus = require('vue/definitions/menus')
-- local dialogs = require('vue/definitions/dialogs')
-- local actions = require('vue/definitions/actions')

-- Generate Roots
for _, root in roots do
  Lorry:generate "@lorry.project-vue/root" { target = '@', variables = root }
end

-- Generate Dockerfiles
for _, docker in dockerfiles do
  Lorry:generate "@lorry.project-vue/docker" { target = '@', variables = docker }
end

-- -- Generate Routers
-- for _, router in routers do
--   Lorry:generate "@lorry.project-vue/router" { target = '@', variables = router }
-- end

-- Generate Remotes
for _, remote in remotes do
  Lorry:generate "@lorry.project-vue/remote" { target = '@', variables = remote }
end

-- Generate Requests
for _, request in requests do
  Lorry:generate "@lorry.project-vue/request" { target = '@', variables = request }
end

-- -- Generate Views
-- for _, view in views do
--   ggcode.generate "@/view" { target = '@store', variables = view:unwrap() }
-- end

-- Generate Structures
for _, structure in structures do
  Lorry:generate "@lorry.project-vue/structure" { target = '@', variables = structure }
end

-- Generate Select Controls
for _, select in selects do
  Lorry:generate "@lorry.project-vue/select" { target = '@', variables = select }
end

-- Generate Search Controls
for _, search in searches do
  Lorry:generate "@lorry.project-vue/search" { target = '@', variables = search }
end

-- Generate Upload Controls
for _, upload in uploads do
  Lorry:generate "@lorry.project-vue/upload_s3" { target = '@', variables = upload }
end

-- Generate Editor Controls
for _, editor in editors do
  Lorry:generate "@lorry.project-vue/editor_js" { target = '@', variables = editor }
end

-- Generate Symbols
for _, symbol in symbols do
  Lorry:generate "@lorry.project-vue/symbol" { target = '@', variables = symbol }
end

-- -- Generate Grids
-- for _, grid in grids do
--   ggcode.generate "@/grid" { target = '@store', variables = grid:unwrap() }
-- end

-- -- Generate Fieldsets
-- for _, fieldset in fieldsets do
--   ggcode.generate "@/fieldset" { target = '@store', variables = fieldset:unwrap() }
-- end

-- -- Generate Toolbars
-- for _, toolbar in toolbars do
--   ggcode.generate "@/toolbar" { target = '@store', variables = toolbar:unwrap() }
-- end

-- -- Generate Pages
-- for _, page in pages do
--   ggcode.generate "@/page" { target = '@store', variables = page:unwrap() }
-- end

-- -- Generate Menus
-- for _, menu in menus do
--   ggcode.generate "@/menu" { target = '@store', variables = menu:unwrap() }
-- end

-- Generate Widgets
for _, widget in widgets do
  Lorry:generate "@lorry.project-vue/widget" { target = '@', variables = widget }
end

-- -- Generate Dialogs
-- for _, dialog in dialogs do
--   ggcode.generate "@/dialog" { target = '@store', variables = dialog:unwrap() }
-- end

-- -- Generate Actions
-- for _, action in actions do
--   ggcode.generate "@/action" { target = '@store', variables = action:unwrap() }
-- end

-- Generate Queries
for _, query in queries do
  Lorry:generate "@lorry.project-vue/query" { target = '@', variables = query }
end
