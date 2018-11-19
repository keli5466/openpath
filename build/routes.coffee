# Deps
{ getEntries, config } = require 'bukwild-contentful-utils'
isString = require 'lodash/isString'
module.exports = {}

# Configure the contentful utils, this runs before registration of module
config
	space: process.env.CONTENTFUL_SPACE
	access_token: process.env.CONTENTFUL_API
	host: process.env.CONTENTFUL_HOST

# Build the list of all routes for generating static files
module.exports.forGenerate = ->

	# Simple routes
	routes = [
		'/' # Should generate using "homepage" tower
		'/news'
		'/press'
		'/news-press'
		'/thanks'
	]

	# Add all products
	{ items:entries } = await getEntries 'product', include: 3, limit: 1000
	routes = routes.concat entries.map (entry) ->
		route: "/product/#{entry.fields.slug}"

	# Add all news articles
	{ items:entries } = await getEntries 'news', include: 3, limit: 1000
	routes = routes.concat entries.map (entry) ->
		route: "/news/#{entry.fields.slug}"

	# Add all press releases
	{ items:entries } = await getEntries 'press', include: 3, limit: 1000
	routes = routes.concat entries.map (entry) ->
		route: "/press/#{entry.fields.slug}"

	# Add all towers
	{ items } = await getEntries 'tower', include: 3
	routes = routes.concat items.map (entry) ->
		return if entry.fields.slug in ['homepage'] # Towers not to render
		route: "/#{entry.fields.slug}"

	# Return non empty routes
	return routes.filter (route) -> !!route

# Flatten this object to an array of paths for use by the sitemap module
module.exports.forSitemap = ->
	routes = await module.exports.forGenerate()
	routes.map (route) ->
		if isString route
		then route
		else route.route
