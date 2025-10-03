--!strict

local EditorJS = require('@lorry.project-vue/lib/Control/EditorJS')

local projects = require('./projects')

local editors = {}

editors.editor_product_description = EditorJS
  :from(projects.project, 'product_description')

return editors
