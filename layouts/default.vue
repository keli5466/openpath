<!--

-->

<template lang='pug'>

.default-layout
	layout-header
	notification
	main: nuxt
	footer-navigation

</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
require 'normalize.css'
module.exports =

	components:
		'notification': require '~/components/shared/notification'
		'layout-header': require '~/components/layout/header'
		'footer-navigation': require '~/components/layout/footer-navigation'

	head: ->

		# Append site name to the title
		titleTemplate: if @$route.path == '/' then '%s' else "%s | Openpath"


</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus'>
// This is intentionally not scoped

// Load fonts first
@require '~assets/fonts/index.styl'

// Load boilerplate.  Had to put normalize in the script section because webpack
// was having trouble resolving.  I think the .css suffix was the issue.
@require '~bukwild-stylus-library/boilerplate'

// Set font-sizes so rem values for responsive effects.  Combined with the
// font() call on `body`, this scales from 20px down to 14px
:root
	mq-values(font-size, 100%, 80%, max-w)

// Load global assets
@require '~assets/index.styl'

// Putting these here for now, global styles

html
	background #f2f2f2

body
	overflow-x hidden
	max-width max-w
	margin 0 auto
	height 100%
	padding 0 gutter
	background white
	@media (max-width tablet)
		padding 0 rem(30px)
	@media (max-width mobile)
		padding 0 gutter-mobile

main
	position relative
	display block
	padding-top header-height
	@media (max-width desktop)
		padding-top header-height-mobile

h1, .h1
	font 'open-sans', 42px, primary-text
	font-weight 300
	letter-spacing rem(0.5px)
	line-height 2.8rem

.headline
	font 'open-sans', 28px, dark-text
	font-weight 300
	line-height rem(37px)
	letter-spacing rem(0.5px)

.subhead
	font 'Assistant', 20px, secondary-text
	font-weight 300
	letter-spacing rem(0.4px)
	line-height 1.4
	margin-top rem(27px)

.small-subhead
	font 'Assistant', 17px, secondary-text
	font-weight 300
	line-height 1.67



</style>
