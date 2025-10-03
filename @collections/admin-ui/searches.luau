--!strict

local Search = require('@lorry.project-vue/lib/Control/Search')

local requests = require('./requests')

local searches = {}

searches.search_customer_id = Search
  :from_request(requests.request_customer_select, 'customer_id')
  :with_field_name 'fullName'
  :with_field_description 'email'

return searches