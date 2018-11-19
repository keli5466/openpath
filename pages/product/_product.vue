<!--
The product detail page
-->

<template lang='pug'>

.product
	product-marquee(:images='product.images'
		:title='product.title'
		:subhead='product.subhead'
		:download='product.dataSheet')

	.block.features
		.tabs
			.tab(@click='tabSwitch(0)'
				:class='{active: activeTab == 0}') Features
			.tab(@click='tabSwitch(1)'
				:class='{active: activeTab == 1}') Install Options
			.tab(@click='tabSwitch(2)'
				:class='{active: activeTab == 2}') Tech Specs

		height-tween(name='fade' mode='out-in')
			.tab-content(:key='activeTab')
				.tab-inner-content(v-for='({fields:list, sys}, index) in activeList'
					:key='index'
					:class='sys.contentType.sys.id')
					visual.icon(v-if='list.icon'
						:image='list.icon.fields.file.url'
						background='')
					.headline(v-if='list.headline') {{ list.headline }}
					.subhead(v-if='list.subhead') {{ list.subhead }}
					.content.wysiwyg(v-if='list.content'
						v-html='$options.filters.markdown(list.content)')

		quote-footer(:block=`{
			"headline": "Get Started",
			"subhead": "See your options and create your system",
			"ctaUrl": "/get-a-quote",
			"ctaText": "Get Quote",
			"image": "/img/footer-image.jpeg"}`)

</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
marked = require 'marked'

export default
	components:
		'height-tween': require 'vue-height-tween-transition'
		'product-marquee': require '~/components/pages/product/marquee.vue'
		'quote-footer': require '~/components/blocks/footer'

	data: ->
		activeTab: 0
		allSpecs: []

	head: ->
		@$gtm.pageview @$contentful.seo @product.seo,
			title: @product.title

	asyncData: ({ app, params, error }) ->

		product = await app.$contentful.getEntryBySlug 'product', params.product
		return error 'Not Found' unless product

		product: product

	computed: activeList: -> @allSpecs[@activeTab]

	mounted: ->
		@allSpecs.push(
			@product.productFeatures,
			@product.installOptions,
			@product.techSpecs)

	methods:
		tabSwitch: (index) -> @activeTab = index

	filters:
		markdown: (val) -> marked val

</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>

.product .footer
	margin-left 0
	margin-right @margin-left

.product
	position relative

.height-tweening
	transition height .3s ease-out-quad

.features
	inner-wrapper()

	@media (max-width mobile)
		margin 0
		margin-top rem(50px)

.tabs
	display flex
	justify-content space-between
	border-bottom 1px solid #c8c8c8

.tab
	width 33.3333%
	display flex
	align-content center
	align-items center
	padding rem(24px)
	font-family 'Assistant'
	font 'Assistant', 18px, #272727
	cursor pointer
	border-bottom 3px solid transparent
	transition border-color 300ms ease-in-out,
						 background 300ms ease-in-out

	&.active
		border-bottom 3px solid primary
		background #fafafa

	&:not(:last-of-type)
		border-right 1px solid #c8c8c8

.tab-content
	padding-top rem(100px)
	padding-bottom @padding-top
	display flex
	justify-content space-between
	flex-wrap wrap
	align-items baseline

	@media (max-width mobile)
		flex-wrap wrap
		padding-top rem(50px)
		padding-bottom @padding-top

.tab-inner-content
	width 30%
	margin-bottom rem(50px)

	@media (max-width tablet-landscape)
		width 48%

	@media (max-width mobile)
		width 100%
		margin-bottom auto

// .wysiwyg ul:last-child
// 	margin-bottom 20px

.icon
	margin-bottom rem(13px)

.headline
	font-family 'Assistant'
	font-size 20px
	color #424242
	font-weight 600

.subhead
	font-family 'Assistant'
	font-size 18px
	color #898e97
	margin-top rem(13px)
	@media (max-width mobile)
		margin-bottom rem(50px)


>>> .tab-inner-content.wysiwyg
	strong
		font-size 20px
		color black

		+ ul
			margin-top 10px
			margin-bottom 20px
			margin-left 0
			list-style-type none
	@media (max-width mobile)
		ul:last-child
			margin-bottom 20px

	.content
		color #898e97
		font-size 17px
		line-height 25px

</style>
