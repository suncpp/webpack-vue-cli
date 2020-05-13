<template>
  <div class="publicTable">
    <el-table
      :data="tableData"
      style="width: 100%"
      :stripe="tableConfig.stripe"
      :border="tableConfig.border"
      :height="tableConfig.height"
    >
      <el-table-column
        type="selection"
        width="55"
        v-if="tableConfig.isSelection"
      >
      </el-table-column>

      <!-- 自己坑了自己一把，tableHead中用了fixed,所以index老是不对，在index加上fixed就好了 -->
      <el-table-column
        type="index"
        width="50"
        fixed="left"
        v-if="tableConfig.isIndex"
      />

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

      <!-- 自定义按钮 -->
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
  props: {
    tableConfig: {
      type: Object,
      required: true
    },
    tableHead: {
      type: Array,
      default: () => {
        return [];
      }
    },
    tableData: {
      type: Array,
      default: () => {
        return [];
      }
    },
    options: {
      type: Array,
      default: () => {
        return [];
      }
    }
  },
  data() {
    return {
     
    };
  },
  methods: {
    handleBtn(btn, indx, row) {
      this.$emit('handleBtn', btn, indx, row);
    },
  },
};
</script>
