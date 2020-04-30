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

        <el-input-number
          v-if="item.type == 'number'"
          v-model="defaultValue[item.prop]"
          controls-position="right"
          :min="item.min ? item.min : 1"
          :max="item.max ? item.max : 10"
        ></el-input-number>

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

        <el-switch
          v-if="item.type == 'switch'"
          v-model="defaultValue[item.prop]"
          :active-color="item.swtchColorAndText ? item.swtchColorAndText.activecolor : '#13ce66'"
          :inactive-color="item.swtchColorAndText ? item.swtchColorAndText.inactivecolor  : '#ff4949'"
          :active-text="item.swtchColorAndText ? item.swtchColorAndText.activetext  : '启动'"
          :inactive-text="item.swtchColorAndText ? item.swtchColorAndText.inactivetext  : '关闭'"
        >
        </el-switch>
      </el-form-item>
      <!-- <el-form-item label="活动区域" prop="region">
        <el-select v-model="ruleForm.region" placeholder="请选择活动区域">
          <el-option label="区域一" value="shanghai"></el-option>
          <el-option label="区域二" value="beijing"></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="活动时间" required>
        <el-col :span="11">
          <el-form-item prop="date1">
            <el-date-picker
              type="date"
              placeholder="选择日期"
              v-model="ruleForm.date1"
              style="width: 100%;"
            ></el-date-picker>
          </el-form-item>
        </el-col>
        <el-col class="line" :span="2">-</el-col>
        <el-col :span="11">
          <el-form-item prop="date2">
            <el-time-picker
              placeholder="选择时间"
              v-model="ruleForm.date2"
              style="width: 100%;"
            ></el-time-picker>
          </el-form-item>
        </el-col>
      </el-form-item>
      <el-form-item label="即时配送" prop="delivery">
        <el-switch v-model="ruleForm.delivery"></el-switch>
      </el-form-item>
      <el-form-item label="活动性质" prop="type">
        <el-checkbox-group v-model="ruleForm.type">
          <el-checkbox label="美食/餐厅线上活动" name="type"></el-checkbox>
          <el-checkbox label="地推活动" name="type"></el-checkbox>
          <el-checkbox label="线下主题活动" name="type"></el-checkbox>
          <el-checkbox label="单纯品牌曝光" name="type"></el-checkbox>
        </el-checkbox-group>
      </el-form-item>
      <el-form-item label="特殊资源" prop="resource">
        <el-radio-group v-model="ruleForm.resource">
          <el-radio label="线上品牌商赞助"></el-radio>
          <el-radio label="线下场地免费"></el-radio>
        </el-radio-group>
      </el-form-item>
      <el-form-item label="活动形式" prop="desc">
        <el-input type="textarea" v-model="ruleForm.desc"></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="submitForm('ruleForm')"
          >立即创建</el-button
        >
        <el-button @click="resetForm('ruleForm')">重置</el-button>
      </el-form-item> -->
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
    'formModel': (v) => {
      this.defaultValue = v;
    },
    'formdescObj': {
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
  },
};
</script>
