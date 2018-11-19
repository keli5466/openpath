###
Make a click-outside plugin that will NOT be used in SSR
###
clickOutside = require 'click-outside'
module.exports = ({}, inject) ->

	# Proxy the calls to clickOutside with our own closure that automatically
	# unbinds itself after invoking callback
	autoUnbind = (el, callback) ->
		unbind = clickOutside el, (e) ->
			callback(e)
			unbind()

	# Inject reference
	inject 'clickOutside', autoUnbind
