--!strict
--#region Imports
local Lorry = require("@lorry.utils/lib/Lorry")
local roots = require('@collections/admin-ui/roots')
local dockerfiles = require('@collections/admin-ui/dockerfiles')
local routers = require('@collections/admin-ui/routers')
local remotes = require('@collections/admin-ui/remotes')
local structures = require('@collections/admin-ui/structures')
local symbols = require('@collections/admin-ui/symbols')
local selects = require('@collections/admin-ui/selects')
local searches = require('@collections/admin-ui/searches')
local uploads = require('@collections/admin-ui/uploads')
local editors = require('@collections/admin-ui/editors')
local widgets = require('@collections/admin-ui/widgets')
local requests = require('@collections/admin-ui/requests')
local queries = require('@collections/admin-ui/queries')
local fieldsets = require('@collections/admin-ui/fieldsets')
local dialogs = require('@collections/admin-ui/dialogs')
local pages = require('@collections/admin-ui/pages')
local views = require('@collections/admin-ui/views')
local grids = require('@collections/admin-ui/grids')
local toolbars = require('@collections/admin-ui/toolbars')
local actions = require('@collections/admin-ui/actions')
local menus = require('@collections/admin-ui/menus')
--#endregion Imports

-- Generate Roots
for _, root in roots do
  Lorry:generate "@lorry.project-vue/root" { target = '@root', variables = root }
end

-- Generate Dockerfiles
for _, docker in dockerfiles do
  Lorry:generate "@lorry.project-vue/docker" { target = '@root', variables = docker }
end

-- Generate Routers
for _, router in routers do
  Lorry:generate "@lorry.project-vue/router" { target = '@root', variables = router }
end

-- Generate Remotes
for _, remote in remotes do
  Lorry:generate "@lorry.project-vue/remote" { target = '@root', variables = remote }
end

-- Generate Requests
for _, request in requests do
  Lorry:generate "@lorry.project-vue/request" { target = '@root', variables = request }
end

-- Generate Views
for _, view in views do
  Lorry:generate "@lorry.project-vue/view" { target = '@root', variables = view }
end

-- Generate Structures
for _, structure in structures do
  Lorry:generate "@lorry.project-vue/structure" { target = '@root', variables = structure }
end

-- Generate Select Controls
for _, select in selects do
  Lorry:generate "@lorry.project-vue/select" { target = '@root', variables = select }
end

-- Generate Search Controls
for _, search in searches do
  Lorry:generate "@lorry.project-vue/search" { target = '@root', variables = search }
end

-- Generate Upload Controls
for _, upload in uploads do
  Lorry:generate "@lorry.project-vue/upload_s3" { target = '@root', variables = upload }
end

-- Generate Editor Controls
for _, editor in editors do
  Lorry:generate "@lorry.project-vue/editor_js" { target = '@root', variables = editor }
end

-- Generate Symbols
for _, symbol in symbols do
  Lorry:generate "@lorry.project-vue/symbol" { target = '@root', variables = symbol }
end

-- Generate Grids
for _, grid in grids do
  Lorry:generate "@lorry.project-vue/grid" { target = '@root', variables = grid }
end

-- Generate Fieldsets
for _, fieldset in fieldsets do
  Lorry:generate "@lorry.project-vue/fieldset" { target = '@root', variables = fieldset }
end

-- Generate Toolbars
for _, toolbar in toolbars do
  Lorry:generate "@lorry.project-vue/toolbar" { target = '@root', variables = toolbar }
end

-- Generate Pages
for _, page in pages do
  Lorry:generate "@lorry.project-vue/page" { target = '@root', variables = page }
end

-- Generate Menus
for _, menu in menus do
  Lorry:generate "@lorry.project-vue/menu" { target = '@root', variables = menu }
end

-- Generate Widgets
for _, widget in widgets do
  Lorry:generate "@lorry.project-vue/widget" { target = '@root', variables = widget }
end

-- Generate Dialogs
for _, dialog in dialogs do
  Lorry:generate "@lorry.project-vue/dialog" { target = '@root', variables = dialog }
end

-- Generate Actions
for _, action in actions do
  Lorry:generate "@lorry.project-vue/action" { target = '@root', variables = action }
end

-- Generate Queries
for _, query in queries do
  Lorry:generate "@lorry.project-vue/query" { target = '@root', variables = query }
end
