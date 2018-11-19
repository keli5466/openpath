<!--
The slider and copy block
-->

<template lang='pug'>

.block.slider-and-copy(:class='block.layout')

	.half(ref='leftWidth')
		.slider(ref='slider' v-if='block.slides.length > 1')
			visual.slide(v-for='{fields:slide, sys} in block.slides'
				:image='slide.file.url + "?fl=progressive&fm=jpg&h=650&q=90&w=650"'
				:key='sys.id'
				:load='true'
				:style='{ width: (100 / block.slides.length) + "%" }')
		.next-slide(v-if='block.slides.length > 1'
			@click='nextSlide')
		.single-slide(v-if='block.slides.length == 1')
			visual.slide.active(
				:image='$contentful.image(block.slides[0], 650, 650)')

	.half.wysiwyg
		.headline {{ block.headline }}
		.copy(v-html='$options.filters.markdown(block.copy)')

</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
marked = require 'marked'
{ wait } = require '~/assets/utils'

export default
	props: ['block']

	data: ->
		activeSlide: 0

	filters:
		markdown: (val) -> marked val

	mounted: ->
		if @.$refs.slider
			window.addEventListener 'resize', @onResize
			@onResize()

	methods:

		# Resize the image slider on resize window
		onResize: ->
			@.$refs.slider.style.width = @.$refs.leftWidth.offsetWidth * @block.slides.length + 'px'
			@setOffset()

		# Go through the slides
		nextSlide: ->
			if @activeSlide >= @block.slides.length - 1
				@activeSlide = 0
			else
				@activeSlide++

			@setOffset()

		# Set the offset of the current render index
		setOffset: ->
			targetOffset = @.$refs.leftWidth.offsetWidth * @activeSlide
			@.$refs.slider.style.webkitTransform = "translateX(-" + targetOffset + "px)"

</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>

.block
	display flex

	@media (max-width tablet)
		flex-direction column

.headline
	inner-wrapper()

	@media (max-width tablet)
		padding-left rem(40px)
		padding-right @padding-left

	&:after
		content ''
		display block
		width 32px
		height 1px
		background primary
		margin-top rem(32px)
		margin-bottom @margin-top

.copy
	font-family 'Assistant'
	font-size 17px
	color #4c4f55
	line-height rem(25px)
	inner-wrapper()

	@media (max-width tablet)
		padding-left rem(40px)
		padding-right @padding-left
		margin-bottom rem(40px)

.half
	position relative
	width 50%
	display flex
	justify-content center
	flex-direction column

	@media (max-width tablet)
		width 100%

.left
	.half
		overflow hidden
		&:first-of-type
			order 1
			@media (max-width tablet)
				order 2 !important
		&:last-of-type
			order 2
			@media (max-width tablet)
				order 1 !important

.right
	.half
		&:first-of-type
			order 2
			@media (max-width tablet)
				order 2 !important
		&:last-of-type
			order 1
			@media (max-width tablet)
				order 1 !important

.single-slide
	position relative
	overflow hidden
	aspect-ratio(1)

	.slide
		position absolute
		top 0
		left 0
		width 100%
		height 100%

.slider
	display flex
	position relative
	overflow hidden
	transition transform .7s ease-in-out-quad

	.slide
		height 100%
		aspect-ratio(1)

.next-slide
	position absolute
	bottom 44px
	right 44px
	width 54px
	height 54px
	background white
	border-radius 50%
	z-index 2
	cursor pointer
	transition background .3s ease-in-out

	@media (max-width tablet)
		bottom 20px
		right 20px

	&:hover
		background primary

		&:before, &:after
			background white

	&:before
		center()
		content ''
		width 1px
		height 12px
		background primary
		transform rotate(-45deg)
		top 32%
		right 47%
		transition background .3s ease-in-out

	&:after
		center()
		content ''
		width 1px
		height 12px
		top 47%
		right 47%
		background primary
		transform rotate(45deg)
		transition background .3s ease-in-out

</style>
