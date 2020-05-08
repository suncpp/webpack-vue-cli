<template>
  <div>
    <!-- <publicForm
      :formdescObj="formdescObj"
      :formModel="formModel"
      :rules="rules"
      ref="form"
    >
      <template v-slot:form-vslot>
        <div>
          <el-link href="https://element.eleme.io" target="_blank"
            >默认链接</el-link
          >
          <el-link type="primary">主要链接</el-link>
          <el-link type="success">成功链接</el-link>
          <el-link type="warning">警告链接</el-link>
          <el-link type="danger">危险链接</el-link>
          <el-link type="info">信息链接</el-link>
        </div>
      </template>
    </publicForm>
    <el-button @click="submitForm"> 提交 </el-button>
    <el-button @click="resetForm"> 重置 </el-button> -->
    <publicTable></publicTable>
  </div>
</template>
<script>
export default {
  data() {
    return {
      input: '',
      formdescObj: [
        {
          type: 'slot',
          prop: 'vslot',
          isShow: true
        },
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
<script>
  // isShow
  /* isShow
  1、可以是一个函数
    {label: '名称', value: 'name', show: data => {
        return data.type === 'userInfo'
    }}
  2、可以批量控制，配合watch
    // 根据弹窗类型做数据联动
    'dialogInfo.type' (val) {
      const fieldList = this.formInfo.fieldList
      switch (val) {
        case 'userInfo':
          fieldList.forEach(item => {
            if (['user_old_pwd', 'user_new_pwd', 'user_new1_pwd'].includes(item.value)) {
              item.show = true
            } else {
              item.show = false
            }
          })
          break
        case 'password':
          fieldList.forEach(item => {
            if (!['user_old_pwd', 'user_new_pwd', 'user_new1_pwd'].includes(item.value)) {
              item.show = true
            } else {
              item.show = false
            }
          })
          break
      }
    } */
</script>
