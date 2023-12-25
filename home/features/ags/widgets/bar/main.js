import { Widget } from '../../imports.js'

import Workspaces from './workspaces.js'

export default () => Widget.Window({
  name: 'bar',
  anchor: ['top', 'left', 'right'],
  exclusivity: 'exclusive',
  visible: true,
  child: Widget.CenterBox({
    className: 'bar',
    // startWidget: ModuleLeftSpace(),
    centerWidget: Workspaces(),
    // endWidget: ModuleRightSpace(),
  }),
})
