-- { Vicious Widget Creator }

local wibox = require("wibox")
local beautiful = require("beautiful")
local vicious = require("vicious")

local create_widget = function(type, format, refresh_rate, ...)
	local widget = wibox.widget.textbox()

	vicious.register(widget, type, format, refresh_rate, ...)

	return widget
end

return {
	create = create_widget
}
