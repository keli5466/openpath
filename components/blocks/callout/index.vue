<!--
The callout block
-->

<template lang='pug'>

.block.callout
	.left
		visual.headline-icon(v-if='block.icon'
			:image='block.icon.fields.file.url' background='contain')
		.headline {{ block.headline }}
	.right
		.content(v-html='$options.filters.markdown(block.copy)')

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

.callout
	margin rem(110px) auto
	display flex
	inner-wrapper()
	flex-flow row nowrap
	@media (max-width tablet)
		flex-direction column
		.left
		.right
			width 100%



.right
	width 65%
	display flex
	align-items center
	border-left solid 1px #e8e8e8

.left
	width 35%
	padding-top rem(80px)
	padding-bottom rem(80px)
	display flex
	flex-direction row
	align-self center

// LEFT
.headline-icon
	margin-right rem(34px)
	margin-left 0
	margin-bottom 0
	@media (max-width tablet)
		margin-right 2vw

.headline
	// added for a little spacing on tablet
	margin-right rem(20px)
	max-width rem(251px)



// right

.content
	padding-left rem(38px)
	font regular , 20px, secondary-text
	line-height 1.5
	font-weight 300
	>>>p
		padding-top rem(20px)
		strong
			color #424242
			font-weight 600
		&:first-child
			padding-top 0
</style>
