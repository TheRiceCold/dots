import { Option } from './settings/option.js'

export default {
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

  font: {
    font: Option('Ubuntu Nerd Font', {
      'type': 'font',
      'title': 'Font',
      'scss': 'font',
    }),
    mono: Option('Mononoki Nerd Font', {
      'title': 'Monospaced Font',
      'scss': 'mono-font',
    }),
    size: Option(13, { 'scss': 'font-size', 'unit': 'pt' }),
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
    flat_buttons: Option(true, { 'scss': 'bar-flat-buttons' }),
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
      width: Option(70, { 'category': 'Bar' }),
      height: Option(14, { 'category': 'Bar' }),
      full: Option(false, { 'category': 'Bar' }),
    },
    low: Option(30, { 'category': 'Bar' }),
    medium: Option(50, { 'category': 'Bar' }),
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
  },
}
