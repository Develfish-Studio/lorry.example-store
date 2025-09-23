--!strict
--#region Imports
local Lorry = require("@lorry.utils/lib/Lorry")
local roots = require('./admin-ui/roots')
local dockerfiles = require('./admin-ui/dockerfiles')
local routers = require('./admin-ui/routers')
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
local fieldsets = require('./admin-ui/fieldsets')
local dialogs = require('./admin-ui/dialogs')
local pages = require('./admin-ui/pages')
local views = require('./admin-ui/views')
local grids = require('./admin-ui/grids')
local toolbars = require('./admin-ui/toolbars')
local actions = require('./admin-ui/actions')
local menus = require('./admin-ui/menus')
--#endregion Imports

-- Generate Roots
for _, root in roots do
  Lorry:generate "@lorry.project-vue/root" { target = '@', variables = root }
end

-- Generate Dockerfiles
for _, docker in dockerfiles do
  Lorry:generate "@lorry.project-vue/docker" { target = '@', variables = docker }
end

-- Generate Routers
for _, router in routers do
  Lorry:generate "@lorry.project-vue/router" { target = '@', variables = router }
end

-- Generate Remotes
for _, remote in remotes do
  Lorry:generate "@lorry.project-vue/remote" { target = '@', variables = remote }
end

-- Generate Requests
for _, request in requests do
  Lorry:generate "@lorry.project-vue/request" { target = '@', variables = request }
end

-- Generate Views
for _, view in views do
  Lorry:generate "@lorry.project-vue/view" { target = '@', variables = view }
end

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

-- Generate Grids
for _, grid in grids do
  Lorry:generate "@lorry.project-vue/grid" { target = '@', variables = grid }
end

-- Generate Fieldsets
for _, fieldset in fieldsets do
  Lorry:generate "@lorry.project-vue/fieldset" { target = '@', variables = fieldset }
end

-- Generate Toolbars
for _, toolbar in toolbars do
  Lorry:generate "@lorry.project-vue/toolbar" { target = '@', variables = toolbar }
end

-- Generate Pages
for _, page in pages do
  Lorry:generate "@lorry.project-vue/page" { target = '@', variables = page }
end

-- Generate Menus
for _, menu in menus do
  Lorry:generate "@lorry.project-vue/menu" { target = '@', variables = menu }
end

-- Generate Widgets
for _, widget in widgets do
  Lorry:generate "@lorry.project-vue/widget" { target = '@', variables = widget }
end

-- Generate Dialogs
for _, dialog in dialogs do
  Lorry:generate "@lorry.project-vue/dialog" { target = '@', variables = dialog }
end

-- Generate Actions
for _, action in actions do
  Lorry:generate "@lorry.project-vue/action" { target = '@', variables = action }
end

-- Generate Queries
for _, query in queries do
  Lorry:generate "@lorry.project-vue/query" { target = '@', variables = query }
end
