import { Widget } from '../../imports.js'

import Head from './Head.js'
import Body from './Body.js'

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
      Head(),
      Body(),

      // Click outside to close
      Widget.EventBox({
        onPrimaryClick: () => App.closeWindow('cheatsheet'),
        // onSecondaryClick: () => App.closeWindow('cheatsheet'),
        // onMiddleClick: () => App.closeWindow('cheatsheet'),
      })
    ],
  })
})
