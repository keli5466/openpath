<!--
The wysiwyg block
-->

<template lang='pug'>

.block.wysiwyg
	.content(v-if='block.content'
		v-html='$options.filters.markdown(block.content)'
	:class='block.border')

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

>>>.hdr
	display none

.wysiwyg
	margin-bottom rem(110px)

.headline
	font 'open-sans' , 42px, #424242
	font-weight 300
	letter-spacing 0.2px
	margin-bottom rem(17px)

.subhead
	font 'Assistant' , 20px, #898e97
	line-height 1.5
	font-weight normal
	margin-top 0
	margin-bottom rem(77px)

>>>.content
	position relative
	margin 0 auto
	max-width rem(700px)
	// padding-top rem(38px)
	font 'Assistant' , 20px, #626262
	line-height 1.5
	letter-spacing 0.5px
	text-align justify
	text-align-last center
	&.none
		&:before
			display none
	img
		width 100%
		margin-bottom rem(16px)
	em
		font 'Assistant' , 17px, #4c4f55
		font-weight 300
		line-height 1.47
		font-style normal

	ul
		font 'Assistant' , 20px, #8a8a89
		margin 0
		padding 0
		list-style-type none
		li
			line-height 2
			font-weight 300
			padding-left rem(20px)
			position relative
			padding-top rem(30px)
			&:before
				position absolute
				left 0
				content '\2022 '
				color  #898e97
			a
				color primary
				text-decoration underline

	blockquote
		padding 0 rem(100px)
		font 'open-sans' , 28px , #161213
		line-height 1.29
		text-align center
		letter-spacing 0.5px
		font-weight 300
		@media (max-width tablet)
			padding 0 5vw

</style>
