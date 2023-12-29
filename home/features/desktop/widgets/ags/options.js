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
  }
}
