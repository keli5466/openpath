<!--
The news and press landing page
-->

<template lang='pug'>

.page.articles
	.news(v-if='page.featuredNews')
		.marquee
			h1 News

		.news-featured(v-if='page.featuredNews')
			.content
				visual.brand-logo(:image='page.featuredNews.fields.image.fields.file.url'
					 background='')
				.small-headline {{ page.featuredNews.fields.headline }}
				.date {{ page.featuredNews.fields.date | date }}
				a.cta(:href='page.featuredNews.fields.url' target="_blank") Read More

		.posts
			transition-group(name='fade')
				.news-post(v-for='{fields:post, sys} in newsPosts'
					:key='sys.id')
					visual.brand-logo(v-if='post.image'
						:image='post.image.fields.file.url'
						background='contain')
					.small-headline {{ post.headline }}
					.date {{ post.date | date }}
					a.cta(:href='post.url' target="_blank") Read More

			nuxt-link.cta-inverse.see-all(to='/news') See All News


	.press(v-if='page.featuredPress')
		.marquee
			h1 Press Releases

		.press-featured(v-if='page.featuredPress')
			.content
				.small-headline {{ page.featuredPress.fields.title }}
				.date {{ page.featuredPress.fields.date | date }}
				.excerpt {{ page.featuredPress.fields.excerpt }}
				nuxt-link.cta(:to=`{
					name: "press-release",
					params: { release: page.featuredPress.fields.slug }}
				`) Read More

		.posts
			transition-group(name='fade')
				.press-post(v-if='pressPosts.length'
					v-for='{fields:post, sys} in pressPosts'
					:key='sys.id')
					.small-headline {{ post.title }}
					.date {{ post.date | date }}
					.excerpt {{ post.excerpt }}
					nuxt-link.cta(:to=`{
						name: "press-release",
						params: { release: post.slug }}
					`) Read More

			nuxt-link.cta-inverse.see-all(to='/press') See all Press Releases

	.media-press-kits
		.headline Media &amp; Press Kits
		.contact Media inquiries contact:
		a.email(href="mailto:press@openpath.com") press@openpath.com

		.features
			.download(v-for='{fields:download} in page.mediaKits')
				visual.download-image(v-if='download.image'
					:image='download.image.fields.file.url')
				.small-headline {{ download.headline}}
				a.cta(:href='download.file.fields.file.url' target="_blank") Download

</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
format = require 'date-fns/format'
perPage = 9

export default

	head: ->
		@$gtm.pageview @$contentful.seo @page.seo,
			title: 'News & Press'

	# Get news page data and posts
	asyncData: ({ app, params, error }) ->

		# Get the page
		page = await app.$contentful.getEntry 'articlesPage'

		# Get all non-featured news posts
		newsPosts = await app.$contentful.getEntries 'news',
			'sys.id[ne]': page.featuredNews?.sys.id,
			order: '-fields.date'
			'limit': 3

		# Get all non-featured press posts
		pressPosts = await app.$contentful.getEntries 'press',
			'sys.id[ne]': page.featuredPress?.sys.id,
			order: '-fields.date'
			'limit': 3

		# Set data
		page: page
		newsPosts: newsPosts.items
		pressPosts: pressPosts.items

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

.news-featured
	text-align center
	margin rem(47px) auto rem(50px)
	padding rem(68px) 0 rem(62px)
	border solid 1px #e8e8e8

.press-featured
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
		margin rem(26px) auto rem(46px)
		font 'Assistant', 17px, #4c4f55
		font-weight 300
		line-height 1.7
		flex-grow 1
		width 100%

	.small-headline
		font-weight 300
		font 'open-sans', 28px, primary-text
		line-height 1.43
		letter-spacing 0.5px
		margin-bottom rem(6px)

.small-headline
	margin rem(46px) auto rem(20px)
	font-weight 600
	font 'Assistant', 20px, #424242

.date
	line-height 1.5
	font-weight 300
	font 'Assistant', 20px, secondary-text

.cta-inverse
	margin-top rem(46px)
	margin-bottom rem(107px)
	width rem(263px)


.load-more
	margin 0 auto
	background primary
	color white
	margin-bottom rem(65px)

.brand-logo
	width 100%
	max-width rem(180px)
	margin 0 auto

.posts
	text-align center //Needed for bottom CTA
	span
		display flex
		flex-flow row wrap
		justify-content flex-start

.news-post
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

	.brand-logo
		aspect-ratio(1)

	.small-headline
		flex-grow 1
		margin-top rem(67px)
		width 100%

	.date
		margin-bottom rem(67px)

	.cta
		margin-top auto
		width rem(210px)
		padding rem(16px) 0
		@media (max-width tablet)
			width 100%

.press-post
	width 32%
	flex-grow 1
	display flex
	flex-direction column
	align-items flex-start
	background offwhite
	text-align left
	padding rem(90px) rem(block-spacing)
	text-align left
	margin rem(5px)

	.excerpt
		font 'Assistant', 17px, #4c4f55
		font-weight 300
		line-height 1.7
		flex-grow 1
		width 100%

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
		width 100%
		font-weight 300
		margin-bottom rem(50px)
		margin-left 0
		margin-top 0
	.cta
		align-self center
		margin-top rem(63px)
		@media (max-width tablet-landscape)
			padding-left 0
			padding-right 0
			width 100%

.media-press-kits
	inner-wrapper()
	margin-bottom rem(130px)

	.contact
		display block
		text-align center
		font-size 17px
		line-height 25px
		color #4c4f55

	.email
		display block
		text-align center
		font-size 19px
		font-family 'Open Sans'
		color primary
		margin-bottom rem(60px)

	.headline
		display block
		text-align center
		margin-bottom rem(26px)

.features
	display flex
	justify-content space-between
	@media (max-width mobile)
		flex-direction column

.download
	width 30%
	display flex
	flex-direction column
	@media (max-width mobile)
		flex-direction row
		width 100%

		.cta
			line-height 1.6

	.small-headline
		font-family 'Open Sans'
		font-size 19px
		color #272727
		font-weight 400
		flex-grow 1

	.cta
		margin-top rem(32px)
		border-color blue
		padding rem(11px) rem(23px)

.download-image
	aspect-ratio(295/178)
	margin-bottom rem(21px)

</style>
