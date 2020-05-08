<template>
  <div class="publicForm">
    <el-form
      :model="defaultValue"
      :rules="rules"
      ref="publicForm"
      label-width="100px"
      :key="formKey"
    >
      <el-form-item
        v-for="(item, index) in formdescObj"
        :key="index"
        :label="item.label"
        :prop="item.prop"
      >
        <!-- solt -->
        <template v-if="item.type === 'slot'">
          <slot :name="'form-' + item.prop"></slot>
        </template>

        <el-input
          v-if="item.type == undefined || item.type == 'text'"
          v-model="defaultValue[item.prop]"
          :disabled="item.disabled ? item.disabled : disabled"
          :placeholder="item.placeholder ? item.placeholder : '请输入内容'"
          v-show="item.isShow == undefined ? isShow : item.isShow"
          :clearable="item.clearable"
        />

        <el-input
          v-if="item.type == 'password'"
          type="password"
          v-model="defaultValue[item.prop]"
          :disabled="item.disabled ? item.disabled : disabled"
          :placeholder="item.placeholder ? item.placeholder : '请输入内容'"
          v-show="item.isShow == undefined ? isShow : item.isShow"
          :clearable="item.clearable"
        />

        <el-input
          v-if="item.type == 'textarea'"
          type="textarea"
          :autosize="item.autosize ? item.autosize : { minRows: 2, maxRows: 4 }"
          v-model="defaultValue[item.prop]"
          :disabled="item.disabled ? item.disabled : disabled"
          :placeholder="item.placeholder ? item.placeholder : '请输入内容'"
          v-show="item.isShow == undefined ? isShow : item.isShow"
          :clearable="item.clearable"
        />

        <!-- <el-input-number
          v-if="item.type == 'number'"
          v-model="defaultValue[item.prop]"
          controls-position="right"
          :min="item.min ? item.min : 1"
          :max="item.max ? item.max : 10"
        ></el-input-number> -->

        <el-input
          v-if="item.type == 'number'"
          type="number"
          v-model="defaultValue[item.prop]"
          :disabled="item.disabled ? item.disabled : disabled"
          :placeholder="item.placeholder ? item.placeholder : '请输入内容'"
          v-show="item.isShow == undefined ? isShow : item.isShow"
          :clearable="item.clearable"
          :min="item.min ? item.min : 1"
          :max="item.max ? item.max : 10"
        />

        <el-select
          v-if="item.type == 'select'"
          v-model="defaultValue[item.prop]"
          :placeholder="item.placeholder ? item.placeholder : '请选择'"
          :clearable="item.clearable"
        >
          <el-option
            v-for="option in item.list"
            :key="defaultValue.value ? item[defaultValue.value] : option.value"
            :label="
              defaultValue.label ? item[defaultValue.label] : option.label
            "
            :value="
              defaultValue.value ? item[defaultValue.value] : option.value
            "
          >
          </el-option>
        </el-select>

        <el-select
          v-if="item.type == 'select' && item.remote"
          v-model="defaultValue[item.prop]"
          remote
          filterable
          :placeholder="item.placeholder ? item.placeholder : '请输入关键词'"
          :remote-method="item.event"
        >
          <!-- @change="handleEvent(item.event, data[item.value])" -->
          <el-option
            v-for="option in item.list"
            :key="defaultValue.value ? item[defaultValue.value] : option.value"
            :label="
              defaultValue.label ? item[defaultValue.label] : option.label
            "
            :value="
              defaultValue.value ? item[defaultValue.value] : option.value
            "
          >
          </el-option>
        </el-select>

        <el-switch
          v-if="item.type == 'switch'"
          v-model="defaultValue[item.prop]"
          :active-color="
            item.swtchColorAndText
              ? item.swtchColorAndText.activecolor
              : '#13ce66'
          "
          :inactive-color="
            item.swtchColorAndText
              ? item.swtchColorAndText.inactivecolor
              : '#ff4949'
          "
          :active-text="
            item.swtchColorAndText ? item.swtchColorAndText.activetext : '启动'
          "
          :inactive-text="
            item.swtchColorAndText
              ? item.swtchColorAndText.inactivetext
              : '关闭'
          "
        >
        </el-switch>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
export default {
  name: 'publicForm',
  props: {
    formdescObj: {
      type: Array,
      required: true,
    },
    formModel: {
      type: Object,
      required: true,
    },
    rules: {
      type: Object,
      default: () => {
        return {};
      },
    },
  },
  created() {
    this.defaultValue = this.formModel;
  },
  watch: {
    formModel: (v) => {
      this.defaultValue = v;
    },
    formdescObj: {
      handler: () => {
        this.formKey += 1;
      },
      deep: true,
    },
  },
  data() {
    return {
      defaultValue: {},
      formKey: 0,
      disabled: false,
      isShow: true,
    };
  },
  methods: {
    async getFormValue() {
      const resVal = await this.$refs.publicForm.validate();
      console.log(resVal);
      if (resVal) {
        return this.defaultValue;
      }
      return false;
    },
    resetForm() {
      this.$refs.publicForm.resetFields();
    },

     // 绑定的相关事件
    // handleEvent (evnet) {
    //   this.$emit('handleEvent', evnet);
    // }
  },
};
</script>
