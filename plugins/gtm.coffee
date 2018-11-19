###
Google Tag Manager utils
###
module.exports = ({ app: { router } }, inject) ->

	# Inject reference
	inject 'gtm',

		# Accept a "head" object, probably from @$contentful.seo, fire a datalayer
		# event, and then return the head object so this can be part of a chain
		pageview: (head) ->

			# Test for client-side
			if window?.dataLayer?.length

				# Prevent firing multiple events for same page.  We were seeing 2-3
				# head() calls locally.
				lastPath = window.dataLayer[window.dataLayer.length - 1]?.path
				nowPath = router.currentRoute.fullPath
				if lastPath != nowPath

					# Update dataLayer
					window.dataLayer.push
						event: 'pageview'
						path: nowPath
						title: head.title

			# Return head object for chaining
			return head
