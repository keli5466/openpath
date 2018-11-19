<!--
The ambient video block
-->

<template lang='pug'>

.block.ambient-video
	visual.bkgd(v-if="block.image"
		:image="$contentful.image(block.image, 1300, 750)"
		aspect='16:9')
	ambient-video-background(:url='block.videoUrl'
		v-if='block.videoUrl')
	.content
		h1(:class='block.textColor') {{ block.headline }}
		.subhead(:class='block.textColor') {{ block.subhead }}
		nuxt-link.cta-inverse(
			v-if='block.ctaUrl'
			:to='block.ctaUrl') {{ block.ctaText }}
</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
export default
	props: [ 'block' ]
	components: 'ambient-video-background': require '~/components/shared/ambient-video'

</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>

.ambient-video
	margin-top 0
	aspect-ratio(16/9)

.subhead
	margin-top rem(31px)

.cta-inverse
	margin-top rem(67px)

.bkgd
	position absolute
	top 0
	left 0
	width 100%
	height 100%

.light
	color white
.dark
	color #4c4f55
.subhead.dark
	color #898e97

.content
	position absolute
	v-center()
	width 40%
	min-width rem(300px)
	inner-wrapper()


</style>
