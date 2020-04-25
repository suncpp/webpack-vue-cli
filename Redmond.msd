webpack构建vue脚手架
1、创建目录
    makir webpack-vue-cli
2、npm初始化
    npm init -y
3、下载webpack三件套
    npm install webpack webpack-cli webpack-dev-server --save-dev
4、将vue加载进脚手架中
    4.1、创建文件夹
        makir build
        makir src
        4.1.1、src文件夹创建文件(文件的名字可自定义)
                app.vue
                main.js
        4.1.2、根目录创建indx.html
                index.html
    4.2、加载vue所需的依赖
        npm install vue vue-loader vue-template-compiler style-loader css-loader --save-dev
        npm install html-webpack-plugin clean-webpack-plugin --save-dev
5、利用webapck-dev-server搭建服务
    5.1、根目录创建webpack.config.js
            webpack.config.js
    5.2、引入path，HtmlWebpackPlugin,webpack,VueLoaderPlugin
    5.3、配置入口，模块规则，服务配置，插件配置
        const path = require("path"); //path 模块提供了一些工具函数，用于处理文件与目录的路径。
        const HtmlWebpackPlugin = require("html-webpack-plugin"); //构建html文件
        const webpack = require("webpack"); //webpack打包工具
        const VueLoaderPlugin = require("vue-loader/lib/plugin"); // vue-loader 编译vue文件

        entry: {
            //入口
            app: path.resolve(__dirname, "./src/main.js"),
        },
        module: {
            //处理项目中的不同类型的模块。
            rules: [
            // rules 各种规则(数组类型) 每个规则可以分为三部分 - 条件(condition)，结果(result)和嵌套规则(nested rule)
            {
                test: /\.css/,
                use: ["style-loader", "css-loader"], // style-loader 和css-loader 编译css处理
            },
            {
                test: /\.vue$/,
                loader: "vue-loader", //vue-loader 编译vue模块
            },
            ],
        },
        devServer: {
            contentBase: "./dist", // 告诉服务从哪提供代码内容(静态文件这么使用)
            hot: true, //hot模式开启
            open: true,
            port: 8989
        },
        plugins: [
            new HtmlWebpackPlugin({
                // 构建html
                filename: "index.html", //文件名
                title: "webpack vue cli", //title
                template: "./index.html", //参照模板样式
            }),
            new VueLoaderPlugin(), //vue-loader插件开启
        ],
    5.4、package.json中配置启动命令
        "scripts": {
            "test": "echo \"Error: no test specified\" && exit 1",
            "start": "webpack-dev-server"
        },
    5.5 添加热加载
        new webpack.HotModuleReplacementPlugin(), //热模块替换开启
    5.6、启动服务
        npm run start
6、打包编译
    6.1、package.json中配置打包命令
        "build": "webpack"
        "build": "webpack --config webpack.config.js"