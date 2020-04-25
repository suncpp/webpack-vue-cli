<!--
 * @Author: caopengpeng
 * @Date: 2020-04-25 16:08:54
 * @LastEditors: caopengpeng
 * @LastEditTime: 2020-04-25 17:04:20
 * @Description: 文件描述
 -->

<template lang="html">
  <div class="test">
    {{ test }}
  </div>
</template>

<script>
export default {
  data() {
    return {
      test: "简单构建vue脚手架项目",
    };
  },
};
</script>

<style>
.test {
  color: red;
}
</style>
