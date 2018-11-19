<!--
The detail marquee
-->

<template lang='pug'>

.block.marquee
	breadcrumbs(:parent='{name: "Hardware", path: "/hardware"}'
		:current='title')
	.left
		h1.title(v-if='title') {{ title }}
		.subhead(v-if='subhead' v-html='$options.filters.markdown(subhead)')
		a.cta-inverse(v-if='download'
			:href='download.fields.file.url' target="_blank") Download Data Sheet

	.right
		transition(name='fade' mode='out-in')
			.active-image(:key='activeImage')
				visual.image(v-if='images'
					:image='activeSlide')
		.legend
			.item(v-for='({fields:image}, index) in images'
				:key='index'
				:image='image.file.url'
				:class='{ active: index == activeImage }'
				@click='activeImage = index')
				visual.image(:image='image.file.url')

</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
marked = require 'marked'

export default
	props: ['title', 'subhead', 'images', 'download']
	components:
		breadcrumbs: require '~/components/shared/breadcrumbs'

	data: -> activeImage: 0

	computed:
		activeSlide: -> @images[@activeImage].fields.file.url

	filters:
		markdown: (val) -> marked val

</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>

.breadcrumbs
	position relative
	width 100%
	top 0
	left 0
	inner-wrapper()
	margin-bottom rem(20px)

.marquee
	display flex
	justify-content space-between
	align-items center
	margin-top rem(10px)
	flex-wrap wrap

	@media (max-width 1416px)
		flex-wrap wrap

	@media( max-width mobile)
		padding-top 45px

.left
	width 50%
	display flex
	flex-direction column
	justify-content center
	inner-wrapper()

	@media (max-width 1400px)
		order 2
		width 100%

.right
	width 50%
	display flex
	justify-content space-between
	@media (max-width 1416px)
		width 50%
		margin rem(50px) auto
		 order 1
	@media (max-width tablet)
		inner-wrapper()
		width 100%

.title
	font 'Open Sans', 28px, #161213
	margin-bottom rem(19px)

.subhead
	font 'Assistant', 17px, #4c4f55
	line-height 25px
	margin-top 0
	margin-bottom rem(40px)

.active-image
	width 75%

.legend
	width 20%

	.item
		cursor pointer
		margin-bottom rem(10px)
		border-bottom 3px solid transparent
		transition border-color 300ms ease-in-out

		&.active
			border-bottom 3px solid primary

.image
	aspect-ratio(1)
	width 100%

</style>
