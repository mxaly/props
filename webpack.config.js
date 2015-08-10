module.exports = {
  context: __dirname + "/react",
  entry: "./components",
  output: {
    path: __dirname + "/app/assets/javascripts/generated",
    filename: "react-bundle.js"
  },
  module: {
    loaders: [
      {
        test: /\.jsx?$/,
        exclude: /(node_modules|bower_components)/,
        loader: "babel-loader"
      }
    ]
  },
  resolve: {
    extensions: ["", ".js", ".jsx", ".js.jsx"]
  }
};
