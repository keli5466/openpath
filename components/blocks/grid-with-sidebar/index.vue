<!--
The grid with sidebar
-->

<template lang='pug'>

.block.grid-with-sidebar
	.headline {{ block.headline }}
	.flex
		.left
			.list-item(v-for='({fields:item}, index) in block.gridList'
				:key='index'
				:class='{ active: activeTab == index}'
				@click='activeTab = index') {{ item.headline }}

		.right
			height-tween(name='fade' mode='out-in')
				.flex-grid(:key='activeTab')
					.grid-item(v-for='(item, index) in activeList')
						visual.image(
							:image='$contentful.img(item.image, 600, null, { format: "png" })'
							background=''
							loaded='true')
						.small-headline {{ item.headline }}
						.small-subhead {{ item.subhead }}
						smart-link(v-if='item.ctaText'
							:to='item.ctaUrl') {{ item.ctaText }}

</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
export default
	props: ['block']
	components: 'height-tween': require 'vue-height-tween-transition'

	data: -> activeTab: 0

	computed:

		# Get the list of items given the active tab, filtering out empty ones
		activeList: ->
			@$contentful.refs @block.gridList[@activeTab].fields.gridItem

</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>

// Tween between heights
.height-tweening
	transition height .3s ease-out-quad

// Layout
.flex-grid
	display flex
	flex-flow row wrap
	justify-content flex-start
	align-items baseline

	// Eyeballed
	@media (max-width mobile)
		margin-top rem(50px)

.grid-with-sidebar
	block-wrapper()

.flex
	flex-flow row no-wrap
	background none
	@media (max-width mobile)
		flex-direction column
.left
	flex-grow 1
	width 25%

	@media (max-width mobile)
		width 100%

.right
	flex-grow 2
	margin-left 7%
	width 70%

	@media (max-width mobile)
		width 100%
		margin 0 auto

// Headline
.headline
	padding-bottom rem(52px)
	padding-top rem(44px)

// Item
.grid-item
	width 30%
	margin-right 4.5%
	margin-bottom rem(80px)
	&:nth-of-type(3n)
		margin-right 0

	@media (max-width mobile)
		width 45%
		margin-right 10%

		&:nth-of-type(3n)
			margin-right 10%

		&:nth-of-type(even)
			margin-right 0

.list-item
	line-height 1.5
	font 'Assistant', 20px, secondary-text
	font-weight 300
	margin-bottom rem(18px)
	cursor pointer

	&.active
		color primary
		font-weight 600

.small-headline
	font 'Open Sans', 19px, primary-text
	font-weight normal
	margin-top rem(30px)

.small-subhead
	font 'Assistant', 17px, secondary-text
	line-height 1.47
	margin rem(14px) 0
	flex-grow 1
	text-align left
a
	font 'Open Sans', 12px, primary
	text-transform uppercase
	letter-spacing 0.9px

	&:after
		content url('~/static/img/arrow-down.svg')
		transform rotate(-90deg)
		display inline-block
		margin-left 5px

// .image
	// width 100%
	// max-width 80%

	// >>> .vv-image-transition
	// 	margin-top auto

</style>
