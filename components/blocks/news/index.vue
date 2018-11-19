<!--
The news block
-->

<template lang='pug'>

.block.news
	.headline {{ block.headline }}

	.listing
		nuxt-link.item(v-for="({fields:item}, index) in block.news"
			:key='index'
			:to=`{
				name: "news-article",
				params: { article: item.slug }}`)
			.brand-logo
				visual.image(:image='item.image.fields.file.url' background='contain')
			.content
				.headline {{ item.headline }}

				.cta Read More

</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
export default
	props: ['block']

</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>

.news
	padding rem(70px) rem(100px)
	background offwhite
	@media (max-width tablet)
		padding rem(block-v-spacing) rem(block-spacing)

.headline
	margin-bottom rem(64px)
	text-align center
	@media (max-width mobile)
		margin-bottom 0


.listing
	display flex
	justify-content space-around
	@media (max-width mobile)
		flex-direction column

.content
	display flex
	flex-direction column
	flex-grow 1
	width 100%

.cta
	font-family 'Assistant'
	font-size 14px
	letter-spacing 0.5px
	border-color #b9ced2
	color dark-text
	align-self flex-end
	margin-top auto
	padding rem(10px) rem(25px)
	@media (max-width mobile)
		align-self center
	&:hover
		background #b9ced2
		color white

.item
	width 30%
	display flex
	flex-direction column
	@media (max-width mobile)
		width 100%
		margin-top rem(46px)
	.headline
		font-family 'Assistant'
		font-size 20px
		font-weight 100
		line-height 30px
		color secondary-text
		text-align left
		margin rem(28px) auto
		@media (max-width mobile)
			font-size 18px, true


.brand-logo
	background-color #b9ced2
	position relative
	aspect-ratio(14/9)

.image
	aspect-ratio(16/9)
	center()
	width 80%

</style>
