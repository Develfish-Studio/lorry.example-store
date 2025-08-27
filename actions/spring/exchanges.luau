--!strict

local Exchange = require('@lorry.project-spring/lib/Exchange/Exchange')
local Topic = require('@lorry.project-spring/lib/Exchange/Topic')

local modules = require('./modules')

local exchanges = {}

exchanges.exchange_service_events = Exchange
  :from(modules.service_events)
  :setup {
    Topic:from('public_customers'),
    Topic:from('public_category'),
    Topic:from('public_product'),
    Topic:from('public_dispatch'),
  }

exchanges.exchange_service_catalog = Exchange
  :from(modules.service_catalog)
  :setup {
    Topic:from('public_category'),
    Topic:from('public_product'),
  }

exchanges.exchange_service_payments = Exchange
  :from(modules.service_payments)
  :setup {
    Topic:from('public_order'),
    Topic:from('public_payment'),
  }

exchanges.exchange_service_profile = Exchange
  :from(modules.service_profile)
  :setup {
    Topic:from('public_customers'),
    Topic:from('verify_phone'),
    Topic:from('verify_email'),
    Topic:from('update_phone'),
    Topic:from('update_email'),
  }

exchanges.exchange_gateway_payments = exchanges.exchange_service_payments
  :copy()
  :with_module(modules.gateway_payments)

exchanges.exchange_gateway_profile = exchanges.exchange_service_profile
  :copy()
  :with_module(modules.gateway_profile)

exchanges.exchange_gateway_events = exchanges.exchange_service_events
  :copy()
  :with_module(modules.gateway_events)

return exchanges
