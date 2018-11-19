<!--
The integrations block
-->

<template lang='pug'>

.block.integrations.flex
	.content-left
		visual.computer(image='/img/integrations/lap-frame.png'
			background=''
			:load='true')
			.entries
				visual.ui(image='/img/integrations/ui-bg.png'
					background=''
					:load='true')
					visual.entry(v-for='(entry, index) in entries'
						:image='entry.image'
						:key='index'
						background=''
						:load='true')

	.content-right
		.text-content
			.headline {{ block.headline }}
			.subhead {{ block.subhead }}
			visual.image(v-if="block.image"
				:image='block.image.fields.file.url'
				aspect='1'
				:load='true')
				.circles
					visual.circle(v-for='(circle, index) in circles'
						:image='circle.image'
						:key='index'
						:load='true')
			span Syncing Directory
			.apps
				visual.app(v-for='app in block.apps'
					:image='app.fields.file.url'
					background=''
					:key='app.sys.id'
					:load='true')
	.mobile-bottom
		.apps
			visual.app(v-for='app in block.apps'
				:image='app.fields.file.url'
				background=''
				:key='app.sys.id'
				:load='true')
		a.cta.mobile-cta(:href="block.ctaUrl") See All Integrations
</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
{ wait } = require '~/assets/utils'

export default
		props: ['block']

		data: ->
			people: null
			rows: null
			circles:
				0: image: '/img/integrations/1.png'
				1: image: '/img/integrations/2.png'
				2: image: '/img/integrations/3.png'
				3: image: '/img/integrations/4.png'
				4: image: '/img/integrations/5.png'
				5: image: '/img/integrations/6.png'
				6: image: '/img/integrations/7.png'
				7: image: '/img/integrations/8.png'
				8: image: '/img/integrations/4.png'
				9: image: '/img/integrations/1.png'
				10: image: '/img/integrations/8.png'
				11: image: '/img/integrations/4.png'
				12: image: '/img/integrations/5.png'
				13: image: '/img/integrations/1.png'
				14: image: '/img/integrations/2.png'
				15: image: '/img/integrations/3.png'
				16: image: '/img/integrations/4.png'
			entries:
				0: image: '/img/integrations/entry-1.png'
				1: image: '/img/integrations/entry-2.png'
				2: image: '/img/integrations/entry-3.png'
				3: image: '/img/integrations/entry-4.png'
				4: image: '/img/integrations/entry-5.png'
				5: image: '/img/integrations/entry-6.png'
				6: image: '/img/integrations/entry-7.png'
				7: image: '/img/integrations/entry-8.png'

		mounted: ->
			@people = @$el.querySelectorAll '.circle'
			@rows = @$el.querySelectorAll '.entry'
			@initAnimation()

		methods:

			initAnimation: () ->
				await @startAnimation(@people, @rows)
				@initAnimation()

			# The start of the animation
			startAnimation: (people, rows) -> new Promise (resolve) =>
				circleDelay = 1000
				randomOffset = 0

				Object.keys(people).forEach (i) ->
					wait circleDelay, ->

						randomOffset = Math.floor(Math.random() * 200) + 1
						randomOffset *= -1

						people[i].classList.add 'moving'
						people[i].style.transform += "translate(-550px, " + randomOffset + "px)"

						wait 1300, ->
							people[i].classList.remove 'moving'
							people[i].style.transform = ''
							people[i].style.transform += "translate(0, 0)"

					circleDelay += 150

				# Add in the rows
				rowDelay = 1000
				wait 1200, ->
					rows.forEach (row) ->
						wait rowDelay, ->
							row.classList.add 'visible'

							wait 6000, ->
								row.classList.remove 'visible'

						rowDelay += 150

				wait 9000, resolve

</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>

.block
	@media (max-width tablet)
		flex-direction column
		width 100%

		.cta.mobile-cta
			display block

.subhead, .headline
	max-width 365px

.content-left
	@media (max-width tablet)
		order 2
		width 100%

.content-right
	@media (max-width tablet)
		width 100%

.mobile-bottom
	margin rem(40px) auto rem(block-v-spacing)
	order 3
	display none
	@media (max-width tablet)
		display block
		width 100%

		.mobile-cta
			display block
			width rem(240px)
			padding-left 0
			padding-right 0
			margin-left auto
			margin-right auto

		.apps
			width 100%
			margin-top 0
			margin-bottom rem(60px)
			display block
			text-align center

		.app
			display block
			margin 20px auto 0
			width 100%
			max-width 80%

.integrations
	display flex
	background offwhite
	max-height 750px
	@media (max-width tablet)
		max-height none

.mobile-cta
	margin 0

.text-content
	padding-right rem(100px)
	padding-left rem(100px)
	padding-top rem(130px)
	padding-bottom rem(100px)
	width 100%
	// change to global padding for text-content
	@media (max-width tablet)
		padding 4.375rem 3.75rem

.image
	position relative
	max-width 150px
	margin rem(70px) auto rem(10px)
	overflow visible

.computer
	width 100%
	z-index 4

span
	text-align center
	display block
	font 'Open Sans', 13px, secondary-text

>>> .image .vv-image
	z-index 1

>>> .image .vv-slot
	z-index 0

>>> .computer .ui
	display block
	width 100%

	.vv-slot
		top 46%
		left 3.5%
		right 3.5%
		bottom 11%
		overflow hidden

.circle
	center()
	width 40px
	height 40px
	border-radius 50%

	&.moving
		transition transform 2000ms ease-in-out

.apps
	width 100%
	margin-top rem(70px)
	display flex
	flex-wrap wrap
	justify-content space-between
	align-items center
	@media (max-width tablet)
		display none

.app
	width 30%
	max-width 120px
	@media (max-width tablet)
		width 40%
		margin 0 5%

>>> .computer .vv-slot
	position absolute
	top 5.3%
	left 0
	right 16.6%
	bottom 13%
	text-align left

.entries
	position absolute
	top 0
	left 0
	width 100%
	height 100%
	background offwhite

.header
	display block
	background primary
	color white
	padding 8px 20px
	text-align center

.entry
	display block
	opacity 0
	transform translateY(15px)
	transition opacity 300ms ease-in-out, transform 300ms ease-in-out

	&.visible
		opacity 1
		transform translateY(0)

</style>
