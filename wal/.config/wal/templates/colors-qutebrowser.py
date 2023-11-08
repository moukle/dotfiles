import subprocess
import sys

## Layout
# tabs left and only favicons
c.tabs.position = "left"
c.tabs.show = "multiple"
# c.tabs.title.format = ""
c.tabs.width = 70
c.tabs.favicons.scale = 1.5
c.tabs.indicator.width = 0

# Miscs
c.tabs.background = True

## Fonts
c.fonts.default_family = "Cascadia Code"
c.fonts.default_size = "15pt"


## Colors
def clamp(val, minimum=0, maximum=255):
    if val < minimum:
        return minimum
    if val > maximum:
        return maximum
    return val


def adjust(hexstr, scalefactor):
    hexstr = hexstr.strip("#")
    if scalefactor < 0 or len(hexstr) != 6:
        return hexstr

    r, g, b = int(hexstr[:2], 16), int(hexstr[2:4], 16), int(hexstr[4:], 16)
    r = int(clamp(r * scalefactor))
    g = int(clamp(g * scalefactor))
    b = int(clamp(b * scalefactor))

    return "#%02x%02x%02x" % (r, g, b)


melon_bg_light = "#445967"
melon_bg_dark = "#3C4F5B"
melon_blue_light = "#72A7D3"
melon_blue_dark = "#5394C9"
melon_cyan = "#37BF8D"
melon_white = "#ffffff"
melon_gray = "#CCCCCC"
melon_red = "#d37277"

c.colors.completion.fg = "{foreground}"
c.colors.completion.category.bg = "{background}"
c.colors.completion.category.border.bottom = "{color8}"
c.colors.completion.category.border.top = "{color0}"
c.colors.completion.category.fg = "{color8}"
c.colors.completion.even.bg = "{background}"
c.colors.completion.item.selected.bg = "{color0}"
c.colors.completion.item.selected.border.bottom = "{color0}"
c.colors.completion.item.selected.border.top = "{color0}"
c.colors.completion.item.selected.fg = "{color15}"
c.colors.completion.match.fg = "{color15}"
c.colors.completion.odd.bg = "{background}"
c.colors.completion.scrollbar.bg = "{background}"
c.colors.completion.scrollbar.fg = "{color2}"

c.colors.downloads.bar.bg = "{color0}"
c.colors.downloads.error.bg = "{color1}"
c.colors.downloads.error.fg = "{color15}"
c.colors.downloads.start.bg = "{color2}"
c.colors.downloads.start.fg = "{color0}"
c.colors.downloads.stop.bg = "{background}"
c.colors.downloads.stop.fg = "{color15}"
c.colors.downloads.system.bg = "none"
c.colors.downloads.system.fg = "none"

c.colors.hints.bg = "{background}"
c.colors.hints.fg = "{color15}"
c.colors.hints.match.fg = "{color2}"

c.colors.messages.error.bg = "{color1}"
c.colors.messages.error.border = "{color1}"
c.colors.messages.error.fg = "{color15}"
c.colors.messages.info.bg = "{color0}"
c.colors.messages.info.border = "{color0}"
c.colors.messages.info.fg = "{color15}"
c.colors.messages.warning.bg = "{color1}"
c.colors.messages.warning.border = "{color1}"
c.colors.messages.warning.fg = "{color15}"

c.colors.prompts.bg = "{background}"
c.colors.prompts.border = "1px solid gray"
c.colors.prompts.fg = "{color15}"
c.colors.prompts.selected.bg = "{color0}"

c.colors.statusbar.caret.bg = "{color0}"
c.colors.statusbar.caret.fg = "{color15}"
c.colors.statusbar.caret.selection.bg = "#a12dff"
c.colors.statusbar.caret.selection.fg = "{color15}"
c.colors.statusbar.command.bg = "{color0}"
c.colors.statusbar.command.fg = "{color15}"
c.colors.statusbar.command.private.bg = "{color15}"
c.colors.statusbar.command.private.fg = "{color15}"
c.colors.statusbar.insert.bg = "{color0}"
c.colors.statusbar.insert.fg = "{color2}"
c.colors.statusbar.normal.bg = "{background}"
c.colors.statusbar.normal.fg = "{foreground}"
c.colors.statusbar.passthrough.bg = "{color0}"
c.colors.statusbar.passthrough.fg = "{color1}"
c.colors.statusbar.private.bg = "#666666"
c.colors.statusbar.private.fg = "{foreground}"
c.colors.statusbar.progress.bg = "{color15}"
c.colors.statusbar.url.fg = "{foreground}"
c.colors.statusbar.url.hover.fg = "{color6}"
c.colors.statusbar.url.success.https.fg = adjust("{foreground}", 0.7)
c.colors.statusbar.url.warn.fg = "{color3}"

# c.colors.tabs.bar.bg = "{background}"

# c.colors.tabs.indicator.error = "{color1}"
# c.colors.tabs.indicator.start = "{color15}"
# c.colors.tabs.indicator.stop = "{color6}"

# c.colors.tabs.even.bg = "{background}"
# c.colors.tabs.even.fg = "{foreground}"
# c.colors.tabs.odd.bg = "{background}"
# c.colors.tabs.odd.fg = "{foreground}"

# c.colors.tabs.selected.even.bg = "{color0}"
# c.colors.tabs.selected.even.fg = "{foreground}"
# c.colors.tabs.selected.odd.bg = "{color0}"
# c.colors.tabs.selected.odd.fg = "{foreground}"

c.colors.tabs.bar.bg = melon_blue_dark

c.colors.tabs.indicator.error = melon_red
c.colors.tabs.indicator.start = melon_white
c.colors.tabs.indicator.stop = melon_gray

c.colors.tabs.even.bg = melon_blue_dark
c.colors.tabs.even.fg = melon_blue_dark
c.colors.tabs.odd.bg = melon_blue_dark
c.colors.tabs.odd.fg = melon_blue_dark

c.colors.tabs.selected.even.bg = melon_blue_light
c.colors.tabs.selected.even.fg = melon_blue_light
c.colors.tabs.selected.odd.bg = melon_blue_light
c.colors.tabs.selected.odd.fg = melon_blue_light
