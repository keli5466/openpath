<!--
The latest features block
-->

<template lang='pug'>

.block.latest-features
	.headline {{ block.headline }}
	.features
		.item(v-for='({fields:item}, index) in block.videoFeatures'
			:key='index')
			.feature-container
				video-modal(v-if='item.videoUrl'
					:url="item.videoUrl")
				image-modal(v-if='item.listingImage'
					:listingImage='item.listingImage.fields.file.url'
					:image='item.image.fields.file.url')

			.content
				.small-headline {{ item.headline }}
				.subhead {{ item.subhead }}


</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
export default
	props: ['block']
	components:
		'video-modal': require '~/components/shared/video-modal'
		'image-modal': require '~/components/shared/image-modal'

</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>

// Duplicated from news.vue
.latest-features
	padding rem(67px) rem(100px) rem(84px)
	background offwhite
	@media (max-width tablet)
		padding rem(block-v-spacing) rem(block-spacing)

.features
	display flex
	justify-content center
	@media (max-width mobile)
		flex-direction column

.headline
	margin-bottom rem(63px)
	text-align center
	font 'open-sans', 28px, #272727
	@media (max-width mobile)
		margin-bottom 0

.feature-container
	background black
	position relative
	aspect-ratio(16/9)
	@media (max-width mobile)
		width 100%

.item
	width 30%
	margin-right rem(87px)
	&:last-child
		margin-right 0
	@media (max-width mobile)
		width 100%
		display flex
		flex-direction column
		align-items flex-start
		margin-top rem(37px)


.small-headline
	font 'open-sans', 19px, #272727
	font-weight normal
	margin-top rem(21px)

// Duplicate
.subhead
	font-size 18px
	margin-top rem(15px)
	line-height normal

</style>
