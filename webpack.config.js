// most of this setup is from the elm-webpack-starter example:
// https://github.com/moarwick/elm-webpack-starter/
var path              = require('path');
var webpack           = require('webpack');
var merge             = require('webpack-merge');
var HtmlWebpackPlugin = require('html-webpack-plugin');
var autoprefixer      = require('autoprefixer');
var CopyWebpackPlugin = require('copy-webpack-plugin');
var ExtractTextPlugin = require('extract-text-webpack-plugin');

// detemine build env
var TARGET_ENV =
  process.env.npm_lifecycle_event.indexOf('production') >= 0 ?
    'production' :
    'development';

console.log('TARGET_ENV:', TARGET_ENV);

// common webpack config
var commonConfig = {
  output: {
    path: path.resolve( __dirname, 'dist/'),
    filename: 'js/[hash].js',
  },

  resolve: {
    modules: [ 'node_modules' ],
    extensions: [ '.js', '.json', '.elm', '*' ]
  },

  module: {
    noParse: /\.elm$/,
    rules: [
      // This loader is required for font-awesome to properly load font files
      // referenced in font-awesome's css files. These are referenced like this
      // font-awesome/fonts/fontawesome-webfont.eot?v=4.7.0
      // and we need to stript the "?v=4.7.0" from the end.
      {
        test: /\.(woff2|woff|ttf|eot|svg)(\?v=[a-z0-9]\.[a-z0-9]\.[a-z0-9])?$/,
        loader: 'url-loader',
        options: {
          limit: 100000
        }
      },
      {
        test: /\.(woff|woff2|svg)$/,
        use: 'file-loader',
      },
    ],
  },

  plugins: [
    new HtmlWebpackPlugin({
      template: 'frontend/index.html',
      inject:   'body',
      filename: 'index.html',
    }),
  ],
};

// additional webpack settings for local development environment
// (when invoked by 'npm start')
if (TARGET_ENV === 'development') {
  module.exports = merge(commonConfig, {
    entry: [
      'webpack-dev-server/client?http://localhost:7000',
      path.join( __dirname, 'frontend/js/index.js' ), ],

    devServer: {
      port: 7000,
      inline: true,
      proxy: [
        // redirect API requests to the Node.js backend
        {
          context: [
            '/api/**'
          ],
          target: 'http://localhost:3000',
        }
      ]
    },

    module: {
      rules: [
        {
          test:    /\.elm$/,
          exclude: [/elm-stuff/, /node_modules/],
          use:  [
            { loader: 'elm-hot-loader' },
            { loader: 'elm-webpack-loader',
              options: {
                verbose: true,
                warn: true,
                debug: true
              }
            }
          ]
        },
        {
          test: /\.(css|scss)$/,
          use: [
            'style-loader',
            'css-loader',
            'sass-loader',
            'postcss-loader'
          ],
        },
      ],
    }
  });
}

// additional webpack settings for prod env (when invoked via 'npm run build')
if (TARGET_ENV === 'production') {

  var extractSass = new ExtractTextPlugin({
    filename: "[name].[contenthash].css",
    disable: false,
    allChunks: true
  });

  module.exports = merge(commonConfig, {
    entry: path.join( __dirname, 'frontend/js/index.js'),

    module: {
      rules: [
        {
          test: /\.elm$/,
          exclude: [/elm-stuff/, /node_modules/],
          use: 'elm-webpack-loader',
        },
        {
          test: /\.(css|scss)$/,
          use: extractSass.extract({
            loader: [{
              loader: 'css-loader'
            }, {
              loader: 'sass-loader'
            }, {
              loader: 'postcss-loader'
            }],
            fallback: 'style-loader'
          })
        }
      ]
    },

    plugins: [
      new CopyWebpackPlugin([
        { from: 'frontend/img', to: 'img' },
        { from: 'frontend/favicon.ico' }
      ]),

      extractSass,

      new webpack.optimize.UglifyJsPlugin({
        minimize: true,
        mangle: true,
        compressor: { warnings: false },
      }),
    ]
  });
}
