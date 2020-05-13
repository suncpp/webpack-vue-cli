<template>
  <div>
    <publicTable
      :tableConfig="tableConfig"
      :tableHead="tableHead"
      :tableData="tableData"
      :options="options"
      @handleBtn="handleBtn"
    ></publicTable>
  </div>
</template>
<script>
export default {
  data() {
    return {
      tableConfig: {
        stripe: true,
        border: true,
        height: '250',
        isOptionsSlot: false,
        isIndex: true,
        isSelection: true,
      },
      tableHead: [
        {
          label: '日期',
          prop: 'date',
          width: '180',
          fixed: true, // 或者left,right
        },
        {
          label: '姓名',
          prop: 'name',
          width: '180',
        },
        {
          label: '地址',
          prop: 'address',
        },
      ],
      tableData: [
        {
          date: '2016-05-02',
          name: '王小虎',
          address: '上海市普陀区金沙江路 1518 弄',
        },
        {
          date: '2016-05-04',
          name: '王小虎',
          address: '上海市普陀区金沙江路 1517 弄',
        },
        {
          date: '2016-05-01',
          name: '王小虎',
          address: '上海市普陀区金沙江路 1519 弄',
        },
        {
          date: '2016-05-03',
          name: '王小虎',
          address: '上海市普陀区金沙江路 1516 弄',
        },
      ],
      options: [
        {
          type: 'success',
          label: '通过',
          prop: 'yes',
          // isShow: (item) => {
          //   return item.status == 0 ? false : true;
          // },
        },
      ],
    };
  },
  mounted() {},
  methods: {
    handleBtn(btn, indx, row) {
      console.log(btn, indx, row);
    },
  },
};
</script>
