<!--
The ambient video component
-->

<template lang='pug'>

.ambient-video-background
	#video

</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
Player = require '@vimeo/player/dist/player.js'
export default

	props: ['url']

	mounted: ->
		video = @$el.querySelector '#video'
		options = {
			url: @url
			background: true
			muted: true
			loop: true
		}
		@videoPlayer = new Player video, options
		@videoPlayer.setCurrentTime(0)

</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>

#video
	position absolute
	top 0
	left 0
	width 100%
	height 100%

>>> iframe
	position absolute
	top 0
	left 0
	width 100%
	height 100%
	min-height 100%
	min-width 100%

</style>
