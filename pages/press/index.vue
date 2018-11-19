<!--
The press listing page
-->

<template lang='pug'>

.press
	.marquee
		h1 {{ page.headline }}

	.featured(v-if='featured')
		.content
			.small-headline {{ featured.title }}
			.date {{ featured.date | date }}
			.excerpt {{ featured.excerpt }}
			nuxt-link.cta(:to=`{
				name: "press-release",
				params: { release: featured.slug }}
			`) Read More

	.posts
		transition-group(name='fade')
			.post(v-if='posts.length'
				v-for='{fields:post, sys} in posts'
				:key='sys.id')
				.small-headline {{ post.title }}
				.date {{ post.date | date }}
				.excerpt {{ post.excerpt }}
				nuxt-link.cta(:to=`{
					name: "press-release",
					params: { release: post.slug }}
				`) Read More

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
			title: 'Press'

	# Get press page data and posts
	asyncData: ({ app, params, error }) ->

		# Get the page
		page = await app.$contentful.getEntry 'pressPage'

		# Get all non-featured posts
		posts = await app.$contentful.getPaginatedEntries 'press', perPage: perPage,
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
			posts = await @$contentful.getPaginatedEntries 'press', pagination,
				'sys.id[ne]': @page.featuredPost?.sys.id
				order: '-fields.date'

			# Add the posts to the list
			@posts = @posts.concat posts.items || []

	filters:
		date: (val) -> format val, 'MMMM DD, YYYY'

</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>

//  marquee

.marquee
	background-color #b9ced2
	width 100%
	padding rem(90px)
	text-align center

h1
	font 'open-sans', 42px, white
	font-weight 300
	letter-spacing rem(0.2px)


// FEATURE BOX
.featured
	text-align center
	margin rem(47px) auto rem(114px)
	padding rem(68px) 0 rem(62px)
	border solid 1px #e8e8e8
	.content
		width 70%
		margin 0 auto
	.cta
		margin-top 0

	.excerpt
		margin  rem(26px) auto rem(46px)
	.small-headline
		font-weight 300
		font 'open-sans', 28px, primary-text
		line-height 1.43
		letter-spacing 0.5px
		margin-bottom rem(6px)


.excerpt
	font 'Assistant', 17px, #4c4f55
	font-weight 300
	line-height 1.7
	flex-grow 1
	width 100%

.date
	line-height 1.5
	font-weight 300
	font 'Assistant', 20px, secondary-text


.load-more
	cursor pointer


// GRID
.posts
	span
		display flex
		flex-flow row wrap
		justify-content flex-start

.post
	width 32%
	// helps item take space if there is less than 3
	flex-grow 1
	display flex
	flex-direction column
	align-items flex-start
	background offwhite
	text-align left
	padding rem(90px) rem(block-spacing)
	text-align left
	margin rem(5px)

	@media (max-width tablet)
		padding 5vw 3vw

	@media (max-width mobile)
		width 47%

	.date
		font-size 17px
		text-align left
		margin-bottom rem(17px)
	.small-headline
		text-align left
		font 'open-sans', 22px, #161213
		font-size 22px
		line-height 1.36
		font-weight 300
		margin-bottom rem(50px)
	.cta
		align-self center
		margin-top rem(63px)
		@media (max-width tablet-landscape)
			padding-left 0
			padding-right 0
			width 100%


// FILTER DROPDOWN


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

// TOOL TIP
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

	// Two triangles to create a border
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
