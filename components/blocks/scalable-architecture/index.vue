<!--
The scalable architecture block
-->

<template lang='pug'>

.block.scalable-architecture
	.headline Scalable Architecture
	.tabs: .top-tab-wrapper
		.tab.cta(@click='activeTab = 0'
			:class='{active: activeTab == 0}') Hardware &amp; Software
		.tab.cta(@click='activeTab = 1'
			:class='{active: activeTab == 1}') Communication Paths

	height-tween(name='fade' mode='out-in')
		.tab-wrapper(:key='activeTab')
			.tab-content(v-if='activeTab == 0')
				.steps
					.step(v-for='({fields:step}, index) in block.hardwareSteps')
						.number(:class='step.color') {{ index + 1 }}
						.step-headline {{ step.headline }}
						.content(v-html='$options.filters.markdown(step.copy)')
				.image
					visual.graphic(v-if='block.hardwareImage'
						:image='$contentful.image(block.hardwareImage, 600, 600, {format: "png"})')

			.tab-content(v-if='activeTab == 1')
				.steps
					.step(v-for='({fields:step}, index) in block.communicationSteps')
						.number(:class='step.color') {{ index + 1 }}
						.step-headline {{ step.headline }}
						.content(v-html='$options.filters.markdown(step.copy)')
				.image
					visual.graphic(v-if='block.communicationImage'
						:image='$contentful.image(block.communicationImage, 600, 600, {format: "png"})')

</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
marked = require 'marked'

export default
	props: ['block']

	components: 'height-tween': require 'vue-height-tween-transition'

	data: -> activeTab: 0

	computed:
		activeList: -> @block.tabs[@activeTab].fields.tabItems

	filters:
		markdown: (val) -> marked val

</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>

.height-tweening
	transition height .2s ease-out-quad

.block
	background #fafafa
	padding rem(70px) rem(89px)
	@media (max-width tablet)
		padding rem(block-v-spacing) rem(block-spacing)

.steps
	margin auto auto 0 rem(50px)
	@media (max-width tablet)
		margin-top rem(70px)


.headline
	display block
	text-align center
	font-size 28px
	font-family 'Open Sans'
	margin-bottom rem(52px)

.tabs
	display block
	margin 0 auto rem(70px)
	text-align center

.top-tab-wrapper
	display inline-block
	border-radius 3px
	border 1px solid primary

.tab
	display inline-block
	vertical-align middle
	margin-top 0
	padding 10px 30px
	font-size 16px
	text-transform none
	color primary
	background white
	border none
	cursor pointer
	@media (max-width mobile)
		width 100%

	&.active
		color white
		background primary

.tab-content
	display flex
	justify-content space-between
	align-items center

	@media (max-width tablet)
		flex-direction column

.steps
	width 40%
	@media (max-width tablet)
		width 90%
		order 2

.step
	position relative
	margin-bottom rem(30px)
.cta
	border-radius 0
.number
	position absolute
	top 0
	left -40px
	width 26px
	height @width
	border-radius 50%
	display flex
	justify-content center
	flex-direction column
	text-align center
	color white
	font-size 17px
	font-weight 600
	padding-bottom 2px

	&.orange
		background primary

	&.yellow
		background yellow

	&.grey
		background grey

	&.blue
		background blue

.step-headline
	font-size 16px
	font-weight 600
	color #161213
	line-height 25px
	letter-spacing 0.2px

>>> .content ul
	padding-left 20px
	margin 10px 0 0 0
	font-size 15px
	line-height 22px
	color #4c4f55

	li ul
		padding-left 0
		margin 0

		li
			list-style-type none
			&:before
				content '+'
				display inline-block
				margin-right 2px

.image
	width 60%
	position relative
	aspect-ratio(1)
	@media (max-width mobile)
		width 90%



.graphic
	center()
	width 100%
	height 100%
	max-width 90%
	max-height 90%
	@media (max-width mobile)
		max-height 100%
		max-width  100%


</style>
