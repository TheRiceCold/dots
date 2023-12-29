import { Widget, Battery } from '../../imports.js'
import { RoundedCorner } from '../../misc/main.js'

import LauncherButton from './modules/LauncherButton.js'
import Workspaces from './modules/Workspaces.js'
import BatteryBar from './modules/BatteryBar.js'
import Tray from './modules/Tray.js'

const StartWidget = () => Widget.EventBox({
  child: Widget.Box({
    children: [
      RoundedCorner('topleft', { className: 'corner-black' })
    ]
  })
})

const EndWidget = () => Widget.EventBox({
  hpack: 'end',
  child: Widget.Box({
    children: [
      Tray(),
      BatteryBar(),
      RoundedCorner('topright', { className: 'corner-black' })
    ]
  })
})

export default () => Widget.Window({
  name: 'bar',
  exclusivity: 'exclusive',
  anchor: ['top', 'left', 'right'],
  child: Widget.CenterBox({
    className: 'bar-bg',
    startWidget: StartWidget(),
    centerWidget: Workspaces(),
    endWidget: EndWidget(),
  })
})
