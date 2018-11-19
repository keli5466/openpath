<!--
The download ctas block
-->

<template lang='pug'>

.block.download-ctas
	.headline {{ block.headline }}
	.ctas.flex
		.download(v-for='{fields:cta} in block.downloads')
			.circle-background
				visual.image(v-if='cta.image'
					:image='cta.image.fields.file.url' background='contain')
			.content
				.small-headline {{ cta.headline }}
				a.cta(v-if='cta.file'
					:href='cta.file.fields.file.url' target="_blank") Download PDF

	nuxt-link.cta-inverse(v-if='block.ctaUrl'
		:to='block.ctaUrl') {{ block.ctaText }}

</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
export default
	props: ['block']

</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>
.download-ctas
	text-align center

.headline
	margin 0 auto
	text-align center
	font open-sans, 42px, primary-text
	margin-bottom rem(64px)
	margin-top rem(80px)

.flex
	background transparent
	flex-flow row wrap
	@media (max-width mobile)
		flex-direction column

.download
	background offwhite
	padding rem(block-v-spacing) rem(block-spacing)
	width 32%
	flex 1 1 32%
	align-items center
	display flex
	flex-direction column
	text-align left
	margin-right rem(10px)
	margin-bottom rem(10px)
	&:last-child
		margin-right 0

	@media (max-width tablet)
		padding 5vw 2.5vw

	@media (max-width mobile)
		padding rem(5px)
		flex-direction row
		width 100%
		margin-bottom rem(10px)
		&:last-child
			margin-bottom 0

// Text
.small-headline
	font open-sans, 19px, #272727
	line-height normal
	letter-spacing normal
	flex-grow 1
	text-align center

.content
	display flex
	flex-grow 2
	justify-content center
	flex-direction column
	width 100%
	@media (max-width mobile)
		padding 5%

.cta
	width rem(210px)
	padding-left 0
	padding-right 0
	margin rem(37px) auto 0
	@media (max-width tablet)
		width 100%

// Bottom CTA
.cta-inverse
	margin-top rem(76px)
	margin rem(76px) auto 0

// Circle Back
.circle-background
	margin 0 auto rem(34px)
	background-color white
	border-radius 50%
	width 100%
	aspect-ratio 1
	max-width rem(253px)
	display block
	position relative
	@media (max-width mobile)
		margin 5%
		width 80%

// Logo
.image
	center()
	aspect-ratio(1)
	border-radius 50%
	width 70%
	max-width rem(125px)

</style>
