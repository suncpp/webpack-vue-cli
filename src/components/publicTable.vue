<template>
  <div class="publicTable">
    <el-table
      :data="tableData"
      style="width: 100%"
      :stripe="tableConfig.stripe"
      :border="tableConfig.border"
      :height="tableConfig.height"
    >
      <template v-for="(item, index) in tableHead">
        <el-table-column
          :key="index"
          :prop="item.prop"
          :label="item.label"
          :width="item.width"
          :fixed="item.fixed"
        >
        </el-table-column>
      </template>

      <template v-if="tableConfig.isOptionsSlot">
        <slot name="slot-buttons"></slot>
      </template>
      <template v-if="!tableConfig.isOptionsSlot && options.length > 0">
        <el-table-column label="操作">
          <template slot-scope="scope">
            <el-button
              v-for="(btn, indx) in options"
              :key="indx"
              :type="btn.type"
              size="small"
              @click="handleBtn(btn, indx, scope.row)"
              >{{ btn.label }}</el-button
            >
          </template>
        </el-table-column>
      </template>
    </el-table>
  </div>
</template>

<script>
export default {
  name: 'publicTable',
  data() {
    return {
      tableConfig: {
        stripe: true,
        border: true,
        height: '250',
        isOptionsSlot: false,
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
  methods: {
    handleBtn(btn, indx, row) {
      this.$emit('handleBtn', btn, indx, row);
    },
  },
};
</script>
