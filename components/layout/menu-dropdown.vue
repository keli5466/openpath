<!--
The primary navigation
-->

<template lang='pug'>
.menu-dropdown-container
	.menu-dropdown(v-if='mobile'
		@click='open = !open')

		//- The link to click to open the menu
		span.link: slot

		//- The menu contents
		transition(name='fade')
			.menu(v-show='open' @click='open = !open'): slot(name='menu')

	.menu-dropdown(v-else
		@mouseover='open = true'
		@mouseleave='open = false'
		@touchstart='open = !open')

		//- The link to click to open the menu
		span.link: slot

		//- The menu contents
		transition(name='fade')
			.menu(v-show='open' @mouseleave='open = false'): slot(name='menu')

</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
export default
	props:
		['mobile']

	data:->
		open: false

	watch:

		# Close when clicking outside
		open: -> (@$clickOutside @$el, => @open = false) if @open

		# Close automatically when the route changes
		$route: -> @open = false

</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>

// Parent
.menu-dropdown-container
	position relative
	// height 100%
	margin-right 2.5vw
	&:last-child
		margin-right 0

// Dropdown arrow
.dropdown
	position relative
	&:after
		display inline-block
		margin-left rem(6px)
		content icon-arrow-down
		font 'icon', 7px, primary

// Actual drop down
.menu
	box-shadow 0 3px 4px 0 rgba(0, 0, 0, 0.11)
	z-index header-z + 1
	margin 0
	padding 0
	top calc(100px - 30px)
	transform translateX(-35px)
	width rem(250px)
	position absolute
	background white
	padding-left rem(37px)
	padding-right @padding-left
	@media (max-width desktop)
		top 0
		transform translateX(0)



</style>
