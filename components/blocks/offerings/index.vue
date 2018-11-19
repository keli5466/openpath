<!--
The offerings block template
-->

<template lang='pug'>

.block.offerings
	.wrapper
		.left
			.headline {{ block.leftHeadline }}
			.offering(v-for='{fields:offering} in block.leftOptions')
				visual.image(:image='offering.image.fields.file.url' background='contain')
				.content(v-html='$options.filters.markdown(offering.content)')

		.right
			.headline {{ block.rightHeadline }}
			.offering(v-for='{fields:offering} in block.rightOptions')
				visual.image(:image='offering.image.fields.file.url' background='contain')
				.content(v-html='$options.filters.markdown(offering.content)')

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

.offerings
	background offwhite
	margin 0 auto

.wrapper
	display flex
	flex-flow row nowrap
	background white
	margin 0 rem(155px)
	@media (max-width tablet-landscape)
		margin 0 auto
		width 85%

	position relative
	&:after
		background url('~/static/img/diffuse-shadow.png') no-repeat
		background-size contain
		bottom 0
		content ''
		height 100%
		width 115%
		position absolute
		h-center()
		background-position center bottom
	@media (max-width mobile)
		flex-direction column

.left
.right
	z-index 1
	background white
	width 50%
	display flex
	flex-direction column
	align-items center
	padding rem(41px) rem(62px)
	@media (max-width tablet)
		padding 5vw
		width 100%
	@media (max-width mobile)
		padding 8vw

.left
	border-right solid 1px #e8e8e8
	.image
		max-width 55px

	@media (max-width mobile)
		border-right none
		border-bottom solid 1px #e8e8e8

.headline
	font 'open-sans' , 28px, #161213
	text-align center
	position relative
	padding-bottom rem(21px)
	margin-bottom rem(37px)
	&:after
		border-bottom solid 2px #fa6715
		content ''
		position absolute
		top 100%
		h-center()
		width rem(32px)
>>>.content
		p
			padding-bottom rem(9px)
			&:nth-child(3)
				font-size 17px
				font-weight 300
				color #898e97
				line-height 1.47
				padding-bottom rem(12px)
		span
			display block
			color primary
			font-size 17px
			font-weight 300
			line-height 1.47
			padding-top rem(12px)
		ul
			margin 0
			padding 0
			list-style-type none
			li
				position relative
				padding-left rem(20px)
				margin-bottom rem(10px)
				color #898e97
				font-size 17px
				font-weight 300
				&:before
					position absolute
					left 0
					content '\2022 '
					color  #898e97

.offering
	display flex
	flex-flow row nowrap
	// Will change when the icons are in
	align-items flex-start
	width 100%
	@media (max-width mobile)
		padding-bottom 5vw

	&:nth-child(2)
		margin-top 0
		max-height rem(150px)
		// height 100%
		padding-bottom rem(52px)

	&:last-child
		padding-bottom 0


.image
	aspect-ratio(1)
	width 25%

.content
	margin-left rem(25px)
	font 'Assistant' , 20px,  #898e97
	font-weight 300
	line-height 1.5
	width 80%
	text-align left
>>>strong
		color #424242
		font-weight 600
		&:first-child
			margin-bottom rem(10px)
</style>
