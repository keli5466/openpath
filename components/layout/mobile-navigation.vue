<!--
The primary navigation
-->

<template lang='pug'>

transition(name='slide-in-right')
	.mobile-navigation
		nuxt-link.logo(to='/')
			img(src='~/static/img/open-path-logo.svg')
		nav.top
			template(v-for='item, index in items')

				//- Make subnav
				menu-dropdown(v-if='item.subnav' mobile='true')
					.dropdown {{ item.name }}
					ul.dropdown-list(v-if='item.children' slot='menu')
						li
							smart-link(:to='item.path') {{ item.name}}
						li(v-for='child in item.children')
							smart-link(:to='child.path') {{ child.name }}
							.subnav(v-if='child.subnav')
								.subnav-item(v-for='child in child.subnav')
									//- Doesn't work for path??* but if you
									smart-link(
										:class="{active : child.active}"
										:to='child.path') {{ child.name }}

				//- Normal link
				smart-link(v-else :to='item.path') {{ item.name }}

		nav.bottom
			.contact
				nuxt-link.nav-item(to='/contact') Contact
				a.nav-item(href='https://openpathsupport.zendesk.com/hc/en-us' target="_blank") Support
				a.nav-item(href='https://control.openpath.com/login' target="_blank") Login
			nuxt-link.login(to='/get-a-quote') Get Quote
			a.phone(href='tel:1-844-673-6728') 844-673-6728

</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
export default

	components:
		'menu-dropdown': require '~/components/layout/menu-dropdown'

	data: ->
		dropdown: false
		items: require './nav'

	methods:
		toggleDropdown: -> @dropdown = !@dropdown

</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>
.mobile-navigation
	min-height 100vh
	position fixed
	left 0
	top 0
	width 80vw
	display flex
	flex-direction column
	z-index  header-z +1
	background white
	padding rem(38px) rem(24px)
	align-content center
	@media (min-width mobile)
		width  40vw
	@media (min-width desktop + 1px)
		display none

.logo
	align-self flex-start
	margin 0
	padding 0
	width rem(150px)
	@media (max-width tablet)
		width 100px

.contact
	text-align left
	margin-bottom 20px
	width 100%

	a
		line-height 2
		font-size 18px

.bottom
.top
	display flex
	flex-direction column
	font-weight 300
	margin-left rem(38px)
	align-items flex-start




// TOP
.top
	letter-spacing 0.2px
	line-height 1.14
	color #161213
	margin-top rem(50px)
	font-size 32px
	@media (max-width tablet)
		font-size 22px, true
		margin-top rem(29px)
	.menu-dropdown-container
	a
		line-height 2.24

// DROPWDOWN
// Overriding menu style
>>>.menu
	position relative
	box-shadow none
	padding 0
ul
	margin-top 0
	margin-bottom 0
	padding 0
	list-style-type none
	color secondary-text
	font-size 22px
	@media (max-width tablet)
		font-size 17px, true


.subnav-item a
	color secondary-text
	font-size 22px
	@media (max-width tablet)
		font-size 17px, true
	line-height 2.29
	transition all 200ms smooth-in-out
	margin-left rem(27px)
	&:hover
		margin-left rem(15px)
		opacity 0.5
// BOTTOM
.bottom
	margin-top rem(53px)
	text-transform uppercase
	letter-spacing 0.5px
	text-align center
	margin-right auto
	font-size 14px
	@media (max-width tablet)
		font-size 12px, true
	a
		display block

.login
	background primary
	border-radius 3px
	// width rem(200px)
	font 'Assistant' , 12px, white
	padding 17px 60px
	text-align center
	font-weight bold

.phone
	margin-top rem(13px)
	font 'Assistant', 13px, primary
	font-weight 600
	align-self center
	text-align center
</style>
