import glob
import os


## Load settings applied with :set
config.load_autoconfig()

## General config
c.content.default_encoding = 'utf-8'
c.content.javascript.enabled = True
c.content.local_storage = True
c.content.plugins = True
c.editor.encoding = 'utf-8'

## Security & privacy
c.content.autoplay = False   # don't autoplay videos

## Adblocking
# Use (superior) Brave adblock if available, or fall back to host blocking
c.content.blocking.method = "auto"
c.content.blocking.hosts.lists = [
    'https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts',
    'https://pgl.yoyo.org/adservers/serverlist.php?hostformat=hosts&mimetype=plaintext'
    # 'https://www.malwaredomainlist.com/hostslist/hosts.txt',
    # 'http://someonewhocares.org/hosts/hosts',
    # 'http://winhelp2002.mvps.org/hosts.zip',
    # 'http://malwaredomains.lehigh.edu/files/justdomains.zip',
]
# c.content.blocking.whitelist = []

## Options
c.downloads.position = 'bottom'
c.downloads.location.directory = os.path.expanduser("~/Downloads")
c.downloads.location.prompt = False
c.prompt.filebrowser = False
c.spellcheck.languages = ['en-US']
c.session.lazy_restore = True
c.tabs.show = 'multiple'
c.tabs.title.format = '{audio}{current_title} - {host}'
c.tabs.title.format_pinned = ''
c.window.title_format = '{current_title} - {host} - qutebrowser'
c.scrolling.smooth = True

## Keybindings
config.bind('tm', 'tab-mute')
config.bind(';V', 'hint links spawn mpv {hint-url}')
config.bind('tt', 'set-cmd-text -s :tab-select ', mode='normal')

# Use external editor
c.editor.command = ['emacsclient', '-c', '-F', '((name . "qutebrowser-editor"))', '+{line}:{column}', '{}']
# Though we set it, I use the more specialzied emacs-everywhere instead
config.bind('<Ctrl+E>',    'edit-text', mode='insert')
config.bind('<Ctrl+E>',    'hint inputs --first ;; edit-text', mode='normal')
config.bind('<Shift+Ins>', 'fake-key <Ctrl+V>', mode='insert')


config.bind('<Ctrl-R>', 'config-cycle content.user_stylesheets "~/dev/solarized-everything-css/css/wal-dark/wal-dark-all-sites.css" ""')
# c.content.user_stylesheets = glob.glob(os.path.expanduser('~/development/solarized-everything-css/css/wal-dark/*.css'))

## Load theme
for path in glob.glob(os.path.expanduser('~/.config/qutebrowser/extra/*.py')):
    config.source(path)
