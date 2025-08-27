local Projection = require('@lorry.project-spring/lib/Resource/Projection')
local Action = require('@lorry.project-spring/lib/Resource/Action')
local Auth = require('@lorry.project-spring/lib/Resource/Auth')

local units = require('./units')

local projections = {}

export type Projections = typeof(projections)

projections.projection_system = Projection
  :from("system")
  :setup {
    Action:get "hasAnyAuthority('realm:developer', 'realm:admin', 'realm:support')";
    Action:select "hasAnyAuthority('realm:developer', 'realm:admin', 'realm:support')";
    Action:create("hasAnyAuthority('realm:developer', 'realm:admin', 'realm:support')"):setup {
      Action.Override:from_value("id", "generatorService.randomUUID()");
    };
    Action:remove "hasAnyAuthority('realm:developer', 'realm:admin', 'realm:support')";
    Action:delete "hasAnyAuthority('realm:developer', 'realm:admin', 'realm:support')";
    Action:update "hasAnyAuthority('realm:developer', 'realm:admin', 'realm:support')";
    Action:replace "hasAnyAuthority('realm:developer', 'realm:admin', 'realm:support')";
  }

projections.projection_system_named_dictionary = Projection
  :from("system")
  :setup {
    Action:get "hasAnyAuthority('realm:developer', 'realm:admin', 'realm:support')";
    Action:select "hasAnyAuthority('realm:developer', 'realm:admin', 'realm:support')";
    Action:create "hasAnyAuthority('realm:developer', 'realm:admin', 'realm:support')";
    Action:remove "hasAnyAuthority('realm:developer', 'realm:admin', 'realm:support')";
    Action:delete "hasAnyAuthority('realm:developer', 'realm:admin', 'realm:support')";
    Action:update "hasAnyAuthority('realm:developer', 'realm:admin', 'realm:support')";
    Action:replace "hasAnyAuthority('realm:developer', 'realm:admin', 'realm:support')";
  }

projections.projection_system_with_sequence = Projection
  :from("system")
  :setup {
    Action:get "hasAnyAuthority('realm:developer', 'realm:admin', 'realm:support')";
    Action:select "hasAnyAuthority('realm:developer', 'realm:admin', 'realm:support')";
    Action:create("hasAnyAuthority('realm:developer', 'realm:admin', 'realm:support')"):setup {
      Action.Override:from_value("id", "null");
    };
    Action:remove "hasAnyAuthority('realm:developer', 'realm:admin', 'realm:support')";
    Action:delete "hasAnyAuthority('realm:developer', 'realm:admin', 'realm:support')";
    Action:update "hasAnyAuthority('realm:developer', 'realm:admin', 'realm:support')";
    Action:replace "hasAnyAuthority('realm:developer', 'realm:admin', 'realm:support')";
  }

projections.projection_anonymous = Projection
  :from("anonymous")
  :setup {
    Action:get '';
    Action:select '';
  }

projections.projection_profile = Projection
  :from("profile")
  :setup {
    Auth:subject "customer_id";
    Projection.Filter:from_path('customer_id', 'context.customer_id');
    Projection.Override:from_context "customer_id";
    Action:get "isAuthenticated()";
    Action:select "isAuthenticated()";
    Action:create("isAuthenticated()"):setup {
      Action.Override:from_value("id", "generatorService.randomUUID()");
    };
    Action:remove("isAuthenticated()"):setup {
      Action.Validate:equals('entity.customer_id', 'context.customer_id'),
    };
    Action:delete "isAuthenticated()";
    Action:update "isAuthenticated()";
    Action:replace("isAuthenticated()"):setup {
      Action.Validate:equals('entity.customer_id', 'context.customer_id'),
    };
  }

projections.projection_profile_basket = Projection
  :from("profile")
  :setup {
    Auth:subject "customer_id";
    -- Projection.Filter:from_path('customer_id', "context.customer_id");
    Projection.Filter:from_path('basket_id', "basket.id");
    Projection.Override:from_context "customer_id";
    Action:get("isAuthenticated()"):setup {
      Action.Validate:equals('entity.basket.customer_id', 'context.customer_id'),
    };
    Action:select("isAuthenticated()"):setup {
      Action.Fetch:by_path(units.unit_payments_basket, 'basket', 'request.basket_id'):with_optional(),
      Action.Validate:equals('basket.customer_id', 'context.customer_id'),
    };
    Action:create("isAuthenticated()"):setup {
      Action.Fetch:by_path(units.unit_payments_basket, 'basket', 'request.basket_id'):with_optional(),
      Action.Validate:equals('basket.customer_id', 'context.customer_id'),
      Action.Override:from_value("id", "generatorService.randomUUID()");
    };
    Action:remove("isAuthenticated()"):setup {
      Action.Validate:equals('entity.basket.customer_id', 'context.customer_id'),
    };
    Action:delete "isAuthenticated()";
    Action:update("isAuthenticated()"):setup {
      Action.Fetch:by_path(units.unit_payments_basket, 'basket', 'request.basket_id'):with_optional(),
      Action.Validate:equals('basket.customer_id', 'context.customer_id'),
    },
    Action:replace("isAuthenticated()"):setup {
      Action.Fetch:by_path(units.unit_payments_basket, 'basket', 'request.basket_id'):with_optional(),
      Action.Validate:equals('basket.customer_id', 'context.customer_id'),
    };
  }

projections.projection_profile_attribute = Projection
  :from("profile")
  :setup {
    Auth:subject "customer_id";
    Action:upsert("isAuthenticated()"):with_route(''):setup {
      Projection.Override:from_context("id", "customer_id"):with_hidden();
      Projection.Override:from_hidden("email");
      Projection.Override:from_hidden("phone");
    };
    Action:find("isAuthenticated()"):with_route(''):setup {
      Projection.Override:from_context("id", "customer_id"):with_hidden();
      Projection.Override:from_hidden("email");
      Projection.Override:from_hidden("phone");
      Projection.Override:from_hidden("name");
      Projection.Override:from_hidden("surname");
      Projection.Override:from_hidden("patronymic");
    };
  }

projections.projection_profile_verify_phone = Projection
  :from("profile")
  :setup {
    Auth:subject "customer_id";
    Projection.Filter:from_path("customer_id", "context.customer_id");
    Projection.Override:from_context "customer_id";
    Action:get "isAuthenticated()";
    Action:select "isAuthenticated()";
    Action:create("isAuthenticated()"):setup {
      Action.Override:from_value("id", "generatorService.randomUUID()");
    };
    Action:update "isAuthenticated()";
    Action:delete "isAuthenticated()";
  }

projections.projection_profile_verify_email = Projection
  :from("profile")
  :setup {
    Auth:subject "customer_id";
    Projection.Filter:from_path("customer_id", "context.customer_id");
    Projection.Override:from_context "customer_id";
    Action:get "isAuthenticated()";
    Action:select "isAuthenticated()";
    Action:create("isAuthenticated()"):setup {
      Action.Override:from_value("id", "generatorService.randomUUID()");
    };
    Action:update "isAuthenticated()";
    Action:delete "isAuthenticated()";
  }

projections.projection_profile_payment = Projection
  :from("profile")
  :setup {
    -- User can see but cannot update his payments directly
    Auth:subject "customer_id";
    Projection.Filter:from_path("customer_id", "context.customer_id");
    Projection.Override:from_context "customer_id";
    Action:get "isAuthenticated()";
    Action:select "isAuthenticated()";
  }

projections.projection_profile_order = Projection
  :from("profile")
  :setup {
    -- User can submit an order and see order history
    Auth:subject "customer_id";
    Projection.Filter:from_path("customer_id", "context.customer_id");
    Projection.Override:from_context "customer_id";
    Action:get "isAuthenticated()";
    Action:select "isAuthenticated()";
    Action:create("isAuthenticated()"):setup {
      Action.Override:from_value("id", "generatorService.randomUUID()");
    };
  }

return projections