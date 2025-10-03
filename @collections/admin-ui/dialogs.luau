--!strict

local Dialog = require('@lorry.project-vue/lib/Dialog/Dialog')

local projects = require('./projects')
local requests = require('./requests')
local structures = require('./structures')
local selects = require('./selects')
local uploads = require('./uploads')
local editors = require('./editors')

local dialogs = {}

dialogs.dialog_dispatch_message = Dialog
  :from(projects.project, 'dispatch_message')

dialogs.dialog_network_create = Dialog
  :from(projects.project, 'network_create')
  :setup {
    Dialog.Field:from_select(selects.select_network_type, 'type_id'),
    Dialog.Field:from_select(selects.select_shop_id, 'shop_id'),
    Dialog.Field:from_text('name'),
    Dialog.Field:from_text('password'),
    Dialog.Field:from_toggle('hidden'),

    Dialog.Call
      :from_submit(requests.request_network_create, {
        token = 'token',
        payload = 'form',
      })
  }

dialogs.dialog_guide_subject_create = Dialog
  :from(projects.project, 'guide_subject_create')
  :setup {
    Dialog.Field:from_text('name'),
    Dialog.Field:from_number('position'),
    Dialog.Call
      :from_submit(requests.request_guide_subject_create, {
        token = 'token',
        payload = 'form',
      })
  }

dialogs.dialog_guide_create = Dialog
  :from(projects.project, 'guide_create')
  :setup {
    Dialog.Field:from_text('name'),
    Dialog.Field:from_text('link'),
    Dialog.Field:from_number('position'),
    Dialog.Field:from_select(selects.select_guide_subject, 'subject_id'),
    Dialog.Field:from_upload_s3(uploads.upload_guide_attachment, 'attachment'),

    Dialog.Call
      :from_submit(requests.request_guide_create, {
        token = 'token',
        payload = 'form',
      })
  }

dialogs.dialog_product_create = Dialog
  :from(projects.project, 'product_create')
  :setup {
    Dialog.Field:from_text('name'),
    Dialog.Field:from_editor_js(editors.editor_product_description, 'description'),
    Dialog.Field:from_text('price'),
    Dialog.Field:from_text('ean13'),
    Dialog.Field:from_select(selects.select_category_id, 'category_id'),

    Dialog.Call
      :from_submit(requests.request_product_create, {
        token = 'token',
        payload = 'form',
      })
  }

dialogs.dialog_product_update = Dialog
  :from(projects.project, 'product_update')
  :setup {
    Dialog.Prop
      :from_structure('product', structures.structure_public_product_record),

    Dialog.Field
      :from_text('name')
      :with_expression('props.product.name'),
    Dialog.Field
      :from_editor_js(editors.editor_product_description, 'description')
      :with_expression('props.product.description'),
    Dialog.Field
      :from_text('price')
      :with_expression('props.product.price'),
    Dialog.Field
      :from_text('ean13')
      :with_expression('props.product.ean13'),
    Dialog.Field
      :from_select(selects.select_category_id, 'category_id')
      :with_expression('props.product.categoryId'),

    Dialog.Call
      :from_submit(requests.request_product_update, {
        token = 'token',
        productId = 'props.product.id',
        payload = 'form',
      })
  }

return dialogs
