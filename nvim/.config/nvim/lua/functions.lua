local vim = vim

-- String Functions {{{
function string:split(delimiter)
  return vim.split(self, delimiter)
end

function string:empty()
	return self == nil or self == ''
end

function string:to_regex()
	return self:gsub('[%{%}%(%)%%%.%+%-%*%[%]%?%^%$]', '%%%1')
end

function string:align(width, align)
	if #self >= width then
		return self
	end
	local spacer = string.rep(' ', width - #self)
	if align == 'right' then
		return spacer .. self
	elseif align == 'center' then
		return CenterString(self, width)
	end
	return self .. spacer
end
--}}}


-- Function to get colors from xresources {{{
function get_xresources_color (c)
   local command = io.popen('xrdb -query | grep ' .. c .. ' -m 1 | cut -f 2')
   local color = command:read("*l")
   return color
end
-- }}}