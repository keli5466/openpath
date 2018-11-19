<!--
The news article detail
-->

<template lang='pug'>

.article
	breadcrumbs(:parent='{name: "News", path: "/news"}'
		:current='post.headline')
	visual(v-if='post.image'
		:image='image'
		aspect='16:9')
	.headline {{ post.headline }}
	wysiwygBlock(v-if='post.content'
		:block='post')

</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
export default

	components:
		breadcrumbs: require '~/components/shared/breadcrumbs'
		'wysiwygBlock': require '~/components/blocks/wysiwyg'

	head: ->
		@$gtm.pageview @$contentful.seo @post.seo,
			title: @post.title

	asyncData: ({ app, params, error }) ->

		post = await app.$contentful.getEntryBySlug 'news', params.article
		return error 'Not Found' unless post

		post: post

	computed:
		image: -> @$contentful.image @post.image, 1600, 900

</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>



</style>
