<template>
  <div class="pagintion">
    <el-pagination
      @size-change="handleSizeChange"
      @current-change="handleCurrentChange"
      :current-page="pageConfig.currentPage"
      :page-sizes="[10, 30, 50, 100]"
      :page-size="pageConfig.pageSize"
      layout="total, sizes, prev, pager, next, jumper"
      :total="pageConfig.total"
    >
    </el-pagination>
  </div>
</template>

<script>
export default {
  name: 'pagintion',
  props: {
    pageConfig: {
      type: Object,
      default: () => {
        return {
          currentPage: 1,
          pageSize: 10,
          total: 400,
        };
      },
    },
  },
  data() {
    return {
      pageTion: {
        currentPage: 1,
        pageSize: 10,
        total: 400,
      },
    };
  },
  watch: {
    pageConfig: (v) => {
      this.pageTion = v;
    },
  },
  methods: {
    handlePageTion() {
      this.$emit('pageTionEvent', this.pageTion);
    },
    handleSizeChange(val) {
      this.pageTion.pageSize = val;
      this.handlePageTion();
      console.log(`每页 ${val} 条`);
    },
    handleCurrentChange(val) {
      this.pageTion.currentPage = val;
      this.handlePageTion();
      console.log(`当前页: ${val}`);
    },
  },
};
</script>
