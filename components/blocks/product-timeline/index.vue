<!--
The product timeline section
-->

<template lang='pug'>

.block.product-timeline
	.title-section.flex
		.left
			img.ring(src="~/static/img/ring.png")
			.headline {{ block.headline }}
		.right
			.content
				.subhead {{ block.subhead }}
				.copy {{ block.copy }}

	.timeline-section.flex(v-for='({fields:section}, index) in block.timelineSections'
		:key='index')
		.left
			visual.image(v-if='section.image'
				:image='$contentful.image(section.image, 650, 1000)')
			video-modal(v-if='section.video'
				:url='section.video')

		.right
			.content
				.headline {{ section.headline }}
				.subhead {{ section.subhead }}
				.copy {{ section.copy }}

</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
export default
	props: ['block']
	components: 'video-modal': require '~/components/shared/video-modal'
</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>

.product-timeline
	padding-top rem(100px)

// Timeline line
.timeline-section
.title-section
	position relative
	align-items center
	&:after
		border-right solid 1px #e8e8e8
		content ''
		position absolute
		left 50%
		top 0
		bottom 0
		@media (max-width mobile)
			display none

// Circle
.content
	position relative
	width 75%
	padding-left rem(50px)
	padding-top rem(80px)
	padding-bottom @padding-top

	&:before
		content ''
		z-index 2
		position absolute
		top 90px
		left -32px
		height 24px
		width @height
		border-radius 50%
		background-color #ffffff
		border solid 1px #b9ced2

	@media (max-width mobile)
		text-align center
		width 90%
		background white
		margin rem(50px) auto
		padding rem(50px) 0
		&:before
			left 50%
			top 0
			transform translateX(-50%)

.timeline-section:last-child
	&:after
		z-index 1
		position absolute
		left 50%
		top 0
		bottom 78%

.left
.right
	width 50%

	@media (max-width mobile)
		width 100%

.left
	margin-right rem(50px)
	text-align right
	position relative

	@media (max-width mobile)
		margin-right 0
		height 40vh
		text-align center

.right
	text-align left

.flex
	background none
	align-items stretch

// For flip stles on time line
.timeline-section
	padding rem(25px) 0

	@media (min-width mobile)

		&:nth-child(odd)
			flex-direction row-reverse

			.left
				margin-right 0
				margin-left rem(50px)

			.right
				text-align right

				.content
					padding-left 0
					margin-left auto
					padding-right rem(50px)
					&:before
						left auto
						right -33px

.timeline-section

	.content
		padding-bottom rem(145px)
		@media (max-width mobile)
			padding-bottom rem(50px)

		.copy
			font-size 17px
			font-weight 300
			line-height 1.47
			color #4c4f55
			margin-top rem(35px)

.headline
	font-size 28px
	line-height 1.29
	color #161212

.subhead
	margin-top 0
	font-size 20px
	color #424242
	letter-spacing normal
	font-weight 600

.image
	position absolute
	top 0
	left 0
	width 100%
	height 100%

// TITLE SECTION
.ring
	width rem(80px)
	margin-right rem(30px)

	@media (max-width mobile)
		margin auto

// Keep copy style seperate
.title-section
	padding-bottom rem(100px)
	align-items start
	@media (max-width mobile)
		padding-bottom 50px

	.left
		display flex
		flex-direction row
		align-items center
		justify-content flex-end

		@media (max-width mobile)
			text-align center
			background white
			flex-direction column

	// Deletes first circle on timeline
	.content
		padding-top 0
		padding-bottom 0
		&:before
			display none

	.copy
		padding-top rem(19px)
		font-size 20px
		font-weight 300
		line-height 1.5
		letter-spacing normal
		color secondary-text

</style>
