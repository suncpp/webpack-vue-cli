# Babel：  （官网：https://www.babeljs.cn/docs/）
  1、Babel 是一个 JavaScript 编译器；
  2、Babel 是一个工具链，主要用于将 ECMAScript 2015+ 版本的代码转换为向后兼容的 JavaScript 语法，以便能够运行在当前和旧版本的浏览器或其他环境中。
  3、 Babel的作用：
  　　①、语法转换
  　　②、通过 Polyfill 方式在目标环境中添加缺失的特性 (通过 @babel/polyfill 模块)
  　　③、源码转换 (codemods)
# 安装babel-loader、babel-core、babel-preset-env
```
cnpm install babel-loader @babel/runtime @babel/preset-env @babel/core @babel/plugin-transform-runtime -D
```
babel-loader abel-loader作为webpack的loader的一种，作用同其他loader一样，实现对特定文件类型的处理。
babel-core   babel-core的作用在于提供一系列api。
babel-preset-env  babel-preset-env的作用是告诉babel使用哪种转码规则进行文件处理。
# 配置babel
## 配置方式
  ### 在package.json中：
  "babel":{
    "presets": [],
    "plugins": []
  }
  ### 根目录新建.babelrc
    .babelrc
    targets, useBuiltIns 等选项用于编译出兼容目标环境的代码
    其中 useBuiltIns 如果设为 "usage"
    Babel 会根据实际代码中使用的 ES6/ES7 代码，以及与你指定的 targets，按需引入对应的 polyfill
    而无需在代码中直接引入 import '@babel/polyfill'，避免输出的包过大，同时又可以放心使用各种新语法特性。
    {
    "presets": [
      ["@babel/preset-env", {
        "modules": false,
        "targets": {
          "browsers": ["> 1%", "last 2 versions", "not ie <= 8"]
        },
        "useBuiltIns": "usage"
      }]
    ],
    "plugins": [
      "@babel/plugin-transform-runtime"
    ]
  }
  ### webpack配置
    {
      test: /\.js$/,
      exclude: /node_modules/,
      loader: "babel-loader",
    }