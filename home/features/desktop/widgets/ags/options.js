import { Utils } from './imports.js'
import { Option } from './settings/option.js'

export default {
  spacing: Option(8),
  padding: Option(8),
  radii: Option(4),

  popover_padding_multiplier: Option(1.4, {
    'category': 'General',
    'note': 'popover-padding: padding × this',
    'type': 'float',
    'unit': '',
  }),

  color: {
    red: Option('#e55f86', { 'sass': 'red' }),
    green: Option('#00D787', { 'sass': 'green' }),
    yellow: Option('#EBFF71', { 'sass': 'yellow' }),
    blue: Option('#51a4e7', { 'sass': 'blue' }),
    magenta: Option('#9077e7', { 'sass': 'magenta' }),
    teal: Option('#51e6e6', { 'sass': 'teal' }),
    orange: Option('#E79E64', { 'sass': 'orange' }),
  },

  theme: {
    // name: Option(themes[0].name, { 'category': 'exclude', 'note': 'Name to show as active in quicktoggles' }),
    // icon: Option(themes[0].icon, { 'category': 'exclude', 'note': 'Icon to show as active in quicktoggles' }),

    scheme: Option('dark', {
      'enums': ['dark', 'light'],
      'type': 'enum',
      'note': "Color scheme to set on Gtk apps: 'light' or 'dark'",
      'title': 'Color Scheme',
      'sass': 'color-scheme',
    }),
    bg: Option('#171717', { 'title': 'Background Color', 'sass': 'bg-color' }),
    fg: Option('#eeeeee', { 'title': 'Foreground Color', 'sass': 'fg-color' }),
    accent: {
      accent: Option('$blue', { 'category': 'Theme', 'title': 'Accent Color', 'sass': 'accent' }),
      fg: Option('#141414', { 'category': 'Theme', 'title': 'Accent Foreground Color', 'sass': 'accent-fg' }),
      gradient: Option('to right, $accent, lighten($accent, 6%)', { 'category': 'Theme', 'title': 'Accent Linear Gradient', 'sass': 'accent-gradient' }),
    },

    widget: {
      bg: Option('$fg-color', { 'category': 'Theme', 'title': 'Widget Background Color', 'sass': '_widget-bg' }),
      opacity: Option(94, { 'category': 'Theme', 'title': 'Widget Background Opacity', 'unit': '', 'sass': 'widget-opacity' }),
    },
  },

  border: {
    color: Option('$fg-color', { 'category': 'Border', 'title': 'Border Color', 'sass': '_border-color' }),
    opacity: Option(97, { 'category': 'Border', 'title': 'Border Opacity', 'unit': '', }),
    width: Option(1, { 'category': 'Border', 'title': 'Border Width', }),
  },

  workspaces: Option(5, {
    'category': 'Bar',
    'title': 'No. workspaces on bar and overview',
    'note': 'Set it to 0 to make it dynamic',
  }),

  substitutions: {
    icons: [
      ['transmission-gtk', 'transmission'],
      ['blueberry.py', 'bluetooth'],
      ['Caprine', 'facebook-messenger'],
      ['', 'preferences-desktop-display'],
    ],
  },

  hypr: {
    inactive_border: Option('rgba(333333ff)', {
      'category': 'Border',
      'title': 'Border on Inactive Windows',
      'sass': 'exclude',
    }),
    wm_gaps_multiplier: Option(2.4, {
      'category': 'General',
      'sass': 'wm-gaps-multiplier',
      'note': 'wm-gaps: padding × this',
      'type': 'float',
      'unit': '',
    }),
  },

  transition: Option(200, {
    'category': 'exclude',
    'note': 'Transition time on aminations in ms, e.g on hover',
    'unit': 'ms',
  }),

  font: {
    font: Option('FiraCode Nerd Font', {
      'type': 'font',
      'title': 'Font',
      'sass': 'font',
    }),
    mono: Option('JetBrainsMono Nerd Font', {
      'title': 'Monospaced Font',
      'sass': 'mono-font',
    }),
    size: Option(13, { 'sass': 'font-size', 'unit': 'pt' }),
  },

  bar: {
    position: Option('top', {
      'enums': ['top', 'bottom'],
      'type': 'enum',
    }),
    style: Option('normal', {
      'enums': ['floating', 'normal', 'separated'],
      'type': 'enum',
    }),
    flat_buttons: Option(true, { 'sass': 'bar-flat-buttons' }),
    separators: Option(true),
    icon: Option('distro-icon', {
      'note': '"distro-icon" or a single font',
    }),
  },

  battery: {
    showPercentage: Option(true, {
      'persist': true,
      'noReload': false,
      'category': 'exclude',
    }),
    bar: {
      showIcon: Option(true, { 'category': 'Bar' }),
      width: Option(28, { 'category': 'Bar' }),
      height: Option(12, { 'category': 'Bar' }),
      full: Option(false, { 'category': 'Bar' }),
    },
    low: Option(30, { 'category': 'Bar' }),
    medium: Option(50, { 'category': 'Bar' }),
  },

  desktop: {
    wallpaper: {
      fg: Option('#fff', { 'sass': 'wallpaper-fg' }),
      // img: Option(themes[0].options['desktop.wallpaper.img'], { 'sassFormat': v => `"${v}"`, 'type': 'img' }),
    },
    avatar: Option(`/var/lib/AccountsService/icons/${Utils.USER}`, {
      'sassFormat': v => `"${v}"`,
      'type': 'img',
      'note': 'displayed in quicksettings and locksreen',
    }),
    screen_corners: Option(true, { 'sass': 'screen-corners' }),
    clock: {
      enable: Option(true),
      position: Option('center center', { 'note': 'halign valign' }),
    },
    drop_shadow: Option(true, { 'sass': 'drop-shadow' }),
    shadow: Option('rgba(0, 0, 0, .6)', { 'sass': 'shadow' }),
    dock: {
      icon_size: Option(56),
      pinned_apps: Option([
        'firefox',
        'org.wezfurlong.wezterm',
        'org.gnome.Nautilus',
        'org.gnome.Calendar',
        'obsidian',
        'transmission-gtk',
        'caprine',
        'teams-for-linux',
        'discord',
        'spotify',
        'com.usebottles.bottles',
        'org.gnome.Software',
      ], { 'sass': 'exclude' }),
    },
  },

  mpris: {
    black_list: Option(['Caprine'], {
      'category': 'Bar',
      'title': 'List of blacklisted mpris players',
      'note': 'filters for bus-name, name, identity, entry',
    }),
    preferred: Option('spotify', {
      'category': 'Bar',
      'title': 'Preferred player',
    }),
  }
}
