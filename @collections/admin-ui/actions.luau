local Action = require('@lorry.project-vue/lib/Action')

local projects = require('./projects')
local dialogs = require('./dialogs')
local requests = require('./requests')
local structures = require('./structures')

local actions = {}

-- Open create dialog

actions.action_dispatch_message_open_dialog = Action
  :from(projects.project, 'dispatch_message')
  :setup {
    Action.Dialog:from(dialogs.dialog_dispatch_message)
  }

actions.action_product_create_open_dialog = Action
  :from(projects.project, 'create_product')
  :setup {
    Action.Dialog:from(dialogs.dialog_product_create),
  }

actions.action_network_create_open_dialog = Action
  :from(projects.project, 'create_network')
  :setup {
    Action.Dialog:from(dialogs.dialog_network_create),
  }

actions.action_guide_create_open_dialog = Action
  :from(projects.project, 'create_guide')
  :setup {
    Action.Dialog:from(dialogs.dialog_guide_create),
  }

actions.action_guide_subject_create_open_dialog = Action
  :from(projects.project, 'create_guide_subject')
  :setup {
    Action.Dialog:from(dialogs.dialog_guide_subject_create),
  }

-- Open update dialog

actions.action_product_update_open_dialog = Action
  :from(projects.project, 'update_product')
  :setup {
    Action.Prop:from_type('productId'),
    Action.Fetch:from(requests.request_product_get, 'product', { token = 'token', productId = 'props.productId' }),
    Action.Dialog:from(dialogs.dialog_product_update, { product = 'context.product' }),
  }

-- Remove selected

actions.action_product_remove_selected = Action
  :from(projects.project, 'product_remove_selected')
  :setup {
    Action.Prop:from_structure_array('items', structures.structure_public_product_record),
    Action.Request:from(requests.request_product_remove_all, { token = 'token', payload = 'props.items' }),
  }

actions.action_guide_subject_remove_selected = Action
  :from(projects.project, 'guide_subject_remove_selected')
  :setup {
    Action.Prop:from_structure_array('items', structures.structure_public_guide_subject_record),
    Action.Request:from(requests.request_guide_subject_remove_all, { token = 'token', payload = 'props.items' }),
  }

actions.action_guide_remove_selected = Action
  :from(projects.project, 'guide_remove_selected')
  :setup {
    Action.Prop:from_structure_array('items', structures.structure_public_guide_record),
    Action.Request:from(requests.request_guide_remove_all, { token = 'token', payload = 'props.items' }),
  }

actions.action_dispatch_message_remove_selected = Action
  :from(projects.project, 'dispatch_remove_selected')
  :setup {
    Action.Prop:from_structure_array('items', structures.structure_public_dispatch_record),
    Action.Request:from(requests.request_dispatch_remove_all, { token = 'token', payload = 'props.items' }),
  }

actions.action_network_remove_selected = Action
  :from(projects.project, 'network_remove_selected')
  :setup {
    Action.Prop:from_structure_array('items', structures.structure_public_network_record),
    Action.Request:from(requests.request_network_remove_all, { token = 'token', payload = 'props.items' }),
  }

return actions
