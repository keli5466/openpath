<!--
The top bar notification on the site
Currently holds a lastest press post
-->

<template lang='pug'>

.notifications(v-if='$route.fullPath == "/"')
	.notification(v-for='post,slug of featuredPosts')
		.intro Latest Press
		.title {{ post }}
		nuxt-link(:to='"press/" + slug') Read More

</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
export default

	computed:
		# VueX accessors
		featuredPosts: -> @$store.getters['press/featuredPosts']

</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus'>

header.mobile + .notifications
	background white
.notifications
	display block
	z-index header-z + 1
	background primary
	padding-top 105px

	@media (max-width desktop)
		padding-top 80px

		.notification
			flex-wrap wrap
			.intro
				width 100%
				margin-bottom 5px
				font-weight 600
			.title
				width 80%
				line-height 1.3
			a
				margin-left auto
				width 20%
				align-self center

	+ main
		padding-top 0

	.notification
		display flex
		justify-content space-around
		font 'Assistant', 16px, white
		letter-spacing rem(0.4px)
		font-weight 300
		max-width 800px
		margin 0 auto
		padding rem(15px) rem(20px) rem(20px)

	.intro
		font 'Open Sans', 16px, white

	a
		font 'Assistant', 16px, white
		text-decoration underline

</style>
