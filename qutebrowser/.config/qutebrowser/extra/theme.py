import subprocess
import sys

## Layout
# tabs left and only favicons
c.tabs.padding = {"bottom":24, "left":20, "right":23, "top":23}
c.tabs.position = "left"
c.tabs.show = "multiple"
# c.tabs.title.format = "{index}"
# c.tabs.title.format = ""
c.tabs.width = 70
c.tabs.favicons.scale = 1.5
c.tabs.indicator.width = 0
c.tabs.indicator.padding = {"bottom":0, "left":0, "right":8, "top":0}

# Miscs
c.tabs.background = True
c.statusbar.padding = {"bottom":15, "left":3, "right":3, "top":15}


## Fonts
c.fonts.default_family = "Cascadia Mono"
c.fonts.default_size = "10pt"


## Colors
def read_xresources(prefix):
    props = {}
    x = subprocess.run(['xrdb', '-query'], stdout=subprocess.PIPE)
    lines = x.stdout.decode().split('\n')
    for line in filter(lambda l : l.startswith(prefix), lines):
        prop, _, value = line.partition(':\t')
        props[prop] = value
    return props


def clamp(val, minimum=0, maximum=255):
    if val < minimum:
        return minimum
    if val > maximum:
        return maximum
    return val


def adjust(hexstr, scalefactor):
    hexstr = hexstr.strip('#')
    if scalefactor < 0 or len(hexstr) != 6:
        return hexstr

    r, g, b = int(hexstr[:2], 16), int(hexstr[2:4], 16), int(hexstr[4:], 16)
    r = int(clamp(r * scalefactor))
    g = int(clamp(g * scalefactor))
    b = int(clamp(b * scalefactor))

    return "#%02x%02x%02x" % (r, g, b)


xresources = read_xresources('*')

c.colors.completion.fg                          = xresources['*.foreground']
c.colors.completion.category.bg                 = xresources['*.background']
c.colors.completion.category.border.bottom      = xresources['*.color8']
c.colors.completion.category.border.top         = xresources['*.color0']
c.colors.completion.category.fg                 = xresources['*.color8']
c.colors.completion.even.bg                     = xresources['*.background']
c.colors.completion.item.selected.bg            = xresources['*.color0']
c.colors.completion.item.selected.border.bottom = xresources['*.color0']
c.colors.completion.item.selected.border.top    = xresources['*.color0']
c.colors.completion.item.selected.fg            = xresources['*.color15']
c.colors.completion.match.fg                    = xresources['*.color15']
c.colors.completion.odd.bg                      = xresources['*.background']
c.colors.completion.scrollbar.bg                = xresources['*.background']
c.colors.completion.scrollbar.fg                = xresources['*.color2']

c.colors.downloads.bar.bg    = xresources['*.color0']
c.colors.downloads.error.bg  = xresources['*.color1']
c.colors.downloads.error.fg  = xresources['*.color15']
c.colors.downloads.start.bg  = xresources['*.color2']
c.colors.downloads.start.fg  = xresources['*.color15']
c.colors.downloads.stop.bg   = xresources['*.background']
c.colors.downloads.stop.fg   = xresources['*.color15']
c.colors.downloads.system.bg = 'none'
c.colors.downloads.system.fg = 'none'

c.colors.hints.bg       = xresources['*.background']
c.colors.hints.fg       = xresources['*.color15']
c.colors.hints.match.fg = xresources['*.color2']

c.colors.messages.error.bg       = xresources['*.color1']
c.colors.messages.error.border   = xresources['*.color1']
c.colors.messages.error.fg       = xresources['*.color15']
c.colors.messages.info.bg        = xresources['*.color0']
c.colors.messages.info.border    = xresources['*.color0']
c.colors.messages.info.fg        = xresources['*.color15']
c.colors.messages.warning.bg     = xresources['*.color1']
c.colors.messages.warning.border = xresources['*.color1']
c.colors.messages.warning.fg     = xresources['*.color15']

c.colors.prompts.bg          = xresources['*.background']
c.colors.prompts.border      = '1px solid gray'
c.colors.prompts.fg          = xresources['*.color15']
c.colors.prompts.selected.bg = xresources['*.color0']

c.colors.statusbar.caret.bg             = xresources['*.color8']
c.colors.statusbar.caret.fg             = xresources['*.color15']
c.colors.statusbar.caret.selection.bg   = '#a12dff'
c.colors.statusbar.caret.selection.fg   = xresources['*.color15']
c.colors.statusbar.command.bg           = xresources['*.color8']
c.colors.statusbar.command.fg           = xresources['*.color15']
c.colors.statusbar.command.private.bg   = xresources['*.color15']
c.colors.statusbar.command.private.fg   = xresources['*.color15']
c.colors.statusbar.insert.bg            = xresources['*.color8']
c.colors.statusbar.insert.fg            = xresources['*.color2']
c.colors.statusbar.normal.bg            = xresources['*.background']
c.colors.statusbar.normal.fg            = xresources['*.foreground']
c.colors.statusbar.passthrough.bg       = xresources['*.color8']
c.colors.statusbar.passthrough.fg       = xresources['*.color1']
c.colors.statusbar.private.bg           = '#666666'
c.colors.statusbar.private.fg           = xresources['*.foreground']
c.colors.statusbar.progress.bg          = xresources['*.color15']
c.colors.statusbar.url.fg               = xresources['*.foreground']
c.colors.statusbar.url.hover.fg         = xresources['*.color6']
c.colors.statusbar.url.success.https.fg = adjust(xresources['*.foreground'], 0.7)
c.colors.statusbar.url.warn.fg          = xresources['*.color3']

# c.colors.tabs.bar.bg           = xresources['*.background']
# c.colors.tabs.even.bg          = adjust(xresources['*.background'], 1.15)
# c.colors.tabs.even.fg          = xresources['*.color15']
# c.colors.tabs.indicator.error  = '#ff0000'
# c.colors.tabs.odd.bg           = adjust(xresources['*.background'], 1.35)
# c.colors.tabs.odd.fg           = xresources['*.color15']
# c.colors.tabs.selected.even.bg = adjust(xresources['*.background'], 1.15)
# c.colors.tabs.selected.even.fg = xresources['*.color3']
# c.colors.tabs.selected.odd.bg  = adjust(xresources['*.background'], 1.35)
# c.colors.tabs.selected.odd.fg  = xresources['*.color3']

c.colors.tabs.bar.bg           = xresources['*.background']

c.colors.tabs.indicator.error  = xresources['*.color1']
c.colors.tabs.indicator.start  = xresources['*.color15']
c.colors.tabs.indicator.stop   = xresources['*.color6']

c.colors.tabs.even.bg          = xresources['*.background']
c.colors.tabs.even.fg          = xresources['*.foreground']
c.colors.tabs.odd.bg           = xresources['*.background']
c.colors.tabs.odd.fg           = xresources['*.foreground']

c.colors.tabs.selected.even.bg = xresources['*.color0']
c.colors.tabs.selected.even.fg = xresources['*.foreground']
c.colors.tabs.selected.odd.bg  = xresources['*.color0']
c.colors.tabs.selected.odd.fg  = xresources['*.foreground']
