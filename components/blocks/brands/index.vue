<!--
The brands block
-->

<template lang='pug'>

.block.brands(:class='block.margin')
	a.brand-logo(v-for='{fields:logo} in block.logos'
		:href='logo.url')
		img(v-if='logo.image'
			:src='logo.image.fields.file.url')

</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
export default
	props: ['block']

</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>

.brands
	inner-gutter()
	display flex
	justify-content space-between
	align-items center
	flex-wrap wrap
	&.margin-110
		margin-top rem(110px)
		margin-bottom rem(110px)
		@media (max-width tablet)
			margin-top rem(50px)
			margin-bottom rem(50px)



	@media (max-width tablet)
		height 100%

	.brand-logo
		text-align center
		width 20%
		margin-bottom rem(55px)

		.homepage &
			width 15%
			padding 3% 1.5%
			margin-bottom 0
			img
				max-height rem(50px)
			@media (max-width mobile)
				width 30%
				padding 1% 5%
				margin-bottom rem(15px)
				&:nth-child(n+4)
					margin-bottom 0



		@media (max-width tablet)
			width 30%

</style>
