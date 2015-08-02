module.exports = {
  context: __dirname + "/app/assets/javascripts",
  entry: "./components",
  output: {
    path: __dirname + "/app/assets/javascripts/react",
    filename: "bundle.js"
  },
  module: {
    loaders: [
      {
        test: /\.js.jsx$/,
        exclude: /(node_modules|bower_components)/,
        loader: "babel-loader"
      }
    ]
  },
  resolve: {
    extensions: ["", ".js", ".jsx", ".js.jsx"]
  }
};
