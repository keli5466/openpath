<!--
The news listing page
-->

<template lang='pug'>

.news
	.marquee
		h1 {{ page.headline }}

	.featured(v-if='featured')
		.content
			visual.brand-logo(
				:image='$contentful.img(featured.image, 600, null, { format: "png" })'
				background='')
			.small-headline {{ featured.headline }}
			.date {{ featured.date | date }}
			a.cta(:href='featured.url' target="_blank") Read More

	.posts
		transition-group(name='fade')
			.post(v-for='{fields:post, sys} in posts'
				:key='sys.id')
				visual.brand-logo(
					:image='$contentful.img(post.image, 600, null, { format: "png" })'
					background='contain')
				.small-headline {{ post.headline }}
				.date {{ post.date | date }}
				a.cta(:href='post.url' target="_blank") Read More

		.load-more.cta(v-if='hasMore'
			@click='loadMore') Load More

</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
format = require 'date-fns/format'
perPage = 12

export default

	head: ->
		@$gtm.pageview @$contentful.seo @page.seo,
			title: 'News'

	# Get news page data and posts
	asyncData: ({ app, params, error }) ->

		# Get the page
		page = await app.$contentful.getEntry 'newsPage'

		# Get all non-featured posts
		posts = await app.$contentful.getPaginatedEntries 'news', perPage: perPage,
			'sys.id[ne]': page.featuredPost?.sys.id
			order: '-fields.date'

		# Set data
		page: page
		posts: posts.items
		total: posts.total

	data: ->
		paged: 1
		total: null

	computed:

		# Are there more pages of results to load
		hasMore: -> @total > @posts.length

		# Featued post
		featured: -> @$contentful.ref @page.featuredPost

	methods:

		# Get the next page of results
		loadMore: ->

			# Get the next page of posts
			pagination =
				page: ++@paged
				perPage: perPage
			posts = await @$contentful.getPaginatedEntries 'news', pagination,
				'sys.id[ne]': @page.featuredPost?.sys.id
				order: '-fields.date'

			# Add the posts to the list
			@posts = @posts.concat posts.items || []

	filters:
		date: (val) -> format val, 'MMMM DD, YYYY'

</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>

.marquee
	background-color #b9ced2
	width 100%
	padding rem(90px)
	text-align center

h1
	font 'open-sans', 42px, white
	font-weight 300
	letter-spacing rem(0.2px)

.featured
	text-align center
	margin rem(47px) auto rem(114px)
	padding rem(68px) 0 rem(62px)
	border solid 1px #e8e8e8

.small-headline
	margin rem(46px) auto rem(20px)
	font-weight 600
	font 'Assistant', 20px, #424242

.date
	line-height 1.5
	font-weight 300
	font 'Assistant', 20px, secondary-text

.cta
	margin-top rem(46px)

.load-more
	margin rem(80px) auto
	display block
	width 250px
	background primary
	color white
	margin-bottom rem(65px)

.brand-logo
	width 100%
	max-width rem(180px)
	margin 0 auto

.posts
	margin-bottom rem(80px)
	span
		display flex
		flex-flow row wrap
		justify-content flex-start

.post
	width 32%
	display flex
	flex-direction column
	align-items center
	background offwhite
	padding rem(90px) rem(block-spacing)
	text-align center
	margin rem(5px)

	@media (max-width tablet)
		padding 5vw 3vw

	@media (max-width mobile)
		width 47%

	.small-headline
		flex-grow 1
		margin-top rem(67px)
		width 100%

	.brand-logo
		aspect-ratio(1)

	.date
		margin-bottom rem(67px)

	.cta
		margin-top auto
		width rem(210px)
		padding rem(16px) 0
		@media (max-width tablet)
			width 100%

input
	appearance checkbox
	margin-right rem(12px)

.filter
	display inline-block
	margin-left rem(5px)
	position relative
	margin-bottom rem(31px)


.filter-icon
	background primary
	display inline-block
	border-radius 3px
	padding rem(8px) rem(19px)
	display flex
	flex-flow row nowrap
	justify-content flex-start
	align-items center
	span
		padding 0 rem(25px)
		font 'Assistant', 20px, white
		line-height 1.5
	&:before
		content url('~/static/img/filter.svg')
	&:after
		content url('~/static/img/carrot.svg')

.filter-dropdown
	font 'Assistant' , 20px, #424242
	position absolute
	top 100% + 50px
	left 0
	width 100%
	z-index 1
	padding rem(30px)
	border-radius 3px
	background-color #ffffff
	border solid 1px #c8c8c8

	&:before
		content ''
		position absolute
		border-left 15px solid transparent
		border-right 15px solid transparent
		border-bottom 15px solid #c8c8c8
		bottom 100%
		left 50%
		transform translateX(-50%)

	&:after
		content ''
		position absolute
		border-left 14px solid transparent
		border-right 14px solid transparent
		border-bottom 14px solid white
		bottom 100%
		left 50%
		transform translateX(-50%)

</style>
