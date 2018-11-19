<!--
Render a list of blocks
-->

<template lang='pug'>

.blocks: component(
	v-for='block in createdBlocks'
	:is='block.sys.contentType.sys.id'
	:key='block.id'
	:block='block')

</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
import { keys, mixin } from '~/utils/has-blocks'
export default

	mixins: [ mixin  ]

	props: blocks: Array

	computed:

		# Filter the blocks to those that have been defined.  To fix errors in dev
		# environments after content modle is created but commits with the new
		# block component have not been pulled down.
		createdBlocks: -> @blocks.filter (block) ->
			keys.includes block.sys.contentType.sys.id

</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>



</style>
