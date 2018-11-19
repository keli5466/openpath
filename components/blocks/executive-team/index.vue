<!--
The executive team block
-->

<template lang='pug'>

.block.executive-team
	visual.headline-icon(v-if='block.headlineIcon'
		:image='block.headlineIcon.fields.file.url')
	.headline {{ block.headline }}

	.team-member.flex(v-for='{fields:member} in block.teamMember')
		.left(:class='member.color')
			visual.member-image(v-if='member.image'
				:image='member.image.fields.file.url')

		.right
			.name {{ member.name }}
			.position {{ member.position }}
			.bio(v-html='$options.filters.markdown(member.bio)')
			.socials
				a.social(v-for='{fields:social} in member.socialLinks'
					v-if='social.url'
					:href='social.url')
					.icon(:class='social.type')

</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
marked = require 'marked'

export default
	props: ['block']

	filters:
		markdown: (val) -> marked val

</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>

.headline-icon
	display block

.headline
	display block
	margin 0 auto
	text-align center
	margin-bottom 47px

.left
	aspect-ratio(1)
	width 40%
	position relative

	@media (max-width mobile)
		width 100%

	&.orange
		background primary

	&.yellow
		background yellow

	&.dark-grey
		background dark-grey

	&.blue
		background blue

	&.grey
		background light-grey

.right
	width 60%
	display flex
	justify-content center
	flex-direction column
	padding rem(90px)

	@media (max-width mobile)
		width 100%
		padding-left rem(40px)
		padding-right @padding-left

.team-member
	margin-bottom 47px

	@media (max-width mobile)
		flex-direction column

.name
	font 'Open Sans', 28px, #161213
	letters-spacing 0.5px

.position
	font 'Assistant', 20px, #424242
	font-weight 600
	margin-bottom 27px
	margin-top 5px

.bio
	font 'Assistant', 17px, #4c4f55
	line-height 1.67

.member-image
	border-radius 50%
	overflow hidden
	aspect-ratio(1)
	center()
	width 60%

</style>
