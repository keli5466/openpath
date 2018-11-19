<!--
Breadcrumbs
-->

<template lang='pug'>

.breadcrumbs
	nuxt-link(to='/') Home
	nuxt-link(:to='parent.path') {{ parent.name }}
	.current {{ current }}

</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
export default
	props: ['parent', 'current']

</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus'>

.breadcrumbs
	position absolute
	top rem(20px)
	left rem(5px)
	color lightgrey
	z-index 5

	a
		display inline-block
		vertical-align middle
		margin-right 10px
		text-decoration underline
		transition color 300ms ease-in-out

		&:hover
			color primary

		&:after
			content '/'
			display inline-block
			margin-left 5px

	.current
		display inline-block
		vertical-align middle
		color primary

</style>
