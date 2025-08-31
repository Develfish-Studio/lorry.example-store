local DDL = require('@lorry.project-spring/lib/DDL')

local projects = require('./projects')
local units = require('./units')

local statements = {}

-- Profile

statements.ddl_profile_customer = DDL:from(projects.project_ddl, units.unit_profile_customer)
statements.ddl_profile_customer_verify_email = DDL:from(projects.project_ddl, units.unit_profile_customer_verify_email)
statements.ddl_profile_customer_verify_phone = DDL:from(projects.project_ddl, units.unit_profile_customer_verify_phone)
statements.ddl_profile_agent = DDL:from(projects.project_ddl, units.unit_profile_agent)
statements.ddl_profile_customer_bonus = DDL:from(projects.project_ddl, units.unit_profile_customer_bonus)

-- Events

statements.ddl_events_event = DDL:from(projects.project_ddl, units.unit_events_event)
statements.ddl_events_event_topic_info = DDL:from(projects.project_ddl, units.unit_events_event_topic_info)
statements.ddl_events_event_source_info = DDL:from(projects.project_ddl, units.unit_events_event_source_info)
statements.ddl_events_event_type_info = DDL:from(projects.project_ddl, units.unit_events_event_type_info)
statements.ddl_events_subscription = DDL:from(projects.project_ddl, units.unit_events_subscription)
statements.ddl_events_subscription_type = DDL:from(projects.project_ddl, units.unit_events_subscription_type)
statements.ddl_events_dispatch = DDL:from(projects.project_ddl, units.unit_events_dispatch)
statements.ddl_events_dispatch_type = DDL:from(projects.project_ddl, units.unit_events_dispatch_type)
statements.ddl_events_dispatch_status = DDL:from(projects.project_ddl, units.unit_events_dispatch_status)
statements.ddl_events_template = DDL:from(projects.project_ddl, units.unit_events_template)
statements.ddl_events_template_type = DDL:from(projects.project_ddl, units.unit_events_template_type)
statements.ddl_events_template_shape = DDL:from(projects.project_ddl, units.unit_events_template_shape)

-- Catalog

statements.ddl_catalog_image_type = DDL:from(projects.project_ddl, units.unit_catalog_image_type)
statements.ddl_catalog_attachment_type = DDL:from(projects.project_ddl, units.unit_catalog_attachment_type)
statements.ddl_catalog_source_type = DDL:from(projects.project_ddl, units.unit_catalog_source_type)
statements.ddl_catalog_region = DDL:from(projects.project_ddl, units.unit_catalog_region)
statements.ddl_catalog_shop = DDL:from(projects.project_ddl, units.unit_catalog_shop)
statements.ddl_catalog_category = DDL:from(projects.project_ddl, units.unit_catalog_category)
statements.ddl_catalog_product = DDL:from(projects.project_ddl, units.unit_catalog_product)
statements.ddl_catalog_product_image = DDL:from(projects.project_ddl, units.unit_catalog_product_image)
statements.ddl_catalog_product_attachment = DDL:from(projects.project_ddl, units.unit_catalog_product_attachment)
statements.ddl_catalog_item = DDL:from(projects.project_ddl, units.unit_catalog_item)
statements.ddl_catalog_promotion = DDL:from(projects.project_ddl, units.unit_catalog_promotion)
statements.ddl_catalog_promotion_type = DDL:from(projects.project_ddl, units.unit_catalog_promotion_type)
statements.ddl_catalog_promotion_target = DDL:from(projects.project_ddl, units.unit_catalog_promotion_target)
statements.ddl_catalog_promotion_image = DDL:from(projects.project_ddl, units.unit_catalog_promotion_image)

-- Payments

statements.ddl_payments_favorite = DDL:from(projects.project_ddl, units.unit_payments_favorite)
statements.ddl_payments_basket = DDL:from(projects.project_ddl, units.unit_payments_basket)
statements.ddl_payments_basket_entry = DDL:from(projects.project_ddl, units.unit_payments_basket_entry)
statements.ddl_payments_order_status = DDL:from(projects.project_ddl, units.unit_payments_order_status)
statements.ddl_payments_order_type = DDL:from(projects.project_ddl, units.unit_payments_order_type)
statements.ddl_payments_order = DDL:from(projects.project_ddl, units.unit_payments_order)
statements.ddl_payments_order_entry = DDL:from(projects.project_ddl, units.unit_payments_order_entry)
statements.ddl_payments_order_discount = DDL:from(projects.project_ddl, units.unit_payments_order_discount)
statements.ddl_payments_payment_status = DDL:from(projects.project_ddl, units.unit_payments_payment_status)
statements.ddl_payments_payment_type = DDL:from(projects.project_ddl, units.unit_payments_payment_type)
statements.ddl_payments_payment = DDL:from(projects.project_ddl, units.unit_payments_payment)

-- Structure

statements.ddl_structure_network = DDL:from(projects.project_ddl, units.unit_structure_network)
statements.ddl_structure_network_type = DDL:from(projects.project_ddl, units.unit_structure_network_type)
statements.ddl_structure_guide = DDL:from(projects.project_ddl, units.unit_structure_guide)
statements.ddl_structure_guide_subject = DDL:from(projects.project_ddl, units.unit_structure_guide_subject)

return statements