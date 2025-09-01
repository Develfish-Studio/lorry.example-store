import ViewAdmin from '../components/views/ViewAdmin.vue'
import PageCustomers from '../components/pages/PageCustomers.vue'
import PageCustomerInfo from '../components/pages/PageCustomerInfo.vue'
import PageAgents from '../components/pages/PageAgents.vue'
import PageAgentInfo from '../components/pages/PageAgentInfo.vue'
import PageOrders from '../components/pages/PageOrders.vue'
import PageOrderInfo from '../components/pages/PageOrderInfo.vue'
import PagePayments from '../components/pages/PagePayments.vue'
import PageCategories from '../components/pages/PageCategories.vue'
import PageProducts from '../components/pages/PageProducts.vue'
import PageProductInfo from '../components/pages/PageProductInfo.vue'
import PageItems from '../components/pages/PageItems.vue'
import PageRegions from '../components/pages/PageRegions.vue'
import PageShops from '../components/pages/PageShops.vue'
import PageOrderTypes from '../components/pages/PageOrderTypes.vue'
import PageOrderStatuses from '../components/pages/PageOrderStatuses.vue'
import PagePaymentTypes from '../components/pages/PagePaymentTypes.vue'
import PagePaymentStatuses from '../components/pages/PagePaymentStatuses.vue'
import PageSourceTypes from '../components/pages/PageSourceTypes.vue'
import PagePromotionTypes from '../components/pages/PagePromotionTypes.vue'
import PagePromotions from '../components/pages/PagePromotions.vue'
import PageEvents from '../components/pages/PageEvents.vue'
import PageEventSources from '../components/pages/PageEventSources.vue'
import PageEventTypes from '../components/pages/PageEventTypes.vue'
import PageEventTopics from '../components/pages/PageEventTopics.vue'
import PageSubscriptions from '../components/pages/PageSubscriptions.vue'
import PageSubscriptionTypes from '../components/pages/PageSubscriptionTypes.vue'
import PageDispatches from '../components/pages/PageDispatches.vue'
import PageDispatchStatuses from '../components/pages/PageDispatchStatuses.vue'
import PageDispatchTypes from '../components/pages/PageDispatchTypes.vue'
import PageTemplates from '../components/pages/PageTemplates.vue'
import PageTemplateShapes from '../components/pages/PageTemplateShapes.vue'
import PageTemplateTypes from '../components/pages/PageTemplateTypes.vue'
import PageNetworks from '../components/pages/PageNetworks.vue'
import PageNetworkTypes from '../components/pages/PageNetworkTypes.vue'
import PageGuides from '../components/pages/PageGuides.vue'
import PageGuideInfo from '../components/pages/PageGuideInfo.vue'
import PageGuideSubjects from '../components/pages/PageGuideSubjects.vue'
import PageGuideSubjectInfo from '../components/pages/PageGuideSubjectInfo.vue'

export const adminRouter = {
  path: '/admin',
  component: ViewAdmin,
  children: [
    {
      path: 'customers',
      component: PageCustomers,
      props: true,
    },
    {
      path: 'customers/:customerId',
      component: PageCustomerInfo,
      props: true,
    },
    {
      path: 'agents',
      component: PageAgents,
      props: true,
    },
    {
      path: 'agents/:agentId',
      component: PageAgentInfo,
      props: true,
    },
    {
      path: 'orders',
      component: PageOrders,
      props: true,
    },
    {
      path: 'orders/:orderId',
      component: PageOrderInfo,
      props: true,
    },
    {
      path: 'payments',
      component: PagePayments,
      props: true,
    },
    {
      path: 'categories',
      component: PageCategories,
      props: true,
    },
    {
      path: 'products',
      component: PageProducts,
      props: true,
    },
    {
      path: 'products/:productId',
      component: PageProductInfo,
      props: true,
    },
    {
      path: 'items',
      component: PageItems,
      props: true,
    },
    {
      path: 'regions',
      component: PageRegions,
      props: true,
    },
    {
      path: 'shops',
      component: PageShops,
      props: true,
    },
    {
      path: 'order_types',
      component: PageOrderTypes,
      props: true,
    },
    {
      path: 'order_statuses',
      component: PageOrderStatuses,
      props: true,
    },
    {
      path: 'payment_types',
      component: PagePaymentTypes,
      props: true,
    },
    {
      path: 'payment_statuses',
      component: PagePaymentStatuses,
      props: true,
    },
    {
      path: 'source_types',
      component: PageSourceTypes,
      props: true,
    },
    {
      path: 'promotion_types',
      component: PagePromotionTypes,
      props: true,
    },
    {
      path: 'promotions',
      component: PagePromotions,
      props: true,
    },
    {
      path: 'events',
      component: PageEvents,
      props: true,
    },
    {
      path: 'event_sources',
      component: PageEventSources,
      props: true,
    },
    {
      path: 'event_types',
      component: PageEventTypes,
      props: true,
    },
    {
      path: 'event_topics',
      component: PageEventTopics,
      props: true,
    },
    {
      path: 'subscriptions',
      component: PageSubscriptions,
      props: true,
    },
    {
      path: 'subscription_types',
      component: PageSubscriptionTypes,
      props: true,
    },
    {
      path: 'dispatches',
      component: PageDispatches,
      props: true,
    },
    {
      path: 'dispatch_statuses',
      component: PageDispatchStatuses,
      props: true,
    },
    {
      path: 'dispatch_types',
      component: PageDispatchTypes,
      props: true,
    },
    {
      path: 'templates',
      component: PageTemplates,
      props: true,
    },
    {
      path: 'template_shapes',
      component: PageTemplateShapes,
      props: true,
    },
    {
      path: 'template_types',
      component: PageTemplateTypes,
      props: true,
    },
    {
      path: 'networks',
      component: PageNetworks,
      props: true,
    },
    {
      path: 'network_types',
      component: PageNetworkTypes,
      props: true,
    },
    {
      path: 'guides',
      component: PageGuides,
      props: true,
    },
    {
      path: 'guides/:guideId',
      component: PageGuideInfo,
      props: true,
    },
    {
      path: 'guide_subjects',
      component: PageGuideSubjects,
      props: true,
    },
    {
      path: 'guide_subjects/:subjectId',
      component: PageGuideSubjectInfo,
      props: true,
    },
    {
      path: '',
      redirect: '/admin/customers'
    }
  ]
}
