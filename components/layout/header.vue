<!--
Global header
-->

<template lang='pug'>

header(:class="{ mobile : activeMenu}")
	.max-width
		nuxt-link.logo(to='/')
			img(src='~/static/img/open-path-logo.svg')
		transition(name='fade')
			.overlay(v-show= 'activeMenu')
		primary-navigation
		mobile-navigation(v-show='activeMenu')
		.mobile-toggle(@click="toggleNav")
			.bars(:class="{active : activeMenu}")
				.bar
				.bar
				.bar
			span Menu
</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
export default

	components:
		'primary-navigation': require '~/components/layout/primary-navigation'
		'mobile-navigation': require '~/components/layout/mobile-navigation'
	data: ->
		activeMenu: false
		lastScroll: 0

	watch:
		$route: -> @activeMenu = false

	mounted: ->
		window.addEventListener 'scroll', @onScroll

	methods:

		onScroll: ->
			st = window.pageYOffset or document.documentElement.scrollTop
			if st > @lastScroll && st > 150
				@$el.classList.add 'hide'
			else
				@$el.classList.remove 'hide'
			@lastScroll = st

		toggleNav: -> @activeMenu = !@activeMenu

</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>

.overlay
	background rgba(black, 0.7)
	position fixed
	left 0
	top 0
	bottom 0
	width 100vw
	height 100vh
	z-index header-z + 1

.bar
	width 100%
	background primary
	height 2px
	margin-top 5px


.bars
	position relative
	height 20px
	z-index header-z + 2
	width rem(27px)
	margin 0 auto

	.bar
		transition all 300ms smooth-in-out
	&.active
		+ span
			opacity 0
		.bar
			transition all 300ms smooth-in-out
			background white
			&:first-child
				transform: translate(0px, 7px) rotate(45deg)
			&:nth-child(2)
				opacity 0
			&:last-child
				transform: translate(0px, -7px) rotate(-45deg)


.logo
	max-width rem(120px)

header
	&.mobile
		height 0
	position fixed
	max-width max-w
	width 100%
	z-index header-z + 2
	background white
	transition transform 300ms ease-in-out
	transform translate(-50px, 0)
	height header-height
	@media (max-width desktop)
		height header-height-mobile
		transform translate(0, 0)
		right 0
		left 0
		.primary-navigation
			display none

	&.hide
		transform translate(-50px, -100%)
		@media (max-width desktop)
			transform translate(0, -100%)

.max-width
	display flex
	justify-content space-between
	align-items center
	max-width max-w
	padding 0 rem(50px)
	margin 0 auto
	background white
	@media (max-width desktop)
		padding rem(25px) rem(50px)
	@media (max-width tablet)
		padding rem(25px) rem(26px)



.mobile-toggle
	display none
	@media (max-width desktop)
		display block


</style>
