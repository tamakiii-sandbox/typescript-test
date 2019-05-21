const webpack = require('webpack')
const path = require('path')

module.exports = {
  mode: process.env.NODE_ENV || "development",
  entry: [
    "./src/index.ts"
  ],
  output: {
    filename: "bundle.js",
  },
  resolve: {
    modules: [
      path.resolve("./src"),
      path.resolve("./node_modules")
    ],
    extensions: [
      ".ts", ".tsx", ".js", ".jsx"
    ]
  },
  module: {
    rules: [
      {
        test: /\.tsx?$/,
        loader: 'ts-loader',
        exclude: /node_modules/,
        options: {
          transpileOnly: true
        }
      }
    ]
  },
  plugins: []
};
