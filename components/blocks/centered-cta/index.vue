<!--
The centered cta
-->

<template lang='pug'>

.block.centered-cta
	.content
		.headline {{ block.headline }}
		.subhead(v-html='$options.filters.markdown(block.subhead)')
		nuxt-link.cta-inverse(:to='block.ctaUrl') {{ block.ctaText }}

</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
marked = require 'marked'

export default
	props: ['block']

	filters:
		markdown: (val) -> marked val

</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>
.centered-cta
	border solid 1px #e8e8e8
	text-align center
	padding rem(80px) rem(269px) rem(91px)
	// Sets the padding low mostly for mobile since the text has line breaks
	@media (max-width tablet-landscape)
		padding-left 2vw
		padding-right 2vw


.content
	margin 0 auto
	text-align center

.headline
	font open-sans, 42px, #424242
	letter-spacing 0.2px

.subhead
	margin-top rem(35px)
	line-height 1.5
	font-weight normal

.cta-inverse
	margin-top rem(50px)
</style>
