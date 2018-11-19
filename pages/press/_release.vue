<!--
The press detail
-->

<template lang='pug'>

.press
	breadcrumbs(:parent='{name: "Press", path: "/press"}'
		:current='post.title')
	visual(v-if='post.image'
		:image='image'
		aspect='16:9')
	.headline {{ post.title }}
	longForm(:block='post')

</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
export default

	components:
		breadcrumbs: require '~/components/shared/breadcrumbs'
		'longForm': require '~/components/blocks/long-form-content'

	head: ->
		@$gtm.pageview @$contentful.seo @post.seo,
			title: @post.title

	asyncData: ({ app, params, error }) ->
		post = await app.$contentful.getEntryBySlug 'press', params.release
		return error 'Not Found' unless post

		post: post

	computed:
		image: -> @$contentful.image @post.image, 1600, 900

</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>

.breadcrumbs
	top rem(130px)
	padding-left rem(120px)
	padding-right @padding-left
	@media (max-width tablet)
		padding-right 10vw
		padding-left @padding-right

.headline
	padding rem(80px) rem(120px) 0
	@media (max-width tablet)
		padding rem(100px) 10vw 0

	+ .long-form-content
		margin-top 0

</style>
