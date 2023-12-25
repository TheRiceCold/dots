import { Widget } from '../../imports.js'

import Header from './header.js'
import Keybinds from './keybinds.js'

export default () => Widget.Window({
  name: 'cheatsheet',
  exclusivity: 'normal',
  popup: true,
  visible: false,
  focusable: true,
  child: Widget.Box({
    vertical: true,
    className: 'cheatsheet-bg spacing-v-15',
    children: [
      Header(),
      Keybinds(),

      // Click outside to close
      Widget.EventBox({
        onPrimaryClick: () => App.closeWindow('cheatsheet'),
        onSecondaryClick: () => App.closeWindow('cheatsheet'),
        onMiddleClick: () => App.closeWindow('cheatsheet'),
      })
    ],
  })
})
