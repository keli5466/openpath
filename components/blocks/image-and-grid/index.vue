<!--
The image and grid block
-->

<template lang='pug'>

.block.image-and-grid
	.left(:class='block.imageType')
		visual.image(v-if='block.image && block.imageType == "native"'
			:image='block.image.fields.file.url'
			background='')
		visual.image(v-else
			:image='image')

	.right
		.headline {{ block.headline }}
		.subhead {{ block.subhead }}

		.grid-items
			.grid-item(v-for='{fields:item} in block.gridItems')
				.small-headline {{ item.headline }}
				.wysiwyg(v-parse-anchors v-html='$options.filters.markdown(item.content)')

</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
marked = require 'marked'
export default
	props: ['block']

	filters:
		markdown: (val) -> marked val

	computed:
		image: -> @$contentful.image @block.image, 520, 630

</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>

.block
	display flex
	justify-content space-between
	background offwhite
	@media (max-width mobile)
		flex-direction column
		.left
		.right
			width 100%

.left
	background #e8e8e8
	position relative
	width 40%
	@media (max-width mobile)
		height 40vh

	&.native
		.image
			center()
			width 70%
			max-height 80%
			height auto
			left initial

	.image
		position absolute
		top 0
		left 0
		width 100%
		height 100%

.right
	display flex
	flex-direction column
	justify-content center
	width 60%
	padding rem(90px) rem(90px) rem(34px)
	@media (max-width tablet)
		padding 8.5vw 8.5vw 3vw

.subhead
	font regular, 17px, dark-secondary-text
	line-height 1.47
	font-weight 300
	position relative
	margin-top rem(6px)
	&:after
		content ''
		display block
		width 34px
		height 2px
		background primary
		margin-top rem(22px)
		margin-bottom rem(20px)


// Grid

.grid-items
	display flex
	justify-content space-between
	flex-wrap wrap
	width 100%
	margin-top rem(34px)

.grid-item
	max-width rem(210px)
	width 48%
	display flex
	flex-direction column
	@media (max-width mobile)
		width 100%
	// &:nth-child(1)
	// &:nth-child(2)
	// 	.wysiwyg
	// 		height 150px
	// 		@media (max-width mobile)
	// 			height auto
	// 			margin-bottom rem(30px)

.small-headline
	font regular, 20px, primary-text
	font-weight 600

.wysiwyg
	// EB
	margin-top rem(10px)
	font regular , 17px , #4c4f55
	line-height 1.47
	font-weight 300
	flex 1 0 rem(150px)
	@media (max-width mobile)
		flex auto
		margin-bottom rem(28px)


	// APP Badges
	>>>ol
		display flex
		justify-content space-between
		list-style-type none
		list-style-position none
		margin-left 0
		li
			float left
			width 49%
			list-style-type none
			img
				 max-height 30px

</style>
