--!strict

local Widget = require('@lorry.project-vue/lib/Widget')

local projects = require('./projects')

local widgets = {}

widgets.widget_personal_profile = Widget
  :from(projects.project, 'personal_profile')

widgets.widget_dispatch_message = Widget
  :from(projects.project, 'dispatch_message')

return widgets
