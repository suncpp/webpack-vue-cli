<template>
  <div>
    <publicTable
      :tableConfig="tableConfig"
      :tableHead="tableHead"
      :tableData="tableData"
      :options="options"
      :isShow="isShow"
      @handleBtn="handleBtn"
    >
    </publicTable>
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
        {
          label: '是否通过',
          prop: 'isYes',
          type: 'switch'
        },
      ],
      tableData: [
        ['2016-05-02', '王小虎', '上海市普陀区金沙江路 1518 弄', true],
        ['2016-05-02', '王小虎', '上海市普陀区金沙江路 1518 弄', false],
        ['2016-05-02', '王小虎', '上海市普陀区金沙江路 1518 弄', true],
        ['2016-05-02', '王小虎', '上海市普陀区金沙江路 1518 弄', false],
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
      isShow: ['isYes']
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
