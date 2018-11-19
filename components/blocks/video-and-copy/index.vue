<!--
The video and copy block
-->

<template lang='pug'>

.block.video-and-copy.flex(:class='{ "right-video": block.type == "right" }')
	.content-left
		.video
			visual.image(v-if='block.image'
				:image='image')
			video-modal(:url='block.video')

	.content-right
		.text-content
			.headline {{ block.headline }}
			.subhead(v-html='$options.filters.markdown(block.subhead)')


</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
marked = require 'marked'

export default
	props: ['block']
	components: 'video-modal': require '~/components/shared/video-modal'

	computed:
		image: -> @$contentful.image @block.image, 650, 650

	filters:
		markdown: (val) -> marked val

</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>

>>>.cta
	width rem(210px)
	padding-left 0
	padding-right 0
	line-height 1
	display block
	@media (max-width mobile)
		width rem(240px)
		margin-top rem(block-v-spacing)
		margin-left auto
		margin-right auto


.right-video
	.content-left
		order 2

.content-left
	max-height 750px
	height 80vh
	// overflow hidden

	@media (max-width mobile)
		max-height none
		height auto
		order 2

.content-right
	@media (max-width mobile)
		order 1

.video
	width 100%
	height 100%

.image
	aspect-ratio(1)
	height 100%

.subhead
	max-width 100%
// text-content


</style>
