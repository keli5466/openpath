<!--
The video modal
-->

<template lang='pug'>

.video-modal(:class="{active: active}")
	transition(name='fade')
		.modal(v-show="active")
			.overlay(@click='closeModal')
			.close(@click='closeModal' ref='close')
			#video
	.play-button(@click='openModal')

</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
Player = require '@vimeo/player/dist/player.js'
export default

	props: ['url']

	data: ->
		active: false
		isPlaying: false
		videoPlayer: null

	methods:

		openModal: ->
			video = @$el.querySelector '#video'
			@active = true

			if @isPlaying == true
				@videoPlayer.play()
			else
				@isPlaying = true

				options = {
					url: @url
					autoplay: true
				}
				@videoPlayer = new Player video, options

		closeModal: ->
			@active = false
			@videoPlayer.pause()

</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>

.video-modal
	position absolute
	top 0
	left 0
	width 100%
	height 100%
	z-index header-z + 1

	&.active
		z-index header-z + 3

.overlay
	position absolute
	top 0
	left 0
	width 100%
	height 100%
	background rgba(0,0,0,0.4)

.close
	position absolute
	top calc(((100% - 368px) - 60px) / 2)
	right calc(((100% - 648px) - 60px) / 2)
	@media (max-width tablet)
		right 5%
	width 30px
	height @width
	cursor pointer

	&:before
		content ''
		position absolute
		height 30px
		width 2px
		background primary
		top 44%
		left 19%
		transform rotate(45deg) translate(-50%, -50%)

	&:after
		content ''
		position absolute
		height 30px
		width 2px
		background primary
		top 40%
		left 90%
		transform rotate(-45deg) translate(-50%, -50%)

.modal
	position fixed
	top 0
	left 0
	width 100%
	height 100%
	z-index header-z + 2

#video
	center()
	width 90%
	>>> iframe
		width 100%

.homepage &
	.play-button
		background white
		border-color primary
		width 80px
		height @width

		&:before
			border-left-color black

.play-button
	width 72px
	height @width
	border solid 2px white
	border-radius 50%
	cursor pointer
	center()

	&:before
		content ''
		border-bottom 12px solid transparent
		border-top 12px solid transparent
		border-left 25px solid white
		border-top-left-radius 2px
		border-bottom-left-radius 2px
		center()
		right 45%

</style>
