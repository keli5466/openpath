<!--
The footer template
-->

<template lang='pug'>

.block.footer
	.top-footer.flex
		.content-left
			.text-content
				.logo
					img(src='~/static/img/open-path-logo.svg')
				.headline {{ block.headline }}
				.subhead {{ block.subhead }}
				a.cta(:href="block.ctaUrl") {{ block.ctaText }}
		.content-right
			visual.image(v-if='block.image'
				:image='image'
				background='contain')
		a.cta.mobile-cta(:href="block.ctaUrl") {{ block.ctaText }}

</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
export default
	props: ['block']

	computed:
		image: ->
			if @block.image.fields
				return @$contentful.image @block.image, 700, 700
			else
				return @block.image

</script>
<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>
.content-right
	width 60%
.content-left
	width 40%


.content-left
.content-right
	@media (max-width mobile)
		width 100%
// Changes BG color on mobile
.logo
	margin-bottom rem(43px)
	@media (max-width mobile)
		margin 0 auto rem(34px)

.footer
	block-wrapper()
	margin-top rem(80px)
	margin-bottom rem(59px)
	@media (max-width mobile)
		margin 0 auto


.subhead
	margin-top rem(15px)
	max-width 100%
	@media (max-width mobile)
		margin rem(15px) auto rem(30px)


.flex
.content-left
	background white

.text-content
	padding 0
	@media (max-width mobile)
		padding 0
		text-align center
		margin 0 auto


.cta
	padding-left 0
	padding-right 0
	width rem(210px)
	background primary
	color white
	font-weight bold
	margin-top rem(51px)
	&:hover
		background white
		color dark-text
.image
	aspect-ratio(4/3)
	width 100%
	// margin-left auto
	max-width rem(663px)
	height 100%


</style>
