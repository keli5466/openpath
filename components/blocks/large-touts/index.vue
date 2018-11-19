<!--
The large touts block
-->

<template lang='pug'>

.block.large-touts
	.large-tout(v-for='{fields:tout} in block.largeTouts')
		visual.image(:image='tout.image.fields.file.url')
		.content
			.small-headline {{ tout.headline }}
			.small-subhead {{ tout.subhead }}

</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
export default
	props: ['block']

</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>

.large-touts
	display flex
	@media (max-width mobile)
		flex-direction column
		.large-tout
			width 100%


.large-tout
	width 50%
	height 100%
	display flex
	flex-direction column
	&:first-child
		margin-right rem(47px)

.image
	aspect-ratio (610/465)
	width 100%
	height 100%
	// @media (max-width mobile)
	// 	aspect-ratio (610/465)


.content
	width 80%
	height 100%
	max-width rem(456px)
	margin 0 auto
.small-headline
	font regular, 20px , primary-text
	font-weight 600
	margin-top rem(36px)

.small-subhead
	margin-top rem(20px)
	font regular , 17px , dark-secondary-text
	line-height 1.47
	font-weight 300
	margin-bottom rem(50px) //EB

</style>
