<!--
The steps block
-->

<template lang='pug'>

.block.steps
	.step(v-for='({fields:step}, index) in block.steps')
		.number(:class='step.color') {{ index + 1 }}
		.step-headline {{ step.headline }}
		.content(v-html='$options.filters.markdown(step.copy)')
		nuxt-link.cta-inverse(v-if='step.ctaUrl'
			:to='step.ctaUrl') {{ step.ctaText }}

</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
marked = require 'marked'

export default
	props: ['block']

	filters:
		markdown: (val) -> marked val

</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>

.steps
	max-width 500px
	margin rem(96px) auto 0
	.how-to-purchase &
		max-width rem(500px)
		@media (max-width mobile)
			margin-left rem(25px)

.step
	position relative
	padding-bottom rem(80px)
	margin-left rem(62px)

	&:before
		content ''
		position absolute
		height 100%
		width 2px
		left rem(-50px)
		top 0
		background #e8e8e8

	&:last-of-type
		&:before
			display none

.number
	position absolute
	top 0
	left rem(-62px)
	width 26px
	height @width
	border-radius 50%
	display flex
	justify-content center
	flex-direction column
	text-align center
	color white
	font-size 17px
	font-weight 600
	padding-bottom 2px

	&.orange
		background primary

	&.yellow
		background yellow

	&.grey
		background grey

	&.blue
		background blue

.step-headline
	font-family 'Open Sans'
	font-size 28px
	font-weight 300
	color #424242
	line-height 25px

.content
	margin rem(12px) 0 0
	font-size 20px
	line-height 30px
	font-weight 300
	color #4c4f55

.cta-inverse
	margin-top rem(41px)

</style>
