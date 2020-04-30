<template>
  <div>
    <publicForm
      :formdescObj="formdescObj"
      :formModel="formModel"
      :rules="rules"
      ref="form"
    />
    <el-button @click="submitForm"> 提交 </el-button>
    <el-button @click="resetForm"> 重置 </el-button>
  </div>
</template>
<script>
export default {
  data() {
    return {
      formdescObj: [
        {
          label: '名称',
          prop: 'region',
          type: 'select',
          list: [
            {
              value: '选项1',
              label: '黄金糕',
            },
            {
              value: '选项2',
              label: '双皮奶',
            },
            {
              value: '选项3',
              label: '蚵仔煎',
            },
            {
              value: '选项4',
              label: '龙须面',
            },
            {
              value: '选项5',
              label: '北京烤鸭',
            },
          ],
        },
        {
          lable: '开关',
          prop: 'delivery',
          type: 'switch',
          swtchColorAndText: {
            activecolor: '#13ce66',
            inactivecolor: '#ff4949',
            activetext: '按月付费',
            inactivetext: '按年付费',
          },
        },
      ],
      formModel: this.initxx(),
      rules: {
        name: [
          { required: true, message: '请输入活动名称', trigger: 'blur' },
          { min: 3, max: 5, message: '长度在 3 到 5 个字符', trigger: 'blur' },
        ],
        region: [
          { required: true, message: '请选择活动区域', trigger: 'change' },
        ],
        date1: [
          {
            type: 'date',
            required: true,
            message: '请选择日期',
            trigger: 'change',
          },
        ],
        date2: [
          {
            type: 'date',
            required: true,
            message: '请选择时间',
            trigger: 'change',
          },
        ],
        type: [
          {
            type: 'array',
            required: true,
            message: '请至少选择一个活动性质',
            trigger: 'change',
          },
        ],
        resource: [
          { required: true, message: '请选择活动资源', trigger: 'change' },
        ],
        desc: [{ required: true, message: '请填写活动形式', trigger: 'blur' }],
      },
    };
  },
  mounted() {
    this.initxx();
  },
  methods: {
    initxx() {
      return {
        name: '',
        region: '',
        date1: '',
        date2: '',
        delivery: false,
        type: [],
        resource: '',
        desc: '',
      };
    },
    submitForm() {
      this.$refs.form.getFormValue().then((d) => {
        console.log(d);
      });
    },
    resetForm() {
      // this.formModel = this.initxx();
      this.$refs.form.resetForm();
    },
  },
};
</script>
