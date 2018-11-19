module.exports = [
	{
		name: 'Products'
		subnav: true
		path: '/products'
		children: [
			{
				name: 'Product Overview'
				path:'/products'
				subnav: [
					{
						name: 'Hardware'
						path: '/hardware'
					}
					{
						name: 'Cloud Software'
						path: '/cloud-software'
					}
					{
						name: 'Access Methods'
						path: '/access-methods'
					}
				]
			}
			{
				name: 'Design'
				path: '/design'
			}
		]
	}
	{
		name: 'Technology'
		subnav: true
		path: '/technology'
		children: [
			{
				name: 'Security'
				path: '/security'
			}
			{
				name: 'Integrations'
				path: '/integrations'
			}
			{
				name: 'Development Support'
				path: 'https://openpath.readme.io/'
			}
		]
	}
	{
		name: 'About'
		subnav: true
		path: '/about'
		children: [
			{
				name: 'News & Press'
				path: '/news-press'
			}
			{
				name: 'Customers'
				path: '/customers'
			}
			{
				name: 'Careers'
				path: '/careers'
			}
			{
				name: 'Partners'
				path: '/partners'
			}
		]
	}
	{
		name: 'Get Started'
		subnav: true
		path: '/get-started'
		children: [
			{
				name: 'How to Purchase'
				path: '/how-to-purchase'
			}
			{
				name: 'Pricing'
				path: '/pricing'
			}
			{
				name: 'Install Guides'
				path: '/installation-guides'
			}
		]
	}
]
