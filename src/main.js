/*
 * @Author: caopengpeng
 * @Date: 2020-04-25 16:08:48
 * @LastEditors: caopengpeng
 * @LastEditTime: 2020-04-25 16:09:47
 * @Description: 文件描述
 */
import Vue from 'vue';
import App from './app.vue';
import './elementui/index';
import './components/index';


// 引入路由
import router from "./router/index";   // import router 的router 一定要小写， 不要写成Router, 否则报can't match的报错

new Vue({
    el: '#app',
    router,
    render: h => h(App)
});
