const path = require('path')
const autoprefixer = require('autoprefixer')
const copyWebpackPlugin = require('copy-webpack-plugin')
const fileLoader = require('file-loader')

let mainConfig = {
	resolve: {
		extensions: [],
/*
		alias: {
			staticPath: path.resolve(__dirname, '../djangoapps/STARIC/')
		}
*/
	},

	context: path.resolve(__dirname),
	resolve: {
    	extensions: [".js", ".jsx"]
	},

	entry: {
		//'reactdep': ['react', 'react-dom', 'redux', 'react-redux', 'bootstrap', './css/custom.scss'],
		//'simpledep': ['bootstrap', './css/custom.scss'],

		index: './js/index.js',
	},

	output: {
		path: path.resolve(__dirname, '../apps/antikrt/static/js'),
		filename: '[name].js',
		//publicPath: path.resolve(__dirname, '../djangoapps/STATIC/publicpath/')
	}, 

	module: {
		rules: [
			{
				test: /\.js$/,
				exclude: '/node_modules/',
				use: {
					loader: 'babel-loader',
					options: {
						presets: ["@babel/preset-env", "@babel/preset-react"]
					}	
				}
			},	{
				test: /\.(scss)$/,
				use: [{
					loader: 'style-loader'
				}, {
					loader: 'css-loader'
				},
				/*
				{
					// Run postcss actions
					loader: 'postcss-loader',
					options: {
						// `postcssOptions` is needed for postcss 8.x;
						// if you use postcss 7.x skip the key
						postcssOptions: {
							// postcss plugins, can be exported to postcss.config.js
							plugins: function () {
								return [require('autoprefixer')]
							}
						}
					}
				},
				*/
				{
					// compiles Sass to CSS
					loader: 'sass-loader'
				}]
			}, {
				test: /\.(woff)$/,
				loader: 'file-loader',
				options: {
					path: path.resolve(__dirname, '../apps/antikrt/static/fonts'),
					name: '[name].[ext]',
				}
			},	
/*
			{
				test: /\.(svg)$/,
				loader: 'file-loader',
				options: {
					name: '[name].[ext]',
					path: path.resolve(__dirname, '../apps/antikrt/static/imgs'),
				}
			}
*/
		]
	},
/*
	plugins: [
		new copyWebpackPlugin({
			patterns: [
				{
					from: path.resolve(__dirname, './imgs/link-intact.ico'),
					to: path.resolve(__dirname, '../djangoapps/STATIC/favicon.[ext]')
				},	{
					from: path.resolve(__dirname, './imgs/link-24px.svg'),
					to: path.resolve(__dirname, '../djangoapps/STATIC/link.[ext]')
				}, {
					from: path.resolve(__dirname, './imgs/vk.png'),
					to: path.resolve(__dirname, '../djangoapps/STATIC/vklabel.[ext]')
				}, {
					from: path.resolve(__dirname, './imgs/google.jpg'),
					to: path.resolve(__dirname, '../djangoapps/STATIC/googlelabel.[ext]')
				}, {
					from: path.resolve(__dirname, './imgs/facebook.jpg'),
					to: path.resolve(__dirname, '../djangoapps/STATIC/facebooklabel.[ext]')
				}, {
					from: path.resolve(__dirname, './imgs/yandex.jpg'),
					to: path.resolve(__dirname, '../djangoapps/STATIC/yandexlabel.[ext]')
				}, {
					from: path.resolve(__dirname, './imgs/error.png'),
					to: path.resolve(__dirname, '../djangoapps/STATIC/yandexlabel.[ext]')
				}, {
					from: path.resolve(__dirname, './imgs/warning.jpg'),
					to: path.resolve(__dirname, '../djangoapps/STATIC/yandexlabel.[ext]')
				}, {
					from: path.resolve(__dirname, './imgs/success.png'),
					to: path.resolve(__dirname, '../djangoapps/STATIC/yandexlabel.[ext]')
				}, {
					from: path.resolve(__dirname, './imgs/arrow-90deg-up.svg'),
					to: path.resolve(__dirname, '../djangoapps/STATIC/arrow-90deg-up.svg')
				}
			]
		}),		
	],
*/
	devServer: {
		inline: true,
		hot: true,
		open: false,
		contentBase: path.resolve(__dirname, '../djangoapps/STATIC/'), //staticPath, 
		port: 9000,
	},
}

module.exports = (env, argv) => {
	if (argv.mode === 'development') {
    	mainConfig.devtool = 'inline-source-map'
	}

	if (argv.mode === 'production') {
    	mainConfig.devtool = false
	}

	return mainConfig;
}