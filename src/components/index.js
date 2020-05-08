import Vue from 'vue';
import publicForm from './publicForm.vue';
import pagintion from './pagintion.vue';
import publicTable from './publicTable.vue';

const comoponents = [
  publicForm,
  pagintion,
  publicTable
];

comoponents.forEach(item => {
  Vue.component(item.name, item);
});
