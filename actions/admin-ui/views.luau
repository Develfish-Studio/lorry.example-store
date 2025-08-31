--!strict

local View = require('@lorry.project-vue/lib/View/View')

local projects = require('./projects')
local remotes = require('./remotes')

local views = {}

views.view_personal = View
  :from(projects.project, 'personal')
  :setup {
    View.Socket:from_remote(remotes.remote_events, 'ws', 'events'),
    View.Subscription:from('events'):setup {
      View.Subscription.Selector:from()
        :with_header('channel', 'public_dispatch'),
    },
  }

views.view_admin = View
  :from(projects.project, 'admin')
  :setup {
    View.Socket:from_remote(remotes.remote_events, 'ws', 'events'),
    View.Subscription:from('events'):setup {
      View.Subscription.Selector:from()
        :with_header('channel', 'public_dispatch'),
    },
  }

return views