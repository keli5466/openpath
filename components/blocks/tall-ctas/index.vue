<!--
The tall cta's block
-->

<template lang='pug'>

.block.tall-ctas
	.headline(v-if='block.headline') {{ block.headline }}
	.flex
		.tall-cta(v-for='({fields:cta}, index) in block.ctaList'
			:key='index')
			.circle-background
				visual.image(
				:image='$contentful.image(cta.image, 255, 255, {format: "png"})'
				background='contain'
				:class='cta.imageSize')
			.content
				.small-headline {{ cta.headline }}
				.small-subhead {{ cta.subhead }}
				smart-link.cta(:to='cta.ctaUrl') {{ cta.ctaText }}

</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
export default
	props: ['block']
</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>

// Specific for customers page
.customers &

	.tall-cta
		width 24%
		padding-right rem(40px)
		padding-left @padding-right

		@media (max-width tablet)
			width 100%


.headline
	inner-wrapper()
	padding-bottom rem(44px)
	// padding-top rem(44px)

.flex
	justify-content space-between
	background transparent

	@media (max-width tablet)
		flex-direction column

.block
	margin-top 2.125rem

.tall-cta
	padding rem(block-v-spacing) rem(block-spacing)
	background offwhite
	width 32%
	align-items center
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
	flex-grow 2
	justify-content center
	flex-direction column
	width 100%

.small-headline
	font-size 19px
	color primary-text
	font-weight 600

// Grows middle text to keep card aligned
.small-subhead
	display flex
	width 100%
	font-size 17px
	color dark-secondary-text
	// align-items center
	flex-grow 1
	margin-top rem(20px)
	margin-bottom rem(51px)
	@media (max-width tablet)
		flex-grow 0


.cta
	margin-top auto
	align-self center
	font-weight 600
	padding-left 0
	padding-right 0
	width rem(210px)
	letter-spacing 0.5px
	@media (max-width tablet)
		align-self flex-start
		margin 0

	&:hover
		background primary
		color white

// Circle Back
.circle-background
	margin 0 auto rem(48px)
	background-color white
	border-radius 50%
	width 100%
	aspect-ratio 1
	max-width rem(253px)
	display block
	position relative
	@media (max-width tablet)
		margin 5%


// Logo
.image
	center()
	aspect-ratio(1)
	max-height rem(123px)
	max-width rem(181px)
	width 60%
	&.cover
		width 100%
		max-width 100%
		max-height 100%
		>>>.vv-background-contain
			background-size cover


</style>
