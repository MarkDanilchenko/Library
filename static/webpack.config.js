const path = require('path');

module.exports = {
	entry: {
		index: path.resolve(__dirname, 'src/js/index.js'),
	},
	mode: 'production',
	output: {
		path: path.resolve(__dirname, './dist'),
		filename: 'bundle.js',
	},
	module: {
		rules: [
			{
				test: /\.js$/,
				exclude: /node_modules/,
				use: {
					loader: 'babel-loader',
				},
			},
			{
				test: /\.css$/,
				exclude: /node_modules/,
				use: ['style-loader', 'css-loader'],
			},
		],
	},
};
