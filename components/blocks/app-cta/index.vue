<!--
The App CTA Block
-->

<template lang='pug'>

.block.app-cta
	.left
		visual.image(v-if='block.image'
			:image='block.image.fields.file.url'
			background='')

	.right
		.small-headline {{ block.smallHeadline }}
		.headline {{ block.headline }}
		.copy.wysiwyg(v-html='$options.filters.markdown(block.copy)')

		.links
			a(:href='block.appStoreLink' target="_blank")
				visual.badge(image='/img/app-store-badge.svg'
					background='')
			a(:href='block.playStoreLink' target="_blank")
				visual.play-store.badge(image='/img/google-play-badge.svg'
					background='')

</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
marked = require 'marked'

export default
	props: ['block']

	filters:
		markdown: (val) -> marked val

</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>

.block
	margin-bottom 0
	display flex
	justify-content space-between
	background offwhite

	@media (max-width mobile)
		flex-direction column
		.left
		.right
			width 100%

.left
	position relative
	width 40%
	background #e8e8e8
	@media (max-width mobile)
		height 40vh

.right
	display flex
	flex-direction column
	justify-content center
	width 60%
	padding rem(90px)
	@media (max-width tablet)
		padding 8.5vw

.copy
	font 'Assistant', 17px, #4c4f55
	line-height 25px
	max-width 430px

.image
	center()
	width 60%
	@media (max-width mobile)
		width rem(200px)

.small-headline
	font 'Open Sans', 19px, #272727
	margin-bottom 20px

.headline
	&:after
		content ''
		display block
		width 34px
		height 1px
		background primary
		margin-top rem(22px)
		margin-bottom rem(20px)

.links
	display flex
	justify-content flex-start
	align-items center
	flex-wrap wrap
	margin-top rem(70px)


.badge
	width rem(140px)
	margin-right rem(14px)

</style>
