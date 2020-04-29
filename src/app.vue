<!--
 * @Author: caopengpeng
 * @Date: 2020-04-25 16:08:54
 * @LastEditors: caopengpeng
 * @LastEditTime: 2020-04-25 17:04:20
 * @Description: 文件描述
 -->

<template lang="html">
  <div class="test">
    <span>绿色</span>
    {{ test }}
    <el-button>默认按钮</el-button>
    <el-button type="primary">主要按钮</el-button>
    <el-button type="success">成功按钮</el-button>
    <el-button type="info">信息按钮</el-button>
    <el-button type="warning">警告按钮</el-button>
    <el-button type="danger">危险按钮</el-button>
  </div>
</template>

<script>
export default {
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

</style>
