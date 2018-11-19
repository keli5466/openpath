<!--
The quotes block
-->

<template lang='pug'>

.block.quotes.flex

	.content-left
		.text-content
			.headline What our customers are saying
			transition-group(name='quote-fade')
				.quote(v-for="(quote, index) in block.quotes"
					:key='index'
					:data-index='index'
					v-show='activeSlide == index')
					.copy {{ quote.fields.headline }}
					.author {{ quote.fields.author }}
					.job-title {{ quote.fields.jobTitle }}

			.slider-nav
				.nav-item(v-for="({fields:quote}, index) in block.quotes"
					@click='navClick'
					:data-index='index'
					:class='{active: activeSlide == index}')
					.circle-nav
						visual.small-image(v-if="quote.image"
							:image='$contentful.image(quote.image)')
					.label {{ quote.company }}

	.content-right
		transition-group(name='fade')
			.quote-right(v-for="(quote, index) in block.quotes"
				:data-index='index'
				:key='index'
				v-if='activeSlide == index')
				visual.image(v-if="quote.fields.image"
					:image="$contentful.image(quote.fields.image, 600, 750)")
				video-modal(:url="quote.fields.videoUrl")

	.mobile-bottom
		.slider-nav
			.nav-item(v-for="({fields:quote}, index) in block.quotes"
				@click='navClick'
				:data-index='index')
				.circle-nav
				.label {{ quote.company }}
		.cta About Open Path
</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
export default
	props: ['block']
	components: 'video-modal': require '~/components/shared/video-modal'

	data: ->
		activeSlide: 0

	methods:

		navClick: (e) ->
			@activeSlide = e.currentTarget.getAttribute 'data-index'


</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>

.subhead, .headline, .copy
	max-width 365px

.headline
	max-width 250px

.block
	overflow hidden

	.headline
		@media (max-width mobile)
			margin-bottom 20px

.content-left
	padding-top rem(80px)
	padding-bottom @padding-top

	@media (max-width mobile)
		padding 4.375rem 3.75rem

	span
		display block
		position relative
		width 100%
		padding-bottom rem(100px)

.content-right
	@media (max-width mobile)
		display block

.mobile-bottom
	display none
	margin rem(block-v-spacing) rem(block-spacing)

	@media (max-width mobile)
		display block

	.cta
		display block
		margin-top 60px

.slider-nav
	display flex
	flex-flow row wrap
	@media (max-width mobile)
		margin-top 0

	margin-top rem(100px)
	display flex
	justify-content space-between
	width 100%

.small-image
	center()
	width 95%
	height @width
	border-radius 50%
	backface-visibility hidden

.nav-item
	text-align center
	margin 1%
	cursor pointer

	&.active

		.circle-nav
			background primary
			opacity 1

			&:after, &:before
				opacity 0

		.label
			color primary

.circle-nav
	border-radius 50%
	position relative
	display flex
	width rem(74px)
	height rem(74px)
	background transparent
	margin 0 auto
	transition background 300ms ease-in-out,
						 opacity 300ms ease-in-out

	@media (max-width mobile)
		width rem(56px)
		height rem(56px)

	// Play button
	&:after
		content ''
		border-bottom rem(10px) solid transparent
		border-top rem(10px) solid transparent
		border-left rem(20px) solid white
		center()
		right 47%
		z-index 3
		transition opacity 300ms ease-in-out

	&:before
		content ''
		background rgba(primary, 0.4)
		center()
		width 95%
		height @width
		border-radius 50%
		z-index 2
		transition opacity 300ms ease-in-out

.label
	margin-top rem(20px)
	font-weight 900
	letter-spacing -0.1px
	text-transform uppercase
	font 'Assistant', 14px, dark-text
	transition color 300ms ease-in-out

	@media (max-width mobile)
		font-size 10px

.headline
	margin-bottom rem(72px)

.slider
	position relative
	height 100%
	overflow hidden

.text-content

	@media (max-width mobile)
		padding 0

	.slider-nav
		@media (max-width mobile)
			display none

.quote
	float left

.quote-right
	position absolute
	top 0
	left 0
	width 100%
	height 100%

	@media (max-width mobile)
		position relative
		aspect-ratio(1)

		.image
			position absolute
			top 0
			left 0

.image
	width 100%
	height 100%

.copy
	font 'Open Sans', 22px, #626262
	line-height 1.45
	letter-spacing 0.5px
	margin-bottom 15px
	font-weight 300
	&:before, &:after
		content: '"'
	@media (max-width mobile)
		margin-bottom 18px

.author, .job-title
	display inline-block
	font 'Assistant', 17px, secondary-text
	letter-spacing 0.5px

.author
	&:after
		content ','

.job-title
	text-transform uppercase
	padding-left 7px
	@media (max-width mobile)
		padding-left 0

</style>
