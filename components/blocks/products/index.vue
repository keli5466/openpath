<!--
The products listing block
-->

<template lang='pug'>

.block.products
	.single-product(v-for="{fields:product} in block.products")
		visual.product-image(v-if='product.image'
			:image='$contentful.image(product.image, 700, 700, {format: "png"})'
			background='contain')
		.content
			.headline {{ product.headline }}
			.subhead {{ product.subhead }}
			nuxt-link.cta(v-if='product.ctaUrl'
				:to='product.ctaUrl') {{ product.ctaText }}

</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
export default
	props: ['block']

</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>
.products
	height auto
	display flex
	justify-content space-between
	@media (max-width tablet)
		flex-direction column

// card
.single-product
	background-color #fafafa
	width 32%
	// Needed for even spacing
	padding rem(41px) rem(30px) rem(70px)
	display flex
	flex-direction column
	text-align left
	@media (max-width tablet)
		flex-direction row
		width 100%
		padding 2%
		margin rem(13px) 0

	@media (max-width mobile)
		flex-direction column
		padding rem(40px) rem(25px)

.content
	display flex
	justify-content center
	flex-direction column
	flex-grow 1
	width 100%

	.headline
		font-family 'Assistant'
		font-size 20px
		font-weight 600

// Grows middle text to keep card aligned
.subhead
	display flex
	width 100%
	font-size 17px
	margin-top rem(17px)
	color dark-secondary-text
	align-items center
	flex-grow 1
	margin-bottom block-spacing
	@media (max-width tablet)
		flex-grow 0


.cta
	margin-top auto
	align-self center
	font-weight 600
	letter-spacing 0.5px
	@media (max-width tablet)
		align-self flex-start
		margin 0

	&:hover
		background primary
		color white

.product-image
	aspect-ratio(1)
	width 100%
	margin-bottom rem(18px)



</style>
