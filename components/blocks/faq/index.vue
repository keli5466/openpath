<!--
The faq template
-->

<template lang='pug'>

.block.faqs
	.headline {{ block.headline }}

	el-collapse(v-model="activeFaq" accordion)
		el-collapse-item.faq(v-for='(item, index) in block.faqs'
			:key='index'
			:name='index + 1')
			template(slot='title')
				.faq-wrapper
					.title {{ item.title }}
					.arrow
			.answer(v-html='item.body')

</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
axios = require 'axios'
Vue.use require('element-ui/lib/collapse').default
Vue.use require('element-ui/lib/collapse-item').default

export default

	props: ['block']

	data: -> activeFaq: '1'

	asyncData: ({ app }, block) ->
		query = axios.get 'https://openpathsupport.zendesk.com/api/v2/help_center/en-us/sections/360001176091/articles.json'
			.then (response) ->
				Vue.set block.fields, 'faqs', response.data.articles

</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>

>>> .el-collapse-item__header
	outline none
	cursor pointer
	padding rem(16px) 0
	font 'Assistant' , 20px,  #898e97
	font-weight normal
	line-height 1.5

.title
	width 80%

.faq-wrapper
	position relative
	height 100%
	width 100%
.arrow
	position absolute
	v-center()
	right 12.5%
	height 7.5px

	&:before
		content ''
		width 1px
		height 10px
		position absolute
		background primary
		transform rotate(-45deg) translateY(-5px)
		transition transform .3s ease-in-out

	&:after
		content ''
		width 1px
		height 10px
		position absolute
		background primary
		transform rotate(45deg) translateY(5px)
		transition transform .3s ease-in-out

>>> .faq
	a
		color primary

	// PLACEHOLDER FIX TO HIDE ARROW
	i
		display none
	padding 0 12.5%
	margin 0 auto
	position relative
	flex-direction row
	justify-content space-between
	align-items center
	border-top solid 1px #eeeeee
	&:last-child
		border-bottom solid 1px #eeeeee

	@media (max-width tablet)
		padding 3vw 10vw

	&.is-active
		background #fafafa

		.el-collapse-item__header
			padding-bottom @padding-top
			font 'Assistant' , 20px, #424242
			font-weight 600

		.arrow
			&:before
				height 20px
				transform rotate(-45deg) translateY(0)
			&:after
				height 20px
				transform rotate(45deg) translateY(0)

.answer
	margin-top rem(14px)
	width 90%
	font 'Assistant' , 17px, #4c4f55
	font-weight 300
	line-height 1.47
	padding-bottom rem(40px)
	>>>li
		margin-top rem(14px)
		padding-left rem(14px)

.headline
	font 'open-sans', 42px, #424242
	margin 0 auto rem(44px)
	text-align center

</style>
