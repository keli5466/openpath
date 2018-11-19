<!--
The security block
-->

<template lang='pug'>

.block.security.flex
	.content-left
		visual.bkgd.image(:image='$contentful.image(block.image, 650, 650)')
	.content-right
		.text-content
			.headline {{ block.headline }}
			.subhead {{ block.subhead }}
			.features
				feature(v-for="feature in block.features"
					:feature='feature'
					:key='feature.sys.id')
			a.cta(:href="block.ctaUrl") {{ block.ctaText }}
	a.cta.mobile-cta(:href="block.ctaUrl") {{ block.ctaText }}
</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
export default
	props: ['block']
	components: feature: require '~/components/shared/feature'

</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>

.cta
	width rem(210px)
	padding-left 0
	padding-right 0
.text-content
	@media (max-width mobile-landscape)
		width 100%
		padding rem(block-v-spacing) rem(block-spacing)
		.headline
			font-size 24px, true

		.subhead
			font-size 18px, true
			line-height normal

		.cta
			display none

.block
	@media (max-width mobile-landscape)
		flex-direction column

.subhead, .headline
	max-width 365px

.content-right
	padding-top rem(80px)
	padding-bottom @padding-top
	@media (max-width mobile-landscape)
		width 100%
		padding-top 0
		padding-bottom 0

.features
	display flex
	justify-content space-between
	align-items baseline
	flex-flow row wrap
	margin-top rem(67px)
	@media (max-width mobile-landscape)
		width 90%
		margin rem(61px) auto 0

>>>.feature
		width 25%
		@media (max-width tablet-landscape)
			width 50%
			flex-grow 1
			margin 10px auto
		.image
			margin-bottom rem(26px)
			max-height 32px
		.description
			max-width rem(80px)
			margin 0 auto
			@media (max-width mobile-landscape)
				max-width 100%

.mobile-cta
	@media (max-width mobile-landscape)
		display block
		order 3
		width rem(240px)
		padding-left 0
		padding-right 0
		margin rem(block-v-spacing) auto

// Duplicates
.content-left
	@media (max-width mobile-landscape)
		width 100%
		height 40vh
		order 2

</style>
