<!--
The investors block
-->

<template lang='pug'>

.block.investors
	visual.headline-icon(v-if='block.headlineIcon'
		:image='block.headlineIcon.fields.file.url')
	.headline {{ block.headline }}

	.investor(v-for='{fields:investor} in block.investors')
		.left
			.small-headline {{ investor.headline }}
			.subhead {{ investor.subhead }}
			nuxt-link(v-if='investor.ctaUrl'
				:to='investor.ctaUrl') {{ investor.ctaText }}

		.right
			visual.image(v-if='investor.image'
				background = 'contain'
				:image='investor.image.fields.file.url')

</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
export default
	props: ['block']
</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>

.headline-icon
	display block
	margin-bottom 15px

.headline
	display block
	margin 0 auto
	text-align center
	margin-bottom 47px

.investor
	display flex
	justify-content space-between

	@media (max-width mobile)
		flex-direction column

.small-headline
	font-family 'Open Sans'
	font-size 28px
	line-height 36px
	letter-spacing 0.5px
	font-weight 300

	&:after
		content ''
		position relative
		width 34px
		height 1px
		background primary
		display block
		margin-top rem(24px)
		margin-bottom rem(28px)

.subhead
	font-family 'Assistant'
	font-size 17px
	line-height 25px

.left, .right
	position relative
	width 50%

	@media (max-width mobile)
		width 100%

.right
	@media (max-width mobile)
		order 1
		aspect-ratio(1)

.left
	padding rem(90px)

	@media (max-width mobile)
		order 2
		padding-left rem(40px)
		padding-right @padding-left

>>> .image
	position absolute
	top 0
	left 0
	width 100%
	height 100%

</style>
