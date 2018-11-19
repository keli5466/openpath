###
A mixin for blogs to add pagination functionality where the first page
of results may have different numbers of results displayed
###
module.exports =

	# Nuxt properties that work together to update the asyncData when the page
	# query param changes
	watchQuery: [ 'page' ]
	key: (to) -> to.fullPath

	computed:

		# Calculate the total pages when the first page has a different number of
		# results compared to subsequent pages
		pages: ->
			total = @pagination.total
			firstPerPage = @pagination.firstPagePerPage
			otherPerPage = @pagination.otherPagesPerPage
			Math.ceil((total - firstPerPage) / otherPerPage) + 1

	methods:

		# Update the current page
		onPageChange: (page) ->
			@$router.push Object.assign {}, @$route, query: page: page
