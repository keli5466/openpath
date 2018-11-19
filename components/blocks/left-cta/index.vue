<!--
The left cta block
-->

<template lang='pug'>

.block.left-cta.flex
	.left
		.text-content
			.headline {{ block.headline }}
			.subhead {{ block.subhead }}
			nuxt-link.cta-inverse(:to='block.ctaUrl') {{ block.ctaText }}

	.right
		visual.image(v-if='block.image'
			:image='block.image.fields.file.url')

</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
export default
	props: ['block']

</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>

.flex
	align-items center

.left
	padding-top rem(90px)
	padding-bottom @padding-top
	@media (max-width mobile)
		padding-top 0
		padding-bottom 0


.left, .right
	width 50%
	@media (max-width mobile)
		width 100%

.right
	position absolute
	top 0
	right 0
	height 100%
	@media (max-width mobile)
		position relative
		height 40vh

.image
	position absolute
	top 0
	left 0
	width 100%
	height 100%

.headline
	font open-sans , 28px, #161213
	font-weight 300
	line-height 1.29
	letter-spacing 0.5px
	padding-bottom rem(32px)
	position relative
	&:after
		border-bottom solid 1px primary
		content ''
		position absolute
		top 100%
		left 0%
		width rem(34px)

.subhead
	font regular, 17px, #4c4f55
	line-height 1.47
	font-weight 300
	letter-spacing normal
	margin-top rem(55px)

.cta-inverse
	margin-top rem(27px)
	width rem(210px)
	text-align center
	font-weight 600

</style>
