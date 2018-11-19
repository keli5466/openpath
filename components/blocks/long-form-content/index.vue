<!--
The long form content block
-->

<template lang='pug'>

.block.long-form-content
	.headline {{ block.headline }}
	.subhead(v-if='block.subhead'
		v-html='$options.filters.markdown(block.subhead)')
	.content(v-if='block.content'
		v-html='$options.filters.markdown(block.content)')

</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
marked = require 'marked'
{ wait } = require '~/assets/utils'

export default
	props: ['block']

	filters:
		markdown: (val) -> marked val

	mounted: ->
		# Remove the branding from the embedly
		wait 2000, =>
			iframe = @$el.querySelector 'iframe'
			if iframe
				brd = iframe.contentWindow.document.querySelector '.brd'
				brd.style.display = 'none'
				hdr = iframe.contentWindow.document.querySelector '.hdr'
				hdr.style.display = 'none'

</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>

.long-form-content
	padding rem(52px) rem(120px)
	@media (max-width tablet)
		padding rem(52px) 10vw
	@media (max-width mobile)
		padding rem(30px) 5vw


	>>> h2
		padding-bottom rem(30px)

	>>> h3
		padding-bottom rem(15px)

	>>> p
		padding-bottom rem(30px)

	>>> img
		width 100%
		margin-top rem(67px)
		margin-bottom rem(67px)

	>>> em
		font 'Assistant' , 17px, #4c4f55
		font-weight 300
		line-height 1.47
		font-style normal

	>>> ul
		font 'Assistant' , 20px, #8a8a89
		margin 0
		padding 0
		list-style-type none
		li
			line-height 2
			font-weight 300
			padding-left rem(20px)
			position relative
			padding-left rem(20px)
			&:before
				position absolute
				left 0
				v-center()
				// EBed to make the bullet look a little larger
				font-size 25px
				content '\2022 '
				color  #898e97

	>>> a
		color primary
		text-decoration underline

	>>> blockquote
		padding 0 rem(100px)
		font 'open-sans' , 28px , #161213
		line-height 1.29
		text-align center
		letter-spacing 0.5px
		font-weight 300
		@media (max-width tablet)
			padding 0 5vw

.content
	position relative
	padding-top rem(38px)
	font 'Assistant' , 20px, #626262
	line-height 1.5
	letter-spacing 0.5px

	&:before
		border-top solid primary 2px
		content ''
		width rem(34px)
		position absolute
		left 0
		top 0

.headline
	font 'open-sans' , 42px, #424242
	font-weight 300
	line-height 1
	letter-spacing 0.2px
	margin-bottom rem(17px)

.subhead
	font 'Assistant' , 20px, #898e97
	line-height 1.5
	font-weight normal
	margin-top 0
	margin-bottom rem(77px)

</style>
