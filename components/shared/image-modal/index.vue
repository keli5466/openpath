<!--
The image modal
-->

<template lang='pug'>

.image-modal-container(:class="{active: imageModalActive}")
	.listing-image(@click='imageModalActive = true')
		visual.image(:image='listingImage')
	transition(name='fade')
		.image-modal(v-if='imageModalActive')
			.overlay(@click='imageModalActive = false')
			visual.full-image(:image='image'
				background='')

</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
export default
	props: ['listingImage','image']
	data: -> imageModalActive: false

</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>

.image-modal-container
	position absolute
	top 0
	left 0
	width 100%
	height 100%
	z-index header-z + 1

	&.active
		z-index header-z + 3

.image
	position absolute
	top 0
	left 0
	width 100%
	height 100%
	cursor pointer

.image-modal
	position fixed
	top 0
	left 0
	width 100%
	height 100%
	z-index header-z + 2

>>> .overlay
	background rgba(0,0,0,0.4)
	position absolute
	top 0
	left 0
	width 100%
	height 100%

>>> .full-image
	center()
	width 100%
	max-width 80%
	height auto

</style>
