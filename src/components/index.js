import Vue from 'vue';
import publicForm from './publicForm.vue';

const comoponents = [
  publicForm
];

comoponents.forEach(item => {
  Vue.component(item.name, item);
});
