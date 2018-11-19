<!--
The whitepaper block
-->

<template lang='pug'>

.block.two-column-tout.flex
	.content-left: column(:fields='leftFields')
	.content-right: column(:fields='rightFields')
		//- Place holder for mobile button bottom
	a.cta.mobile-cta Learn More
</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
pickBy = require 'lodash/pickBy'
mapKeys = require 'lodash/mapKeys'
export default

	components: column: require './column'

	props: ['block']

	computed:

		# Make object of just left side fields
		leftFields: -> @filterFields 'left'

		# Make object of just right side fields
		rightFields: -> @filterFields 'right'

	methods:

		# Get only one column's fields and reformat the keys
		filterFields: (side) ->
			matcher = new RegExp "^#{side}"
			fields = pickBy @block, (val, key) -> key.match matcher
			mapKeys fields, (val, key) ->
				key = key.replace side, ''
				key.charAt(0).toLowerCase() + key.slice(1)

</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>

.flex
	@media (max-width mobile)
		background white
.content-right
	@media (max-width mobile)
		background offwhite

.content-left
	// Changes the flex order to fit for this block, Flex 2 override global flex 1 for the content-right
	>>>.text-content
		display none
	@media (max-width mobile)
		order 1
		// Needed for Safari
		flex 1

.mobile-cta
	@media (max-width mobile)
		order 2

.content-right
	padding-top rem(90px)
	padding-bottom @padding-top
	display flex
	align-items center
	@media (max-width mobile)
		width 100%
		padding 0

.center-bottom-card
	position absolute
	height auto
	width 70%
	bottom 0
	left 50%
	transform translateX(-50%)
	background white
	padding rem(30px)
	box-shadow 0 0 20px 0px rgba(dark-text,0.1)

.light-headline
	font 'Open Sans', 24px, #979797
	letter-spacing rem(0.4px)
	font-weight 300
	line-height 1.3
	margin-bottom rem(70px)

</style>
