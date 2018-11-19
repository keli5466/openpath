<!--
The alternate cta marquee
-->

<template lang='pug'>

.block.alternatae-cta-marquee(:class='block.marqueeHeight')
	visual.bkgd(
		v-if='block.image'
		aspect='16:9'
		:image='image'
		background-position='left center')
	visual.mobile-bkgd(v-if='block.mobileImage'
		:image='mobileImage')
	.content(:class='block.type')
		h1 {{ block.headline }}
		.subhead {{ block.subhead }}
		nuxt-link.cta-inverse(
			v-if='block.ctaUrl'
			:to='block.ctaUrl') {{ block.ctaText }}

</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
export default
	props: ['block']

	computed:
		image: -> @$contentful.image @block.image, 1920, 1080
		mobileImage: -> @$contentful.image @block.mobileImage, 500, 500

</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>

// Option for header height
.small
	height rem(465px)
.large
	height rem(sub-section-header)


// Used if there is no background image
.grey-background
	background-color #424242

.alternatae-cta-marquee
	margin-top 0
	max-height rem(sub-section-header)
	display flex
	align-items center

.dark-text
	h1
		color #424242
	.subhead
		color #898e97

.light-text
	h1
	.subhead
		color white

.subhead
	margin-top rem(35px)
	font 'Assistant', 20px, white
	line-height 1.5
	font-weight normal

.cta-inverse
	margin-top rem(72px)

.mobile-bkgd
	position absolute
	top 0
	left 0
	width 100%
	height 100%
	display none
	@media (max-width mobile)
		display block

.content
	max-width 410px
	width 100%
	position relative
	margin-left rem(90px)
	@media (max-width mobile)
		margin 0 auto
		width 85%

</style>
