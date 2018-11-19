<!--
The why openpath block
-->

<template lang='pug'>

.block.why-openpath
	.headline {{ block.headline }}

	.features
		feature(v-for="feature in block.reasons"
			:feature='feature'
			:key='feature.sys.id')

	a.cta(:href="block.ctaUrl") {{ block.ctaText }}

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
	@media (max-width mobile)
		display none

.why-openpath
	text-align center
	padding rem(70px) rem(100px)

	@media (max-width tablet)
		padding rem(block-v-spacing) rem(block-spacing)

.features
	display flex
	justify-content space-between
	align-items baseline
	@media (max-width mobile)
		flex-direction column

>>> .feature
	width 30%
	display flex
	flex-direction column
	// Turns to row for mobile
	@media (max-width mobile)
		flex-direction row
		align-items center
		width 100%

	.image
		width rem(62px)
		height 100%
		margin 0 auto rem(26px)
		@media (max-width mobile)
			margin rem(20px)
			width rem(90px)
	.description
		font-size 20px
		padding 0 5px
		width 100%
		@media (max-width mobile)
			text-align left
			line-height 1.3 //EB

.headline
	margin-bottom rem(70px)
	// Take away margin to have equal spacing between elements
	@media (max-width mobile)
		margin-bottom rem(block-spacing)

</style>
