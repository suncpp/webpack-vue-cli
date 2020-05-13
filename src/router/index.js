import Vue from 'vue';
import VueRouter from 'vue-router';

Vue.use(VueRouter);

const routes = [{
  path: '/tableTest',
  // eslint-disable-next-line no-undef
  component: resolve => require(['../views/tableTest.vue'], resolve)
}, {
  path: '/',
  // eslint-disable-next-line no-undef
  component: resolve => require(['../views/formetest.vue'], resolve)
}];

const router = new VueRouter({
  routes // routes: routes 的简写
});

export default router;
