<!--
Column of the two column tout
-->

<template lang='pug'>
.content
	.text-content(v-if='fields.headline')
		.headline(v-if='fields.headline') {{ fields.headline }}
		.subhead(v-if='fields.subhead') {{ fields.subhead }}
		a.cta(
			v-if='fields.ctaUrl'
			:href="fields.ctaUrl") {{ fields.ctaText }}
	.image(v-if='fields.image')
		visual.card(
			:image='fields.image.fields.file.url'
			background='')
</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
export default
	props:
		fields: Object

</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>

.subhead, .headline
	max-width 365px

.cta
	margin-top rem(61px)
	@media (max-width mobile)
		display none
.headline
	font-size 24px
.subhead
	font-size 18px



.content
	width 100%

.card
	max-width rem(500px)
	margin 0 auto
</style>
