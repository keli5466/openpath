<!--
The wide cta template
-->

<template lang='pug'>

.block.wide-cta
	.content
		.copy
			.headline {{ block.headline }}
			.subhead {{ block.subhead }}
		.cta
			nuxt-link(:to='block.ctaUrl') {{ block.ctaText }}


</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
export default
	props: ['block']

</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>
.wide-cta
	margin-right auto
	margin-left auto
	background white
	padding rem(50px) 0 rem(10px)

.content
	display flex
	flex-direction row
	border solid 1px #eeeeee
	align-items center
	width 75%
	margin 0 auto
	padding rem(34px) rem(48px)
	@media (max-width mobile)
		flex-direction column
		width 90%
		align-items flex-start
		.cta
			margin-top rem(50px)
.headline
	font regular , 20px, #424242
	font-weight 600
.subhead
	font regular, 17px, #4c4f55
	line-height 1.47
	font-weight 300
	margin-top rem(11px)
.copy
	margin-right rem(36px)
	width 70%
	@media (max-width mobile)
		width 100%
		margin-right 0
.cta
	margin-top 0
	background primary
	color white
	width rem(193px)
	flex-grow 1
	padding-left 0
	padding-right 0
</style>
