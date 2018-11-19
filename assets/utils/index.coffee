# Export simple utils
module.exports =

	# Same as setTimeout / delay but with the interval first
	wait: (ms, func) -> setTimeout func, ms
