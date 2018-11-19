<!--
The app marquee block
-->

<template lang='pug'>

.block.app-marquee

	visual.bkgd(v-if='block.image'
		:image='image')
	visual.mobile-bkgd(v-if='block.mobileImage'
		:image='mobileImage')
	.content
		h1.headline {{ block.headline }}
		.subhead {{ block.subhead }}

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
export default
	props: ['block']

	computed:
		image: -> @$contentful.image @block.image, 1300, 585
		mobileImage: -> @$contentful.image @block.mobileImage, 500, 500

</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>

.block
	height rem(585px)
	display flex
	justify-content center
	flex-direction column
	margin-top 0
	inner-wrapper()
.content
	width 49%
	@media (max-width mobile)
		width 100%



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
	position relative
	font-size 42px

.subhead
	position relative
	max-width 400px

.links
	display flex
	flex-wrap wrap
	justify-content flex-start
	align-items center
	margin-top rem(70px)

.badge
	width rem(140px)
	margin-right 14px
@media (max-width mobile)

	>>>.vv-asset
		background-position center left!important
</style>
