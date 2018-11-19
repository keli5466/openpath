# Deps
fromPairs = require 'lodash/fromPairs'
{ getEntries } = require 'bukwild-contentful-utils'

export state = ->
	featuredPosts: []

export getters =

	# Simplified list of featured press posts
	featuredPosts: (state) ->
		fromPairs state.featuredPosts.map (post) ->
			[ post.fields.slug, post.fields.title ]

export mutations =

	setFeaturedPosts: (state, val) -> state.featuredPosts = val

export actions =

	# Get featured posts
	fetchFeaturedPosts: ({ commit }) ->
		response = await getEntries 'press',
			'fields.featured[in]': 1
			limit: 1
		commit 'setFeaturedPosts', response.items
