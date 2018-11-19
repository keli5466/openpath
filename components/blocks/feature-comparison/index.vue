<!--
The feature comparison block
-->

<template lang='pug'>

.block.feature-comparison
	.block-header
		.headline {{ block.headline }}
		.subhead {{ block.subhead }}

	.table
		.table-title-row
			.title
			.openpath
				.logo
					img(src='~/static/img/open-path-logo.svg')
			.legacy Legacy Access Control Systems
		.feature(v-for="{fields:feature} in block.comparisons")
			.title {{ feature.title }}
				span  - {{ feature.description }}
			.openpath
				.checkmark(v-if='feature.openpath')
					img(src='~/static/img/check.svg')
			.legacy
				.dash(v-if='!feature.legacyAccessControlSystems && !feature.legacySometimes')
					img(src='~/static/img/line.svg')
				.checkmark(v-if='feature.legacyAccessControlSystems')
					img(src='~/static/img/check.svg')
				.sometimes(v-if='feature.legacySometimes') Sometimes

</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
export default
	props: ['block']

</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>

.block
	@media (max-width mobile)
		padding 0 3% 2%

.feature
	&:nth-child(odd)
		background #f7f7f7

.table
	height auto
	table-layout fixed
	border-collapse collapse
	display table
	padding-top 2.5rem
	margin-top 30px

.table-title-row
.feature
	display table-row
	.title
	.openpath
	.legacy
		display table-cell
		padding-top rem(10px)
		padding-bottom rem(10px)
		vertical-align middle
		line-height 1.6
		border 1px solid table-border

.legacy
	width rem(269px)
	@media (max-width mobile)
			width 30%
			padding 1%

.openpath
	width rem(143px)
	@media (max-width mobile)
			width 20%
			padding 1%
			.logo
				max-width rem(60px)
	.logo
		width rem(80px)
		margin 0 auto

.title
	padding-left rem(40px)
	font 'Assistant', 16px, #161213
	font-weight 600
	letter-spacing 0.2px
	letter-spacing normal
	@media (max-width tablet)
		padding-left 3vw
	span
		font-weight 300

.block-header
	text-align left
	padding-left rem(40px)
	margin-top rem(90px)

	@media (max-width tablet)
		padding-left 3vw
		margin-bottom 5%

	.headline
		font 'Assistant', 20px, primary-text
		font-weight 600
		line-height 0.68
		margin-bottom 5px

	.subhead
		font-size 18px
		color dark-secondary-text
		letter-spacing 0.2px
		margin-top 0

.table-title-row
	.title
		border none
		line-height 2
	.openpath
		text-align center
	.legacy
		text-align center
		letter-spacing 0.1px
		font-size 16px
		color dark-secondary-text

.dash
	position relative
	margin 0 auto
	width rem(30px)
.checkmark
	position relative
	margin 0 auto
	width rem(30px)
.sometimes
	text-align center
</style>
