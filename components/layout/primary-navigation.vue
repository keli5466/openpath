<!--
The primary navigation
-->

<template lang='pug'>

.primary-navigation
	nav.center
		template(v-for='item, index in items')

			//- Make subnav
			menu-dropdown(v-if='item.subnav' :class="{active : item.active}")
				smart-link.nav-item.dropdown(:to='item.path') {{ item.name }}
				ul.dropdown-list(v-if='item.children' slot='menu')
					li(v-for='child in item.children')
						smart-link(:to='child.path') {{ child.name }}
						.subnav(v-if='child.subnav')
							.subnav-item(v-for='child in child.subnav')
								smart-link(
									:class="{active : child.active}"
									:to='child.path') {{ child.name }}

			//- Normal link
			smart-link.nav-item(v-else :to='item.path') {{ item.name }}

	nav.right
		.contact
			nuxt-link.nav-item(to='/contact') Contact
			a.nav-item(href='https://openpathsupport.zendesk.com/hc/en-us' target="_blank") Support
			a.nav-item(href='https://control.openpath.com/login' target="_blank") Login
		.get-quote
			nuxt-link.quote(to='/get-a-quote') Get Quote
			a.phone(href='tel:1-844-673-6728') 844-673-6728

</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
export default
	components:
		'menu-dropdown': require '~/components/layout/menu-dropdown'

	data: ->
		items: require './nav'

</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>
.primary-navigation
	z-index header-z
	display flex
	flex-grow 2
	@media (max-width tablet)
		display none

.nav-item
	height header-height
	// margin-bottom rem(5px)
	display flex
	position relative
	align-items center
	justify-content center
	// Line Over Active Link
	&:before
		content ''
		position absolute
		top 0
		left 0
		width 0%
		border-bottom 3px solid primary
		transition .4s ease-in-out

// Line Animation
.nuxt-link-active
	&:before
		width 100%


// So even if the bottom link is active only the parent gets the arrow on top
.dropdown-list
	.nuxt-link-exact-active
	.nuxt-link-active
		&:before
			display none

// CENTER
.center
	display flex
	justify-content center
	flex-grow 2
	letter-spacing 0.2px
	font-weight 300
	font 'Assistant', 18px, #272727

// DROPDOWN NAV ITEM STYLES
ul
	letter-spacing 0.5px
	text-align left
	color secondary-text
	font-size 17px, true
	margin-top rem(17px)
	padding 0
	line-height 2.24
	list-style-type none
	white-space nowrap
	li
		&:hover
			color #88cdff

.subnav-item a
	color secondary-text
	font-size 17px, true
	transition all 200ms smooth-in-out
	margin-left rem(27px)
	&:hover
		margin-left rem(15px)
		opacity 0.5
	// Active PH class
	&.active
		color #88cdff


// RIGHT NAV
.right
	display flex
	justify-content flex-end
	text-transform uppercase
	align-items baseline
	letter-spacing 0.5px
	text-align center



.contact
	display flex
	align-items center
	margin-right rem(38px)
	@media (max-width tablet-landscape)
		margin-right 2vw
	a
		position relative
		font 'Assistant', 13px, #424242
		letter-spacing 0.2px
		font-weight 600
		padding-left rem(10px)
		padding-right rem(10px)
		transition color .3s ease

		&:hover
			color primary

		&:after
			content ''
			position absolute
			border-right 1px solid #c8c8c8
			height 12px
			top 50%
			right 0
			transform translate(0%, -50%)
		&:first-child
			padding-left 0
		&:last-child
			padding-right 0
			&:after
				display none

.quote
	background primary
	border-radius 3px
	font 'Assistant' , 12px, white
	padding 9px 0px
	width rem(140px)
	font-weight 600
	border 1px solid transparent
	transition background .3s ease, border .3s ease, color .3s ease
	&:hover
		background white
		border-color primary
		color primary
	@media (max-width tablet-landscape)
		width auto

.get-quote
	a
		display block

.phone
	margin-top rem(8px)
	font 'Assistant', 13px, primary
	font-weight 600


</style>
