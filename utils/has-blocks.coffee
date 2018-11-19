blocks =
	'remoteAccessBlock': require '~/components/blocks/remote-access'
	'ambientVideoBlock': require '~/components/blocks/ambient-video'
	'integrationsBlock': require '~/components/blocks/integrations'
	'scaleBlock': require '~/components/blocks/scale'
	'styleBlock': require '~/components/blocks/style'
	'quotesBlock': require '~/components/blocks/quotes'
	'securityBlock': require '~/components/blocks/security'
	'whyOpenpathBlock': require '~/components/blocks/why-openpath'
	'newsBlock': require '~/components/blocks/news'
	'brandsBlock': require '~/components/blocks/brands'
	'twoColumnToutBlock': require '~/components/blocks/two-column-tout'
	'latestFeaturesBlock': require '~/components/blocks/latest-features'
	'iconGridBlock': require '~/components/blocks/icon-grid'
	'productsBlock': require '~/components/blocks/products'
	'featureComparisonBlock': require '~/components/blocks/feature-comparison'
	'buildingAnimationBlock': require '~/components/blocks/building-animation'
	'tallCtasBlock': require '~/components/blocks/tall-ctas'
	'gridWithSidebarBlock': require '~/components/blocks/grid-with-sidebar'
	'gridWithCopySidebarBlock': require '~/components/blocks/grid-with-copy-sidebar'
	'videoAndCopyBlock': require '~/components/blocks/video-and-copy'
	'productDesignBlock': require '~/components/blocks/product-design'
	'productTimelineBlock': require '~/components/blocks/product-timeline'
	'centeredMarqueeBlock': require '~/components/blocks/centered-marquee'
	'offeringsBlock': require '~/components/blocks/offerings'
	'wideCtaBlock': require '~/components/blocks/wide-cta'
	'faqBlock': require '~/components/blocks/faq'
	'longFormContentBlock': require '~/components/blocks/long-form-content'
	'videoMarqueeBlock': require '~/components/blocks/video-marquee'
	'colorToutAndGridBlock': require '~/components/blocks/color-tout-and-grid'
	'alternateCtaMarqueeBlock': require '~/components/blocks/alternate-cta-marquee'
	'darkIconGridBlock': require '~/components/blocks/dark-icon-grid'
	'calloutBlock': require '~/components/blocks/callout'
	'largeToutsBlock': require '~/components/blocks/large-touts'
	'wysiwygBlock': require '~/components/blocks/wysiwyg'
	'scalableArchitectureBlock': require '~/components/blocks/scalable-architecture'
	'leftCtaBlock': require '~/components/blocks/left-cta'
	'CenteredCtaBlock': require '~/components/blocks/centered-cta'
	'downloadCtasBlock': require '~/components/blocks/download-ctas'
	'stepsBlock': require '~/components/blocks/steps'
	'sliderAndCopyBlock': require '~/components/blocks/slider-and-copy'
	'executiveTeamBlock': require '~/components/blocks/executive-team'
	'investorsBlock': require '~/components/blocks/investors'
	'appMarqueeBlock': require '~/components/blocks/app-marquee'
	'blockAppCta': require '~/components/blocks/app-cta'
	'imageAndGridBlock': require '~/components/blocks/image-and-grid'
	'tabbedProductsBlock': require '~/components/blocks/tabbed-products'
	'footerBlock': require '~/components/blocks/footer'
	'hubspotFormBlock': require '~/components/blocks/hubspot-form'

export keys = Object.keys blocks

# The mixin that tower-like pages use
export mixin =

	# Block components
	components: blocks

# Run from the page's asyncData to hydrate block's with data during SSR
export loadBlockData = (context, towerBlocks) ->
	Promise.all towerBlocks.map (block) ->
		type = block?.sys.contentType?.sys.id
		if func = blocks[type]?.asyncData
		then func(context, block)
		else Promise.resolve()
