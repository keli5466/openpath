<!--
The tabbed products block
-->

<template lang='pug'>

.block.tabbed-products

	.tabs
		.tab(v-for='({fields:headline}, index) in block.tabs'
			:key='index'
			:class='{ active: activeTab == index }'
			@click='activeTab = index') {{ headline.headline }}

	height-tween(name='fade' mode='out-in')
		.tab-content(:key='activeTab')
			template(v-for='({fields:product}, index) in activeList')
				nuxt-link.product(v-if='product.url'
					:to='"product" + product.url'
					:key='index')
					visual.image(v-if='product.image'
						:image='$contentful.image(product.image, 530, 400)'
						loaded='true')
					.small-headline {{ product.headline }}
					.copy(v-html='$options.filters.markdown(product.copy)')
				.product(v-else
					:key='index')
					visual.image(v-if='product.image'
						:image='$contentful.image(product.image, 530, 400)'
						loaded='true')
					.small-headline {{ product.headline }}
					.copy(v-html='$options.filters.markdown(product.copy)')


</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
marked = require 'marked'

export default
	props: ['block']

	components: 'height-tween': require 'vue-height-tween-transition'

	data: -> activeTab: 0

	computed:
		# Get the list of items given the active tab
		activeList: -> @block.tabs[@activeTab].fields.tabItems

	filters:
		markdown: (val) -> marked val

</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>

.tabbed-products
	padding 0 rem(76px)
	margin-bottom rem(70px)
	@media (max-width tablet)
		padding 0 6vw

.tabs
	position relative
	&:after
		content ''
		center()
		width 1px
		background #c8c8c8
		height 100%

.tab
	cursor pointer
	width 50%
	display inline-block
	padding rem(23px) 0
	text-align center
	font-family Assistant
	font-size 18px
	color #272727
	font-weight 300
	letter-spacing 0.2px
	line-height normal
	position relative
	border-bottom solid 1px #c8c8c8

	// Orange Line
	&:after
		content ''
		position absolute
		bottom 0
		left 0
		z-index 1
		right 0
		width 0%
		transition .4s ease-in-out
		height 4px
		background primary

	&.active
		background #fafafa
		font-weight normal
		// Grow animation
		&:after
			width 100.1%

.height-tweening
	transition height .3s ease-out-quad

.tab-content
	display flex
	justify-content space-between
	flex-wrap wrap
	@media (max-width mobile)
		display block

.product
	width 46%
	display flex
	flex-direction column
	margin-top rem(76px)

	@media (max-width mobile)
		width 100%
		margin-top rem(35px)

.image
	aspect-ratio(4/3)
	width 100%


.small-headline
	margin-top rem(51px)
	font-family Assistant
	font-size 20px
	font-weight 600
	color primary-text

.copy
	margin-top rem(18px)
	max-width rem(368px)
	font-family Assistant
	font-size 17px
	font-weight 300
	line-height 1.47
	color dark-secondary-text
</style>
