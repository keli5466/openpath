export actions =

	# Load data needed by all pages
	nuxtServerInit: ({ dispatch }) ->
		Promise.all [
			dispatch 'press/fetchFeaturedPosts'
		]
