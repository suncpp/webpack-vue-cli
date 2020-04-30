<!--
 * @Author: caopengpeng
 * @Date: 2020-04-25 16:08:54
 * @LastEditors: caopengepng
 * @LastEditTime: 2020-04-30 10:00:06
 * @Description: 文件描述
 -->

<template>
  <div>
    <test> </test>
  </div>
</template>

<script>
import test from './views/test';

export default {
  components: {
    test
  },
  data() {
    return {
      test: '简单构建vue脚手架项目'
    };
  },
  mounted() {
    const arr = [1,2,3].map((item) => {
      return item + 2;
    });
    console.log(arr);
  }
};
</script>

<style lang="less">
  .test{
    color: red;
  }
</style>
