<!--
The dark icon grid block
-->

<template lang='pug'>

.block.dark-icon-grid
	.headline {{ block.headline }}
	.grid
		.item(v-for="{fields:item} in block.gridItems")
			visual.icon(:image='item.icon.fields.file.url'
				background='contain')
			.small-headline {{ item.headline }}
			.small-subhead {{ item.subhead }}

</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
export default
	props: ['block']
</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>

.dark-icon-grid
	background #1d1c22
	padding rem(55px) 0
	inner-wrapper()

.headline
	font regular , 22px , white
	line-height 1.36
	letter-spacing normal
	font-weight normal
	margin-bottom rem(15px)

.grid
	display flex
	flex-wrap wrap
	justify-content space-between

.item
	width 23%
	margin-top rem(25px)
	@media (max-width mobile)
		width 48%

.icon
	aspect-ratio (1)
	width 100%
	max-height rem(58px)
	max-width rem(58px)
	margin-bottom rem(21px)

.small-headline
	font open-sans , 19px , white
	line-height normal
	letter-spacing normal
	font-weight normal
	margin-bottom rem(14px)

.small-subhead
	font regular , 17px, #c8c8c8
	line-height 1.47
	font-weight 300
	max-width rem(245px)


</style>
