--!strict

local Root = require('@lorry.project-vue/lib/Root/Root')

local projects = require('./projects')

local roots = {}

roots.root = Root
  :from(projects.project)
  :with_router('personal')
  :with_router('admin')
  :with_menu('personal')
  :with_menu('orders')
  :with_menu('profiles')
  :with_menu('catalogue')
  :with_menu('notifications')
  :with_menu('structure')
  :with_menu('dictionaries')

return roots
