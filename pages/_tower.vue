<!--
The base tower
-->

<template lang='pug'>

.tower(:class="tower.slug")
	blocks(:blocks='$contentful.refs(tower.blocks)')

</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
import { loadBlockData } from '~/utils/has-blocks'

export default

	components: blocks: require '~/components/global/blocks'

	# HTML head
	head: -> Object.assign {},
		@hubspotScript(),
		@$gtm.pageview @$contentful.seo @tower.seo,
			title: @tower.title

	# Get tower data and blocks
	asyncData: (context) ->
		{ app, params, error } = context

		# Lookup the tower
		slug = params.tower || 'homepage' # Serve root from "homepage" tower
		tower = await app.$contentful.getEntryBySlug 'tower', slug, include: 4
		return error statusCode: 404, message: 'Not found' unless tower

		# Hydrate some blocks with additional data so that it gets SSRed
		await loadBlockData context, tower.blocks

		# Save the tower
		{ tower }

	methods:

		# Add the hubspot script tag if a hubspot form block was added to tower
		hubspotScript: ->
			return {} unless @tower.blocks.find (block) ->
				block?.sys.contentType?.sys.id == 'hubspotFormBlock'
			script: [
				src: '//js.hsforms.net/forms/v2.js'
				hid: 'hubspot'
			]

</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>



</style>
