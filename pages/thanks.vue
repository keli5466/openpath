<!--
The get a quote thanks page
-->

<template lang='pug'>

.page.thanks
	.content
		.headline Thanks for contacting us! We'll reach out to you shortly.
		nuxt-link.cta(to='/') Back to Homepage

</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
export default

	head: -> title: 'Thanks!'

</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>

.page
	position relative
	height 60vh

.content
	center()
	text-align center

.cta
	background primary
	color white
	font-weight 600
	margin-top rem(38px)

	&:hover
		background white
		color primary

</style>
