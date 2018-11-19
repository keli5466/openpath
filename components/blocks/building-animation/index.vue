<!--
The buidling animation block on the products page
-->

<template lang='pug'>

.block.building-animation
	.left-copy
		.headline(v-in-viewport.once='-200, 0') {{ block.headline }}
		.subhead(v-in-viewport.once='-200, 0') {{ block.subhead }}
		.building-manager(v-in-viewport.once='-200, 0')
			visual.manager(image='/img/products/manager.png')
			.title(v-in-viewport.once='-200, 0') Building Manager

	transition(name='fade')
		.white-out(v-show='resetting')

	.phones(ref='phones')
		visual.phone(v-for='(phone, index) in phones'
			:image='phone.img'
			background=''
			:class='"phone-" + index'
			:key='index'
			:load='true')
			.phone-lock.lock-1
				visual.locked(image='/img/products/Lock-icon.png'
					background=''
					:load='true')
				visual.unlocked(image='/img/products/unlock-icon.png'
					background=''
					:load='true')
			.phone-lock.lock-2
				visual.locked(image='/img/products/Lock-icon.png'
					background=''
					:load='true')
				visual.unlocked(image='/img/products/unlock-icon.png'
					background=''
					:load='true')
			.phone-lock.lock-3
				visual.locked(image='/img/products/Lock-icon.png'
					background=''
					:load='true')
				visual.unlocked(image='/img/products/unlock-icon.png'
					background=''
					:load='true')

	.animation

		.top-legend
			.set(v-for="(item, index) in set"
				:key='index'
				:class='"pin-" + index')
				visual.pin(:image='item.img'
					background='')
				.copy
					.name {{ item.name }}
					.location {{ item.location }}

		.buildings
			.building(v-in-viewport.once='-200, 0' v-for='(building, index) in buildings'
				:key='index'
				:class='"building-" + index')
				.grey-bar
				visual.building-image(:image='building.img'
					:load='true'
					background='contain'
					background-position='right')
					.doors
						.door(v-if='building.locks'
							v-for='(door, index) in building.locks'
							:class='"door-" + index')
					.lock(v-for='(lock, index) in building.locks'
						:class='"lock-" + index'
						:key='index')
						visual.locked(image='/img/products/Lock-icon.png'
							background='')
						visual.unlocked(image='/img/products/unlock-icon.png'
							background='')
						visual.nameplate(v-if='lock.img'
							:image='lock.img'
							background=''
							:load='true')

	.advance(@click='advance'
		:class='{ reset: activeIndex == 2 }')
		transition-group(name='fade')
			.next-text(v-if='animationIndex == 0 && activeIndex != 2' key='1') Unlock
			.next-text(v-if='animationIndex == 1 && activeIndex != 2' key='2') Next Building
			.next-text(v-if='activeIndex == 2' key='3') Start Over

</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
{ wait } = require '~/assets/utils'

export default
	props: ['block']

	data: ->
		animationIndex: 0
		activeIndex: 0
		resetting: false
		buildingEls: null
		phoneEls: null
		phones:
			0: img: '/img/products/phone-1.png'
			1: img: '/img/products/phone-2.png'
			2: img: '/img/products/phone-3.png'
		set:
			0:
				img: '/img/products/la-building-icon.png'
				name: 'Wilshire Blvd Office'
				location: 'Los Angeles, CA'
			1:
				img: '/img/products/la-building-icon.png'
				name: '725 5th Ave'
				location: 'New York, NY'
		buildings:
			0:
				type: 'lock'
				img: '/img/products/building-1.png'
				locks:
					0: type: 'lock'
					1: type: 'lock'
					2: type: 'lock'
					3: type: 'lock'
			1:
				img: '/img/products/building-2.png'
				locks:
					0: type: 'lock'
					1: type: 'lock'
					2: type: 'lock'
					3: type: 'lock'
			2:
				img: '/img/products/building-3.png'
				locks:
					0:
						type: 'pin'
						img: '/img/products/la-office.png'
					1:
						type: 'pin'
						img: '/img/products/nyc-office.png'
					2:
						type: 'pin'
						img: '/img/products/sao-paulo.png'
					3:
						type: 'pin'
						img: '/img/products/london.png'
					4:
						type: 'pin'
						img: '/img/products/dubai.png'
					5:
						type: 'pin'
						img: '/img/products/tokyo.png'
					6:
						type: 'pin'
						img: '/img/products/hong-kong.png'
					7:
						type: 'pin'
						img: '/img/products/sydney.png'

	mounted: ->
		# Cache all of the needed objects
		@buildingEls = @$el.querySelectorAll '.building'
		@phoneEls = @$el.querySelectorAll '.phone'
		@legend = @$el.querySelector '.top-legend'
		wait 1000, => @phoneEls[0].classList.add 'init'
		wait 1000, => @resetting = false

		# Init the animation
		@initAnimation()

	methods:

		# Setup the initial slides and states
		initAnimation: ->
			@buildingEls[0].classList.add 'init'
			@legend.classList.add 'init'
			@phoneEls[0].classList.add 'init'
			@resetting = false

		# When the next button is clicked
		advance: ->
			if @activeIndex >= 2
				@clearClasses()
				@resetAnimation()
			else @animationStep()

		# Fire the corresponding animation
		animationStep: ->
			# If there are no more animations on the slide, go to next
			if @animationIndex >= 1
				@advanceAnimation()

			# If not, advance the current animation
			else
				@animationIndex++

				# Add the next step of the animation
				@buildingEls[@activeIndex].classList.add 'step-' + @animationIndex
				@phoneEls[@activeIndex].classList.add 'step-' + @animationIndex

		# Go to the next animation in the sequence
		advanceAnimation: ->
			# If there are no more slides, reset the animation
			if @activeIndex >= 2
				@clearClasses()
				@resetAnimation()

			# Otherwise, move to the next slide
			else
				await @moveCurrentOut(500)
				@clearClasses()

				# Init the slides and animation for the next slide
				@buildingEls[@activeIndex].classList.add 'init'
				@phoneEls[@activeIndex].classList.add 'init'
				@legend.classList.add 'step-' + @activeIndex

		# Move the current slide out of view
		moveCurrentOut: (delay) -> new Promise (resolve) =>
			@buildingEls[@activeIndex].classList.add 'step-3'

			wait delay, resolve

		# Clear all the animation classes
		clearClasses: ->
			@buildingEls[@activeIndex].classList.remove 'init', 'step-1', 'step-2'
			@phoneEls[@activeIndex].classList.remove 'init', 'step-1', 'step-2'

			# Setup the correct indexes for the next slide and animation
			@incrementIndexes()

		# Reset the whole animation
		resetAnimation: ->
			# Show the white overlay to mask the reset
			@resetting = true

			# Reset everyhting to the original state
			@resetIndexes()
			@legend.classList.remove 'step-1', 'step-2', 'move-pins'
			@buildingEls.forEach (building) ->
				building.classList.remove 'step-1', 'step-2', 'step-3'

			# Setup the initial animation state
			@initAnimation()

		# Increment the indexes
		incrementIndexes: ->
			@animationIndex = 0
			@activeIndex++

		# Reset the indexes
		resetIndexes: ->
			@activeIndex = 0
			@animationIndex = 0

</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>
.wrapper
	inner-wrapper()

.white-out
	position absolute
	top 0
	left 0
	height 100%
	width 100%
	background white
	z-index 5

.block
	padding 0
	padding-top rem(70px)
	border-top 1px solid lightgrey

.building-animation
	min-height 800px

	@media (max-width mobile)
		height auto
		min-height initial

.left-copy
	inner-wrapper()
	position relative
	z-index 6
	pointer-events none

.headline
	font 'Open Sans', 19px, primary-text
	font-weight 400

.subhead
	font 'Assistant', 17px, #4c4f55
	line-height 1.47
	margin-top rem(25px)
	max-width rem(415px)

.building-manager
	margin-top rem(70px)
	margin-left rem(40px)
	@media (max-width mobile)
		margin-left 0
		width 50%

.manager
	width 90px
	height @width
	border-radius 50%
	display inline-block
	vertical-align middle

.title
	margin-left rem(20px)
	display inline-block
	vertical-align middle
	font 'Assistant', 18px, #626262
	letter-spacing 0.5px
	@media (max-width mobile)
		margin-left 0
		margin-top 5px
		display block

.animation
	position absolute
	top 0
	left 0
	width 100%
	height @width

	@media (max-width mobile)
		position relative
		display block
		aspect-ratio(1)

.top-legend
	position absolute
	display flex
	width 500px
	max-width 100%
	justify-content space-between
	top 10%
	right 0
	z-index 2
	transform translate(50%, 0)
	transition opacity 1000ms ease-in-out,
						 transform 1000ms ease-in-out

	&.init
		transform translate(50%, 0)

	&.step-1
		transform translate(0, 0)

	&.step-2
		opacity 0
		transform scale(0.9) translate(-20%, 250%)
		transition-delay 600ms

.set
	display flex
	position relative
	margin-left 40px
	width 50%
	top 0
	right 0
	transition transform 300ms ease-in-out,
						 top 300ms ease-in-out,
						 left 300ms ease-in-out

	@media (max-width mobile)
		margin-left 10px

.pin
	width 30px
	height auto
	vertical-align middle
	margin-right 15px

.copy
	vertical-align middle
	z-index 2

.name
	font 'Assistant', 17px, #4c4f55
	z-index 2
	margin-bottom 5px

.location
	font 'Assistant', 14px, #434343
	font-weight 600
	z-index 2
	text-transform uppercase

.building-image
	aspect-ratio(16/9)

	@media (max-width mobile)
		aspect-ratio(1)

.advance
	v-center()
	right 0px
	width rem(72px)
	height @width
	border-radius 50%
	border 1.6px solid primary
	background white
	z-index 4
	cursor pointer
	transition background .3s ease-in-out,
						 transform 1s ease-in-out
	@media (max-width mobile)
		top 41%
		right 5%
		z-index 6

	&:hover
		background primary
		&:before, &:after
			background white

	&.reset
		transform translateY(200px)
		@media (max-width mobile)
			transform translateY(-50%)

	&:before
		center()
		content ''
		width 2px
		height 20px
		background primary
		transform rotate(-45deg)
		top 27%
		right 47%
		transition background .3s ease-in-out

		@media (max-width mobile)
			top 23%

	&:after
		center()
		content ''
		width 2px
		height 20px
		top 47%
		right 47%
		background primary
		transform rotate(45deg)
		transition background .3s ease-in-out

	.next-text
		position absolute
		display block
		width 100%
		top 100%
		margin-top 10px
		text-align center
		text-transform uppercase
		font-size 12px

@import './phones.styl'
@import './load-in.styl'
@import './buildings.styl'
@import './animations.styl'

@keyframes toggleOut
	0%
		transform scale(1) translateY(0)
	90%
		opacity 1
	100%
		transform scale(0.9) translateY(0)
		opacity 0

@keyframes toggleLock
	0%
		transform scale(0.9) translateY(0)
		opacity 0
	10%
		opacity 1
	50%
		transform scale(1.2) translateY(0)
		opacity 1
	60%
		transform scale(1) translateY(0)
		opacity 1
	100%
		transform scale(1) translateY(0)
		opacity 1

</style>
