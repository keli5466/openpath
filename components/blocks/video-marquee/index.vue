<!--
The video marquee block
-->

<template lang='pug'>

.block.video-marquee(:class='block.type')
	visual.bkgd(v-if='block.image'
		:image='image'
		background-position='left center')
	visual.mobile-bkgd(v-if='block.mobileImage'
		:image='mobileImage')
	.content
		h1.headline {{ block.headline }}
		.subhead {{ block.subhead }}
	video-modal(v-if='block.video'
		:url='block.video')

</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
export default
	props: ['block']
	components: 'video-modal': require '~/components/shared/video-modal'

	computed:
		image: -> @$contentful.image @block.image, 1300, 585
		mobileImage: -> @$contentful.image @block.mobileImage, 500, 500

</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>
.content
	max-width 410px
	width 100%
	position relative
	margin-left rem(90px)
	@media (max-width tablet)
		margin 0 auto
		width 85%
		padding-bottom rem(30px)

.video-marquee
	margin-top 0
	padding-top rem(90px)
	padding-bottom @padding-top

	@media (max-width tablet)
		position relative
		width 100%
		height auto

	.video-modal
		width 50%
		left 50%
		@media (max-width tablet)
			position relative
			display block
			height auto
			width 100%
			left 0
			// transform translate(0,0)

			>>> .play-button
				position relative
				top 0
				left 0
				transform translate(0,0)
				margin 0 auto

.dark-text
	.headline
		color #424242
	.subhead
		color #898e97

.bkgd, .mobile-bkgd
	position absolute
	top 0
	left 0
	width 100%
	height 100%

.mobile-bkgd
	display none
	@media (max-width mobile)
		display block

.headline
	color white
	position relative
	font-size 42px
	margin-bottom rem(35px)

.subhead
	position relative
	color white
	max-width 488px

</style>
