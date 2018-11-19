# Deps
webpack = require 'webpack'
fs = require 'fs'
dotenv = require 'dotenv'
dotenv.config() if fs.existsSync '.env'
{
	forGenerate: routesForGenerate
	forSitemap: routesForSitemap
} = require './build/routes.coffee'

# Config object
module.exports =

	# Allow the mode to be configured via env so the staging server can function
	# only in SPA mode
	mode: process.env.NUXT_MODE

	# Make env files available
	env:
		CONTENTFUL_API: process.env.CONTENTFUL_API
		CONTENTFUL_HOST: process.env.CONTENTFUL_HOST

	# HTML head
	head:
		title: 'Loading'
		meta: [
			{ charset: 'utf-8'}
			{ name: 'viewport', content: 'width=device-width, initial-scale=1, maximum-scale=1' }
			{ 'http-equiv': 'X-UA-Compatible', content: 'IE=edge' }
			{ name: 'msapplication-tap-highlight', content:'no' }
			{ name: 'twitter:card', content: 'summary '}
			{ name: 'twitter:site', content: '@openpathsec' }
			{ name: 'og:site_name', content: 'Openpath' }
			{ hid: 'robots', name: 'robots', content: process.env.ROBOTS_META }
		]
		script: [
			{ src: '/libs/zendesk.js' }
			{ src: '//cdn.embedly.com/widgets/platform.js' }
		]
		link: [
			{
				rel: 'icon'
				type: 'image/x-icon'
				href: '/favicon.ico'
			}
			{
				rel: 'stylesheet'
				href: 'https://fonts.googleapis.com/css?family=Assistant:300,400,600|Open+Sans:300,400'
			}
		]

	# Progress bar color
	loading: color: '#f96715'

	# Build config
	build:

		# Use the .babelrc file
		babel: babelrc: true

		# Additions to webpack
		extend: (config, { isDev, isClient }) ->

			# Find the vue-loader and disable esModule exports so child components
			# can be one liners
			vueRule = config.module.rules.find (rule) -> rule.loader == 'vue-loader'
			vueRule.options.esModule = false

			# Use the CJS version of Vue
			config.resolve.alias.vue$ = 'vue/dist/vue.common.js'

			# Don't return anything
			return

		# Webpack plugins
		plugins: [

			# Provide common utils to all modules so they don't need to be expliclity
			# required.
			new webpack.ProvidePlugin
				_:          'lodash'
				Vue:        'vue'
				Modernizr:  'modernizr'
				axios:      'axios'
		]

		# Watch this file for changes
		watch: [
			'./nuxt.config.coffee'
			'./plugins/definitions.styl'
		]

		# Things to include in vendor package
		vendor: [
			'babel-polyfill'
			'marked'
			'contentful'
		]

	# List of plugins
	plugins: [
		'~/plugins/in-viewport'
		'~/plugins/vue-visual'
		'~/plugins/gtm'
		'~/plugins/smart-link'
		{ src: '~/plugins/polyfills', ssr: false }
		{ src: '~/plugins/click-outside', ssr: false }
	]

	# List of modules
	modules: [
		'~/modules/coffeescript'
		['bukwild-contentful-utils/nuxt/module',
			config:
				space: process.env.CONTENTFUL_SPACE
				access_token: process.env.CONTENTFUL_API
				host: process.env.CONTENTFUL_HOST
		]
		[ 'nuxt-stylus-resources-loader', './plugins/definitions.styl', ]
		['@nuxtjs/google-tag-manager', id: 'GTM-KR4G4XX' ]
		'@nuxtjs/sitemap'
		'nuxt-spa-store-init'
		['vue-routing-anchor-parser/nuxt/module',
			addBlankToExternal: true
			internalHosts: [
				'localhost:3000'
				'openpath-c34f91.netlify.com'
				'openpath-staging-c34f91.netlify.com'
				'openpath.com'
				'www.openpath.com'
			]
		]
	]


	router:

		# Customize routes
		extendRoutes: (routes, resolve) ->

			# Make the tower slug optional, so the root route will match, and make
			# it match slashes in slugs
			index = routes.findIndex (route) -> route.name == 'tower'
			routes[index].path = '/:tower*'

			# Return new routes array
			return routes

	# Generation rules
	generate:
		routes: routesForGenerate

		# Prevent trailing slashes on Netlify when used with with Pretty URLs
		subFolders: false

		# Support falling back to a resolvable file on Netlify if a route didn't
		# exist when build was run.  This generates a 404.html file.  We only want
		# this to run when _not_ using generate so we return true 404s
		fallback: process.env.npm_lifecycle_event != 'generate'

		# Add an interval to try and fix deployment errors with Contentful
		interval: 200

	# Sitemap rules
	sitemap:
		hostname: process.env.URL
		routes: routesForSitemap
		generate: process.env.npm_lifecycle_event == 'generate'
