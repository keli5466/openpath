<!--
The feature sub component
-->

<template lang='pug'>

.feature
	visual.image(:image='feature.fields.image.fields.file.url' background='contain')
	.description {{ feature.fields.description }}

</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
export default
	props: ['feature']

</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>

.image
	aspect-ratio(1)
	margin 0 auto

.description
	text-align center
	font 'Assistant', 13px, secondary-text
	line-height 1.3 //EB

</style>
