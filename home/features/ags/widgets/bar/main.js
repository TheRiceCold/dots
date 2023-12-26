import { Widget } from '../../imports.js'

import LauncherButton from './LauncherButton.js'
import Workspaces from './Workspaces.js'
import Tray from './Tray.js'

export default () => Widget.Window({
  name: 'bar',
  anchor: ['top', 'left', 'right'],
  exclusivity: 'exclusive',
  visible: true,
  child: Widget.CenterBox({
    className: 'bar',
    startWidget: LauncherButton(),
    centerWidget: Workspaces(),
    endWidget: Tray(),
  })
})
