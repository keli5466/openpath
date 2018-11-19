<!--
Hubspot-based form page
-->

<template lang='pug'>

.block(:id='id')
	h2.h1(v-if='block.headline') {{ block.headline }}
	.section
		.left.wysiwyg(v-if='sidebar' v-html='sidebar')
		.right.hubspot-form

</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
marked = require 'marked'
export default

	props: block: Object

	mounted: -> @createForm()

	computed:

		# Render HTML in sidebar
		sidebar: -> marked @block.sidebar if @block.sidebar

		# Make the form id (it needs to begin with a non-number)
		id: -> "hb-#{@block.id}"

	methods:

		# Create the form
		createForm: ->
			return unless window?
			return setTimeout @createForm, 100 unless hbspt?
			hbspt.forms.create
				portalId: @block.portalId
				formId: @block.formId
				css: ''
				target: "\##{@id} .hubspot-form"
				redirectUrl: @block.redirectUrl || '/thanks'

</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>

.block
	block-wrapper()

.h1
	padding-bottom rem(76px)

.section
	display flex
	flex-direction row
	padding-bottom rem(50px)
	width 100%
	justify-content center
	@media (max-width mobile)
		flex-direction column-reverse

	.left
		width 35%
		border-right solid 1px #e8e8e8
		padding-right rem(80px)
		@media (max-width tablet-landscape)
			padding-right 5vw
		@media (max-width mobile)
			width 100%
			padding-top 5vw
			margin-top 10vw
			border-right none
			border-top solid 1px #e8e8e8
			padding-right 0

	// Create column only if left existed
	.right
		width 100%
		&:not(:first-child)
			padding-left rem(80px)
			width 65%
			@media (max-width tablet-landscape)
				padding-left 5vw
			@media (max-width mobile)
				width 100%
				padding-left 0

// The sidebar styling
.wysiwyg >>>
	p
		display block
		font 'Assistant', 16px, #8a8a89
		line-height 1.5
		font-weight 300
		padding-bottom rem(5px)
	strong
		font-weight 600
		color #424242
		display block
		text-transform uppercase
	a
		color #fa6715
		text-decoration none

// Style the form
.hubspot-form >>>
	row-gutter = rem(35px)
	margin-top -1 * row-gutter
	max-width 640px // Looks better when no sidebar

	// Clear max-width
	fieldset
		max-width 100% !important // Reset

	// Seperate rows
	.field, .actions
		margin-top row-gutter

	// Increase gutter
	.input
		margin-right rem(40px) !important
		@media (max-width: 400px), (max-device-width: 480px) and (min-device-width: 320px)
			margin-right 0 !important // Hubspot reset
	.field:last-child .input
		margin-right 0 !important

	// The labels
	.field > label
		display inline-block
		font 'open-sans', 13px, dark-secondary-text
		margin-bottom rem(8px)

	// Text inputs
	input:not([type='button']):not([type='submit']):not([type='checkbox']):not([type='radio']),
	textarea,
	select
		border 1px solid dark-grey
		border-radius rem(4px)
		padding rem(10px)

		// Reset
		width 100% !important

		// Focus style
		transition border-color .2s
		&:focus
			border-color primary

	// Make a little taller
	textarea
		min-height 7em

	// Error messages
	.hs-error-msgs
		font 'open-sans', 12px, primary
		margin-bottom 0

	// Container of buttons
	.actions
		text-align right

	// Buttons
	.hs-button
		cta-inverse()

	// Clear list styling on radio buttons
	.inputs-list
		list-style-type none
		margin 0
		padding 0

		// Seperate rows
		margin-top 1em
		li
			margin-top 0.5em

		// Push labels off inputs
		input
			margin-right rem(5px)

	// Restore the checkbox styling
	input[type=checkbox]
		appearance checkbox
	input[type=radio]
		appearance radio

	// Help text
	.hs-field-desc
		color dark-grey

</style>
