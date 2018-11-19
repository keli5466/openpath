<!--
The style block
-->

<template lang='pug'>

.block.style.flex
	.content-left(ref='leftWidth')
		#video

		transition(name='fade')
			.post-video-slider(v-show='videoDone')
				.modules
					visual.module(v-for='(module, index) in modules'
						background=''
						:image='module.image'
						:load='true'
						:key='index')

				.renders(ref='renders')
					visual.render(v-for='(render, index) in renders'
						:image='render.image'
						:load='true'
						:key='index')

				.pagination
					.item.black.active(@click='activateModule' data-index='0')
						.label Black
						.circle
					.item.white(@click='activateModule' data-index='1')
						.label White
						.circle

				.arrow(@click='cycleRender')
				.replay(@click='replayVideo')
					.circle

	.content-right
		.text-content
			.headline {{ block.headline }}
			.subhead {{ block.subhead }}
			a.cta(:href="block.ctaUrl") {{ block.ctaText }}
	a.cta.mobile-cta(:href="block.ctaUrl") {{ block.ctaText }}

</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
inViewport = require 'vue-in-viewport-mixin'
Player = require '@vimeo/player/dist/player.js'
{ wait } = require '~/assets/utils'

export default
	props: ['block']
	mixins: [ inViewport ]

	data: ->
		videoDone: false
		currentIndex: 0
		renderIndex: 0
		modules:
			1: image: '/img/style/black-reader.png'
			2: image: '/img/style/white-reader.png'
		renders:
			1: image: '/img/style/mat-1.jpg'
			2: image: '/img/style/mat-2.jpg'
			3: image: '/img/style/mat-3.jpg'
			4: image: '/img/style/mat-4.jpg'

	watch:
		videoDone: -> @initPostVideo()
		'inViewport.now': (visible) ->
			if visible && !@started
				@started = true

				wait 3000, => @videoPlayer.play()
				firstModule = @$el.querySelectorAll '.module'
				firstModule[0].classList.add 'active'

	mounted: ->
		video = @$el.querySelector '#video'
		options = {
			url: @block.videoUrl
			autoplay: false
			muted: true
		}
		@videoPlayer = new Player video, options
		@videoPlayer.on 'ended', ( =>
			@videoDone = true
		)

		window.addEventListener 'resize', @onResize
		@onResize()

	methods:

		initPostVideo: ->
			@renderEls = @.$refs.renders
			@onResize()

		onResize: ->
			if @.$refs.renders
				@.$refs.renders.style.width = @.$refs.leftWidth.offsetWidth * 4 + 'px'
				@setOffset()

		# Go through the backgrounds
		cycleRender: ->
			if @renderIndex >= 3
				@renderIndex = 0
			else
				@renderIndex++

			@setOffset()

		# Set the offset of the current render index
		setOffset: ->
			targetOffset = @.$refs.leftWidth.offsetWidth * @renderIndex
			@.$refs.renders.style.transform = "translateX(-" + targetOffset + "px)"

		# Set the active module to show
		activateModule: (e) ->
			items = @$el.querySelectorAll '.item'
			items.forEach (item) ->
				item.classList.remove 'active'
			e.currentTarget.classList.add 'active'

			@currentIndex = e.currentTarget.getAttribute 'data-index'
			@showModule(@currentIndex)

		# Show the correct module
		showModule: (index) ->
			modules = @$el.querySelectorAll '.module'
			modules.forEach (module) ->
				module.classList.remove 'active'
			modules[index].classList.add 'active'

		# Replay the video
		replayVideo: ->
			@videoPlayer.setCurrentTime(0)
			@videoPlayer.play()
			@videoDone = false

</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>

.block
	max-height 750px

	@media (max-width mobile)
		max-height none

.subhead, .headline
	max-width 365px
.cta
	width rem(210px)
	padding-left 0
	padding-right 0
.mobile-cta
	order 3
	width rem(240px)
	margin-left auto
	margin-right auto

.content-left
	max-height 750px
	height 80vh
	overflow hidden

	@media (max-width mobile)
		max-height none
		order 2

#video
	max-width 100%
	max-height 100%
	width 100%
	height 100%
	position relative

>>> iframe
	position relative
	max-width 100%
	width 100%
	height 100%

.post-video-slider
	position absolute
	top 0
	left 0
	width 100%
	height 100%

.modules
	position absolute
	top 0
	left 0
	width 100%
	height 100%
	z-index 2

.module
	center()
	top 47%
	max-width 40%
	max-height 90%
	opacity 0
	transition opacity 300ms ease-in-out

	&.active
		opacity 1

.renders
	position absolute
	top 0
	left 0
	width 100%
	height 100%
	display flex
	transition transform 300ms ease-in-out

.render
	width 25%
	height 100%
	background white

.arrow
	v-center()
	top 47%
	right 20px
	background white
	width 50px
	height @width
	border-radius 50%
	cursor pointer
	z-index 4
	transition background .3s ease-in-out

	&:hover
		background primary

		&:before
			color white

	&:before
		font-family 'icomoon'
		content icon-arrow
		center()
		color primary
		transition color .3s ease-in-out

.pagination
	position absolute
	bottom 0
	left 0
	right 0
	display flex
	text-align center
	text-transform uppercase
	background white
	font 'Assistant', 12px, primary-text
	cursor pointer
	z-index 4

.item
	padding rem(20px)
	width 50%
	border-bottom 5px solid offwhite
	transition border-bottom-color 300ms ease-in-out

	&.active
		border-bottom-color primary

.white
	border-right 1px solid offwhite

	.circle
		background white
		border-color primary

.black
	.circle
		background black
		border-color black

.label
	display inline-block
	vertical-align middle
	margin-right rem(7px)

.circle
	border 2px solid transparent
	width 10px
	height @width
	border-radius 50%
	display inline-block
	vertical-align middle

.replay
	position absolute
	top 20px
	left 20px
	z-index 4
	text-align center
	cursor pointer

	.circle
		background white
		width 40px
		height @width
		border-radius 50%
		display block
		margin 0 auto
		color primary
		font-size 25px
		transition background .3s ease-in-out, color .3s ease-in-out

		&:before
			content '↺'
			position absolute
			top 28%
			left 61%
			transform rotate(-45deg) translate(-50%, -50%)

		&:hover
			background primary
			color white

	span
		display block
		margin-top 5px

</style>
