/*
 * @Author: caopengpeng
 * @Date: 2020-04-25 16:08:48
 * @LastEditors: caopengpeng
 * @LastEditTime: 2020-04-25 16:09:47
 * @Description: 文件描述
 */
import Vue from 'vue';
import App from './app.vue';
import { Button, Select } from 'element-ui';

Vue.component(Button.name, Button);
Vue.component(Select.name, Select);

new Vue({
    el: '#app',
    render: h => h(App)
})