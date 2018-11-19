<!--
The centered marquee template
-->

<template lang='pug'>

.block.centered-marquee
	.content
		h1 {{ block.headline }}
		.subhead(v-if='block.subhead') {{ block.subhead }}

</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
export default
	props: ['block']

</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>

.block
	background offwhite
	margin 0 auto
	text-align center
	padding rem(90px)
	@media (max-width tablet)
		inner-gutter()



.subhead
	max-width rem(430px)
	margin rem(35px) auto 0

.content
	width 70%
	margin 0 auto
	@media (max-width mobile)
		width 100%

</style>
