import { Widget } from '../../imports.js'
import { RoundedCorner } from '../../misc/main.js'

import Workspaces from './workspaces.js'
import Tray from './tray.js'

const StartSpace = () => Widget.EventBox({
  hpack: 'start',
  className: 'bar-startspace',
  // className: 'bar-endspace',
  child: Widget.Box({
    children: [
      RoundedCorner('topleft', { className: 'corner-black' })
    ]
  })
})

export default () => Widget.Window({
  name: 'bar',
  anchor: ['top', 'left', 'right'],
  exclusivity: 'exclusive',
  visible: true,
  child: Widget.CenterBox({
    className: 'bar',
    startWidget: StartSpace(),
    centerWidget: Workspaces(),
    endWidget: Tray(),
  }),
})
