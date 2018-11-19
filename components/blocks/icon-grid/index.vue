<!--
The icon grid block
-->

<template lang='pug'>

.block.grid-icon(:class='[block.layout , block.background, block.verticalSpacing]')
	visual.headline-icon(v-if='block.headlineIcon'
		:image='headlineIcon')
	.headline(v-if='block.headline'
		:class='block.headlineAlign') {{ block.headline }}
	.flex
		.item(v-for='{fields:item} in block.items')
			visual.icon(v-if='item.icon'
				:image='$contentful.image(item.icon, 100, 100, {format: "png"})'
				background='contain')
			.small-headline {{ item.headline }}
			.small-subhead {{ item.subhead }}

</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
export default
	props: ['block']

	computed:
		headlineIcon: -> @$contentful.image @block.headlineIcon, 80, 80

</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>
// Nested for this block
// I am using space-between to create a even margin regardless of on
//  many items are present. Then I am using an:after with a set width
//  so the elements always float left on the wrap
.flex
	flex-flow row wrap
	background transparent
	padding 0 0 rem(20px)
	justify-content space-between
	block-wrapper()
	&:after
		content ''
		width 31%

.headline
	text-align center
	color  #161213
	line-height 1.29
	max-width rem(493px)
	margin 0 auto rem(65px)

.headline-icon
	margin-top rem(75px)

.left
	text-align left
	padding-top 10px
	block-wrapper()

// ICON BLOCK
// I can't think of another way to make it work for any type of
// column, im gonna move towards a % based grid
.item
	width 22%
	margin rem(40px) 0
	display block
	text-align left
	@media (max-width tablet)
		width 31%
	@media (max-width mobile)
		width 48%

// Option Classes

// For now we can use a layout to set 3 or 4 columns
.three-column
	.item
		width 30%
		@media (max-width mobile)
			width 48%
.four-column
	.item
		width 23%
		@media (max-width mobile)
			width 48%
.grey
	background offwhite

.no-margin
	margin-top 0
	padding-top rem(50px)
	padding-bottom rem(50px)

// The Actual Icon
.icon
	aspect-ratio(1)
	max-height rem(40px)
	max-width rem(60px)
	margin-bottom rem(26px)

.small-headline
	font 'Assistant', 20px, primary-text
	font-weight 600
	margin-bottom rem(14px)

.small-subhead
	line-height 1.47
	font-size 17px
	font-weight 300
	color dark-secondary-text
	max-width rem(265px)

</style>
