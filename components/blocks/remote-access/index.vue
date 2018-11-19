<!--
The remote access block
-->

<template lang='pug'>

.block.remote-access.flex
	.content-left
		.text-content
			.headline {{ block.headline }}
			.subhead {{ block.subhead }}
			a.cta(:href="block.ctaUrl") {{ block.ctaText }}
	.content-right
		.slider(v-if='block.slides' ref='slider')
			.slide(v-for='({fields:slide}, index) in block.slides'
				:data-index="index")
				visual.top(:image='slide.messageImage.fields.file.url'
					:load='true')
					.message {{ slide.message }}
		.bottom
			visual.phone(image='/img/remote-access/remote-app.png'
				background=''
				:load='true')
				visual.locked(image='/img/remote-access/Lock-icon.png'
					:load='true')
				visual.unlocked(image='/img/remote-access/unlock-icon.png'
					:load='true')
	a.cta.mobile-cta(:href="block.ctaUrl") {{ block.ctaText }}

</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
inViewport = require 'vue-in-viewport-mixin'
{ wait } = require '~/assets/utils'

export default

	props: ['block']
	mixins: [ inViewport ]

	data: ->
		slides: []
		currentSlide: 0
		currentMessage: null
		started: false

	watch:
		'inViewport.fully': (visible) ->
			if !@started && visible then @initAnimation()

	mounted: ->
		@slides = @$el.querySelectorAll '.slide'
		@currentMessage = @slides[0].querySelector '.message'
		@slides[@currentSlide].classList.add 'visible'

	methods:

		# Init the animation
		initAnimation: ->
			await @startAnimation()

		startAnimation: -> new Promise (resolve) =>
			@started = true

			@slides[@currentSlide].classList.add 'visible'

			wait 1000, =>
				@currentMessage.classList.add 'visible'

				wait 4000, =>
					@setNextActiveSlide()
					@slides[@currentSlide].classList.add 'visible'

					wait 2000, =>
						@currentMessage.classList.add 'visible'

						wait 2000, =>
							phone = @$el.querySelector '.phone'
							phone.classList.add 'visible'

							wait 4000, =>
								@removeActive()
								@initAnimation()

			wait 9000, resolve


		# Set the active slide
		setNextActiveSlide: ->
			if @currentSlide >= @slides.length - 1
				@currentSlide = 0
			else
				@currentSlide++

			@currentMessage = @slides[@currentSlide].querySelector '.message'

		# Remove the active slide
		removeActive: ->
			@currentSlide = 0
			@currentMessage = @slides[@currentSlide].querySelector '.message'
			toRemove = @$el.querySelectorAll '.visible'
			toRemove.forEach (item) ->
				item.classList.remove 'visible'

</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>
.text-content
	@media (max-width tablet)
		width 100%
		padding rem(block-v-spacing) rem(block-spacing)
		.headline
			font-size 24px, true

		.subhead
			font-size 18px, true
			line-height normal

		.cta
			display none

.subhead
	max-width 365px

.flex
	@media (max-width tablet)
		flex-direction column

.cta
	width rem(210px)
	padding-left 0
	padding-right 0
.cta.mobile-cta
	display none
	@media (max-width tablet)
		display block
		width rem(240px)
		margin rem(block-v-spacing) auto

.remote-access
	height 630px

	@media (max-width tablet)
		height auto
		max-height initial

.content-right
	height 100%
	flex-direction column

	@media (max-width tablet)
		display block
		width 100%
.content-left
	@media (max-width tablet)
		width 100%

.slider
	display block
	position relative
	height 50%
	width 100%

	@media (max-width tablet)
		aspect-ratio(2/1)

.top
	position absolute
	top 0
	left 0
	right 0
	height 100%

.bottom
	display block
	position relative
	height 50%
	width 100%
	background white
	text-align center
	@media (max-width tablet)
		position relative
		background transparent

.slide
	position absolute
	top 0
	left 0
	width 100%
	height 100%
	opacity 0
	transition opacity 300ms ease-in-out

	&.visible
		opacity 1

	&:first-of-type
		.message
			border-top-right-radius 0
			top 30%
			left 10%
			&:before
				left 99%
				top 0px
				transform scale(-1)

	&:last-of-type
		.message
			text-align center
			top 30%
			right 10%
			border-bottom-left-radius 0
			&:before
				right 99.5%
				bottom 0

>>> .top .vv-slot
	position absolute
	top 0
	left 0
	width 100%
	height 100%

.message
	position absolute
	padding rem(15px) rem(35px)
	font regular, 16px, secondary-text
	text-align left
	width 50%
	text-align left
	line-height 1.3
	background white
	border-radius 17px
	padding rem(15px) rem(35px)
	opacity 0
	transform translateX(-20px)
	transition opacity 300ms ease-in-out,
						 transform 300ms ease-in-out

	&:before
		content icon-speech-arrow
		font-family 'icomoon'
		color white
		position absolute
		line-height 1
		font-size 20px

	&.visible
		opacity 1
		transform translateX(0)

>>> .phone
	position absolute
	width 430px
	max-height 100%
	h-center()
	bottom 0

	img
		transition transform 600ms ease-in-out

	@media (max-width tablet)
		position relative
		max-width initial
		max-height initial
		max-width 100%
		top initial
		right initial
		bottom initial
		transform translate(0,0)

	.vv-slot
		position absolute
		top 0
		left 0
		width 100%
		height 100%
		transition transform 600ms ease-in-out

	.locked .vv-fill, .unlocked .vv-fill
		top 0

	.locked, .unlocked
		position absolute
		left 25%
		top 63%
		width 15%
		aspect-ratio(1)
		transition opacity 100ms ease-in-out
		@media (max-width tablet)
			top 55%

	.locked
		opacity 1

	.unlocked
		opacity 0

	&.visible
		img
			transform translateY(-10%)
		.vv-slot
			transform translateY(-12%)
			@media (max-width tablet)
				transform translateY(-10%)

		.locked
			opacity 0
			animation toggleOut 300ms forwards
		.unlocked
			opacity 1
			transform scale(0.9)
			animation toggleLock 600ms forwards
			animation-delay 300ms

	@keyframes toggleOut
		0%
			transform scale(1)
		100%
			transform scale(0.9)

	@keyframes toggleLock
		0%
			transform scale(0.9)
		50%
			transform scale(1.2)
		60%
			transform scale(1)
		100%
			transform scale(1)

.slide
	opacity 0
	transition opacity 300ms ease-in-out

	&.active
		opacity 1

</style>
