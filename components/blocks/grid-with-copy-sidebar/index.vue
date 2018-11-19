<!--
The Grid with sidebar copy block
-->

<template lang='pug'>

.block.grid-with-copy-sidebar
	.headline {{ block.headline }}
	.flex
		.left
			.copy {{ block.subhead }}
			.contact(v-html='contact')

		.right
			.flex-grid
				.item(v-for='({fields:item}, index) in block.gridItems')
					.small-headline {{ item.headline }}
					.small-subhead {{ item.subhead }}
					smart-link.cta(v-if='item.ctaUrl'
						:to='item.ctaUrl') {{ item.ctaText }}

</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
marked = require 'marked'
export default
	props: ['block']

	computed:
		contact: -> marked @block.contact

</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>
// Layout
.grid-with-copy-sidebar
	block-wrapper()
	margin-top 0
	padding-top rem(40px)
	border-top solid 1px #eeeeee

.flex
	flex-flow row no-wrap
	background none
	@media (max-width tablet)
		flex-direction column


.flex-grid
	display flex
	flex-flow row wrap
	justify-content space-between

	// Eyeballed
	@media (max-width tablet)
		margin-top rem(50px)

.headline
	padding-bottom rem(52px)
	padding-top rem(44px)

//Left Right Layout
.left
	flex-grow 1
	width 25%

	@media (max-width tablet)
		width 100%

.right
	flex-grow 2
	margin-left 7%
	width 70%

	@media (max-width tablet)
		width 100%
		margin 0 auto


	// Text Styles

.copy
	font 'Assistant', 18px, secondary-text
	font-weight 300
	line-height 1.28
	margin-bottom rem(51px)

.contact
	font 'Assistant', 20px, #424242
	line-height 1.5
	font-weight 300
	// Deep selector needed to target the mailto link
	>>>a
			color primary
			word-wrap break-word

// Flex Grid RULES
.item
	width 45%
	display flex
	flex-direction column
	margin-bottom rem(80px)

.small-headline
	font 'Assistant', 20px, #424242
	font-weight 600
	margin-bottom rem(26px)

.small-subhead
	font 'Assistant', 17px, #4c4f55
	line-height 1.47
	flex-grow 1

.cta
	margin-top rem(60px)
	align-self flex-start

	// Removes global cta style to fill to the padding width of the item
	@media (max-width tablet)
		align-self center
		width 100%
		padding-left 0
		padding-right 0
</style>
