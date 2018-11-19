<!--
The Color tout and grid block
-->

<template lang='pug'>

.block.color-tout-and-grid
	.left
		.tout(:class='block.color')
			.headline {{ block.headline }}
			visual.image(:image='image')
	.right
		.grid
			.item(v-for='{fields:item} in block.gridItems')
				.small-headline {{ item.headline }}
				.copy {{ item.subhead }}


</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
export default
	props: ['block']

	computed:
		image: -> @$contentful.image @block.image, 250, 250

</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>

.orange
	background-color #fa6715
.grey
	background-color  #898e97
.yellow
	background-color #fac922
.blue
	background-color #b9ced2
.light-grey
	background-color #c8c8c8

.block
	display flex
	background offwhite
	@media (max-width mobile)
		flex-direction column
		.left
		.right
			width 100%
			max-width 100%

.left
	width 40%
	max-width rem(470px)

.right
	width 60%
	display flex
	align-items center
	background offwhite

.tout
	padding rem(79px) 0
	text-align center
	height 100%
	width 100%
	display flex
	flex-direction column
	justify-content center
	position relative
	@media (max-width mobile)
		padding 5vw

.headline
	font 'open-sans', 30px, white
	line-height 1.23
	font-weight normal
	text-align center
	margin 0 auto
	margin-bottom rem(28px)

.image
	margin 0 auto
	aspect-ratio(1)
	border-radius 50%
	width 50%
	margin 0 auto
	max-width rem(247px)

.grid
	display flex
	padding 0 rem(125px)
	justify-content space-between
	flex-flow row wrap
	@media (max-width tablet-landscape)
		padding 8vw

	@media (max-width mobile)
		display block
		width 100%

.item
	width 40%
	&:nth-child(odd)
		margin-right rem(45px)
	&:nth-child(1)
	&:nth-child(2)
		margin-bottom rem(60px)
		@media (max-width tablet)
			margin-bottom rem(30px)

	@media (max-width mobile)
		display block
		width 100%

		&:not(:nth-child(1)), &:not(:nth-child(2))
			margin-bottom rem(30px)

		&:last-of-type
			margin-bottom 0

.small-headline
	font 'regular' , 20px , primary-text
	font-weight 600
	margin-bottom rem(10px)

.copy
	font 'regular' , 17px , dark-secondary-text
	font-weight 300
	line-height 1.47

</style>
