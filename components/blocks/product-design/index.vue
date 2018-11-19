<!--
The product design block
-->

<template lang='pug'>

.block.product-design.flex
	.content-left
		.text-content
			.headline {{ block.headline }}
			.subhead {{ block.subhead }}
			.copy {{ block.copy }}
	.content-right(ref='parentWidth')
		.slider
			.modules
				visual.module(v-for='(module, index) in modules'
					background=''
					:image='module.image'
					:load='true'
					:key='index')
				.arrow(@click='cycleRender')

			.renders(ref='renders')
				visual.render(v-for='(render, index) in renders'
					:image='render.image'
					:load='true'
					:key='index')

			.pagination
				.item.white.active(@click='activateModule' data-index='0')
					.label White
					.circle
				.item.black(@click='activateModule' data-index='1')
					.label Black
					.circle

</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
{ wait } = require '~/assets/utils'

export default
	props: ['block']

	data: ->
		currentIndex: 0
		renderIndex: 0
		modules:
			1: image: '/img/style/white-reader.png'
			2: image: '/img/style/black-reader.png'
		renders:
			1: image: '/img/style/mat-1.jpg'
			2: image: '/img/style/mat-2.jpg'
			3: image: '/img/style/mat-3.jpg'
			4: image: '/img/style/mat-4.jpg'

	mounted: ->
		wait 1000, =>
			firstModule = @$el.querySelectorAll '.module'
			firstModule[0].classList.add 'active'

		window.addEventListener 'resize', @onResize
		@onResize()

	methods:
		onResize: ->
			if @.$refs.renders
				@.$refs.renders.style.width = @.$refs.parentWidth.offsetWidth * 4 + 'px'
				@setOffset()

		# Go through the backgrounds
		cycleRender: ->
			if @renderIndex >= 3
				@renderIndex = 0
			else
				@renderIndex++

			@setOffset()

		# Set the offset of the current render index
		setOffset: ->
			targetOffset = @.$refs.parentWidth.offsetWidth * @renderIndex
			@.$refs.renders.style.transform = "translateX(-" + targetOffset + "px)"

		# Set the active module to show
		activateModule: (e) ->
			items = @$el.querySelectorAll '.item'
			items.forEach (item) ->
				item.classList.remove 'active'
			e.currentTarget.classList.add 'active'

			@currentIndex = e.currentTarget.getAttribute 'data-index'
			@showModule(@currentIndex)

		# Show the correct module
		showModule: (index) ->
			modules = @$el.querySelectorAll '.module'
			modules.forEach (module) ->
				module.classList.remove 'active'
			modules[index].classList.add 'active'

</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>

.text-content
	width 100%
.content-left
	flex-direction column

.flex
	align-items center
	min-height 500px
	height 55vh
	@media (max-width mobile)
		height 100%
// For slider to show
.content-right
	@media (max-width mobile)
		height 60vh


.headline
	font-size 28px
	color #161213
	padding-bottom rem(32px)
	position relative
	&:after
		border-bottom solid 1px primary
		content ''
		position absolute
		top 100%
		left 0%
		width rem(34px)

.subhead
	margin-top 0
	padding-top rem(45px)
	font-size 20px
	color #424242
	letter-spacing normal
	font-weight 600

.copy
	padding-top rem(28px)
	margin-top 0
	font-size 17px
	line-height 1.47
	color #4c4f55
	font-weight 300

.content-right
	overflow hidden
	align-self stretch

.post-video-slider
	position absolute
	top 0
	left 0
	width 100%
	height 100%

.modules
	position absolute
	top 0
	left 0
	width 100%
	height calc(100% - 54px)
	z-index 2

.module
	center()
	max-width 40%
	opacity 0
	transition opacity 300ms ease-in-out

	&.active
		opacity 1

.renders
	position absolute
	top 0
	left 0
	width 100%
	height 100%
	display flex
	transition transform 300ms ease-in-out

.render
	width 25%
	height 100%
	background white

.arrow
	v-center()
	top calc(50% - 50px)
	right 20px
	background white
	width 50px
	height @width
	border-radius 50%
	cursor pointer
	z-index 4

	&:hover
		background primary

		&:before
			color white

	&:before
		font-family 'icomoon'
		content icon-arrow
		center()
		color primary

.pagination
	position absolute
	bottom 0
	left 0
	height rem(54px)
	right 0
	display flex
	text-align center
	text-transform uppercase
	background white
	font 'Assistant', 12px, primary-text
	cursor pointer
	z-index 4

.item
	padding rem(20px)
	width 50%
	border-bottom 5px solid offwhite
	transition border-bottom-color 300ms ease-in-out

	&.active
		border-bottom-color primary

.white
	border-right 1px solid offwhite

	.circle
		background white
		border-color primary

.black
	.circle
		background black
		border-color black

.label
	display inline-block
	vertical-align middle
	margin-right rem(7px)

.circle
	border 2px solid transparent
	width 10px
	height @width
	border-radius 50%
	display inline-block
	vertical-align middle

</style>
