<!--
The footer navigation
-->

<template lang='pug'>

.footer-navigation
	nav.left
		nuxt-link(to='/about') About
		nuxt-link(to='/news-press') Press
		nuxt-link(to='/careers') Careers
		nuxt-link(to='/get-started') Get Started
		nuxt-link(to='/partners') Become a Partner
		nuxt-link(to='/integrations') Integrations
		nuxt-link(to='/pricing') Pricing

	nav.right
		nuxt-link(to='/terms-of-use') Terms of Service
		nuxt-link(to='/privacy-policy') Privacy Policy
		nuxt-link(to='/openpath-patents') Patents: 9963921, 9767630

	.extra
		.social
			a(href="https://www.facebook.com/GetOpenpath/" target="_blank")
				.icon.icon-facebook
			a(href="https://www.linkedin.com/company/openpath-security/" target="_blank")
				.icon.icon-linkedin
			a(href="https://twitter.com/OpenpathSec" target="_blank")
				.icon.icon-twitter
			a(href="https://www.instagram.com/openpathsecurity/" target="_blank")
				.icon.icon-instagram

		.store-links
			a(href="https://itunes.apple.com/us/app/openpath-mobile-access/id1306430829?ls=1&mt=8" target="_blank")
				visual.badge(image='/img/app-store-badge.svg'
					background='')
			a(href="https://play.google.com/store/apps/details?id=com.openpath.mobile" target="_blank")
				visual.play-store.badge(image='/img/google-play-badge.svg'
					background='')

</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
# export default
# 	components:
# 	props: []
# 	data: ->
# 	computed:
# 	watch:
# 	methods:
</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>

.footer-navigation
	block-wrapper()
	position relative
	padding-bottom rem(91px)
	display flex
	flex-direction column
	@media (max-width mobile)
		flex-direction column

.extra
	position absolute
	top 0
	right 0
	bottom 0

	@media (max-width tablet-landscape)
		position relative
		width 100%
		display block
		margin-top rem(40px)

		.social
			text-align left

.store-links
	a
		display inline-block
		margin-left 10px
		width 120px
		@media (max-width mobile)
			display block
			margin-left 0
			margin-top 20px
			width 150px

.social
	display block
	text-align right
	margin-bottom 20px

	.icon
		display inline-block
		position relative
		width 30px
		height @width
		background light-grey
		border-radius 50%
		margin 0 5px
		color white
		border 1px solid transparent
		transition background .3s ease, color .3s ease, border .3s ease

		&:before
			center()

		&:hover
			background white
			color primary
			border-color primary

.left
	margin-bottom rem(25px)
	display flex
	flex-flow row wrap
	align-self flex-start
	a
		line-height 2.42
	@media (max-width mobile)
		flex-direction column
		a
			transform all 300ms ease
			&:after
				display none

.right
	a
		color #c8c8c8
		text-transform lowercase
	@media (max-width mobile)
		display block
		width 100%
		a
			display block
			margin-bottom rem(20px)
			&:after
				display none

nav
	a
		font 'open-sans', 12px, dark-text, true
		letter-spacing 0.5px
		text-align left
		padding 0 10px
		&:first-child
			padding-left 0
		position relative
		text-transform uppercase
		@media (max-width mobile)
			padding 0
		&:hover
			color primary
		&:active
			text-decoration underline
			color primary
			font-weight bold
		&:after
			content ''
			position absolute
			border-right 1px solid #c8c8c8
			height 9px
			top 50%
			left 100%
			transform translate(-100%, -50%)
		&:last-child
			&:after
				display none
				padding-right 0
</style>
