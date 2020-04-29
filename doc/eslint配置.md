# eslint配置
```
cnpm install eslint -D
```
eslint --init -路next就可以了。
会在根目录生成.eslintrc.js

wepack配置
{
	test: /\.(js|vue)$/,
	loader: 'eslint-loader',
	enforce: 'pre',
	include: [path.resolve('src'), path.resolve('test')],
	options: {
		// formatter: require('eslint-friendly-formatter'),
		emitWarning: false
	}
}
