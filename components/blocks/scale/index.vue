<!--
The scale block
-->

<template lang='pug'>

.block.scale.flex

	.content-left
		.text-content
			.headline {{ block.headline }}
			.subhead {{ block.subhead }}
			a.cta(:href="block.ctaUrl") {{ block.ctaText }}

	.content-right
		.offices
			.office.office-1
				visual.office-image(image='/img/scale-1.png'
					background=''
					:load='true')
				.location SF Office
				.status
					.lock
						visual.locked(image='/img/scale/small-lock.png'
							background=''
							:load='true')
						visual.unlocked(image='/img/scale/small-unlock.png'
							background=''
							:load='true')
					span.text-locked Locked
					span.text-unlocked Unlocked
			.office.office-2
				visual.office-image(image='/img/scale/nyc-photo.png'
					background=''
					:load='true')
				.location NYC Office
				.status
					.lock
						visual.locked(image='/img/scale/small-lock.png'
							background=''
							:load='true')
						visual.unlocked(image='/img/scale/small-unlock.png'
							background=''
							:load='true')
					span.text-locked Locked
					span.text-unlocked Unlocked
			.office.office-3
				visual.office-image(image='/img/scale/la-photo.png'
					background=''
					:load='true')
				.location LA Office
				.status
					.lock
						visual.locked(image='/img/scale/small-lock.png'
							background=''
							:load='true')
						visual.unlocked(image='/img/scale/small-unlock.png'
							background=''
							:load='true')
					span.text-locked Locked
					span.text-unlocked Unlocked
		visual.phone(image='/img/scale/app-bg.png'
			background=''
			:load='true')
			.locks
				.phone-lock.lock-1
					visual.locked(image='/img/scale/lock-icon.png'
						:load='true')
					visual.unlocked(image='/img/scale/unlock-icon.png'
						:load='true')
				.phone-lock.lock-2
					visual.locked(image='/img/scale/lock-icon.png'
						:load='true')
					visual.unlocked(image='/img/scale/unlock-icon.png'
						:load='true')
				.phone-lock.lock-3
					visual.locked(image='/img/scale/lock-icon.png'
						:load='true')
					visual.unlocked(image='/img/scale/unlock-icon.png'
						:load='true')

	a.cta.mobile-cta(:href="block.ctaUrl") {{ block.ctaText }}

</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
{ wait } = require '~/assets/utils'
export default
	props: ['block']
	data: ->
		offices: null
		locks: null

	mounted: ->
		@offices = @$el.querySelectorAll '.office'
		@locks = @$el.querySelectorAll '.phone-lock'

		@initAnimation()

	methods:

		# Start the animation loop
		initAnimation: ->
			await @openLocks(@offices, @locks)
			@resetAnimation(@offices, @locks)

		# Stagger the unlocking animations
		openLocks: (offices, locks) -> new Promise (resolve) =>
			offsetDelay = 1000
			Object.keys(offices).forEach (i) ->
				wait offsetDelay, ->
					offices[i].classList.add 'active'
					locks[i].classList.add 'active'
				offsetDelay += 1000

			wait 4000, resolve

		# Reset the animations
		resetAnimation: (offices, locks) ->
			Object.keys(offices).forEach (i) ->
				offices[i].classList.remove 'active'
				locks[i].classList.remove 'active'
			@initAnimation()


</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>
.text-content
	@media (max-width tablet)
		padding rem(block-v-spacing) rem(block-spacing)

.block
	@media (max-width tablet)
		max-height none
		display block
		width 100%
		padding 0 0 rem(60px)

		.content-left
			display block
			width 100%

		.headline, .subhead
			max-width 100%

.subhead, .headline
	max-width 365px

.content-right
	display flex
	flex-direction column
	padding-top rem(90px)
	padding-left rem(40px)
	padding-right rem(80px)
	min-width 500px

	@media (max-width tablet)
		min-width initial
		order 2
		padding 0 rem(10px)
		margin 0 auto
		max-width 90%
	@media (max-width mobile)
		max-width 95%


.offices
	display flex
	width 100%
	justify-content space-around

.office
	position relative
	width 100%
	&:after
		content ''
		border-left 2px dotted primary
		position absolute
		height 20px
		left 50%
		transform translateX(-50%)
		top calc(100% + 20px)

.office-image
	max-width 100%
	width 120px

.office-1
	&:after
		transform rotate(-26deg)
		right 30%
.office-3
	&:after
		transform rotate(26deg)
		left 30%

.office
	width 30%
	text-align center

	.status
		position relative
		height 30px

		.lock
			position absolute
			left 50%
			transform translateX(-50px)
			margin-right 0
			@media (max-width mobile)
				left -5px
				transform translateX(0)


	span
		position absolute
		left 50%
		top 4px
		transition opacity .3s ease-in-out

		&.text-unlocked
			opacity 0
			transform translateX(-28%)

		&.text-locked
			opacity 1
			transform translateX(-40%)

	.vv-visual
		margin 0 auto

	&.active
		span.text-unlocked
			opacity 1
		span.text-locked
			opacity 0
		.lock
			.locked
				opacity 0
				animation toggleOut 100ms forwards
			.unlocked
				opacity 1
				animation toggleLock 300ms forwards
				animation-delay 100ms

.location
	font 'Open Sans', 13px, primary-text
	margin-top rem(12px)
	margin-bottom rem(20px)

.lock
	position relative
	display inline-block
	margin-right 5px
	vertical-align middle
	width 25px
	height @width

	.locked, .unlocked
		position absolute
		top 0
		left 0
		width 25px
		height @width
		transition opacity 300ms ease-in-out

	.locked
		opacity 1

	.unlocked
		opacity 0

.locks
	position absolute
	top 0
	left 0
	width 100%
	height 100%

>>> .vv-slot
	position absolute
	top 0
	left 0
	width 100%
	height 100%

.phone
	margin 0 auto

>>> .phone-lock
	position absolute
	width 17%
	aspect-ratio(1)

	.locked, .unlocked
		gpu-cache()
		position absolute
		top 0
		left 0
		width 100%
		height 100%
		transition opacity 100ms ease-in-out

	.locked
		opacity 1

	.unlocked
		opacity 0

	&.active
		.locked
			opacity 0
			animation toggleOut 200ms forwards
		.unlocked
			opacity 1
			transform scale(0.9)
			animation toggleLock 400ms forwards
			animation-delay 200ms

.lock-1
	left 23%
	bottom 42%

.lock-2
	left 23%
	bottom 22%

.lock-3
	left 23%
	bottom 2%

.cta
	width rem(210px)
	padding-left 0
	padding-right 0
	&.mobile-cta
		display none

	@media (max-width tablet)
		display none

		&.mobile-cta
			display block
			order 3
			width rem(240px)
			margin rem(60px) auto 0

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

</style>
