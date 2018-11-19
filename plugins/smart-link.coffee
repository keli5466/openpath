###
Register a global component that supports external :to values
###
Vue.component 'smart-link',

	props: to: Object|String

	render: (create) ->
		if @isExternal
		then @makeExternal create
		else @makeInternal create

	computed:

		# Does the link contain a protocol?
		isExternal: ->
			!!(typeof @to == 'string' and @to.match /^https?:\/\//)

	methods:

		# Make nuxt-link component
		makeInternal: (create) ->
			create Vue.component('nuxt-link'),
				props: to: @to
			, @$slots.default

		# Make an "a" tag that opens in a new window
		makeExternal: (create) ->
			create 'a',
				attrs:
					href: @to
					target: '_blank'
			, @$slots.default
