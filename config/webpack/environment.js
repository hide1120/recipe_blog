const { environment } = require('@rails/webpacker')
//ここから
const webpack = require('webpack')
environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: 'popper.js'
  })
)
//ここまでを追加
module.exports = environment
