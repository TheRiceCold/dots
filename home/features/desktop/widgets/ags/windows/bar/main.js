import { Widget, Battery, Variable, Mpris, SystemTray } from '../../imports.js'
import { RoundedCorner } from '../../misc/main.js'

import Recorder from '../../services/screenrecord.js'

import Tray from './modules/Tray.js'
import SubMenu from './modules/SubMenu.js'
import BatteryBar from './modules/BatteryBar.js'
import Workspaces from './modules/Workspaces.js'
import ColorPicker from './modules/ColorPicker.js'
import ScreenRecord from './modules/ScreenRecord.js'
import MediaIndicator from './modules/MediaIndicator.js'
import SystemIndicators from './modules/SystemIndicator.js'

import options from '../../options.js'

const submenuItems = Variable(1)
SystemTray.connect('changed', () => {
  submenuItems.setValue(Tray.items.length + 1)
})

const SeparatorDot = (service, condition) => {
  const visibility = self => {
    if (!options.bar.separators.value)
      return self.visible = false

    self.visible = condition && service
      ? condition(service)
      : options.bar.separators.value
  }

  const conn = service ? [[service, visibility]] : []
  return Widget.Separator({
    connections: [['draw', visibility], ...conn],
    binds: [['visible', options.bar.separators]],
    vpack: 'center',
  })
}

const StartWidget = () => Widget.EventBox({
  child: Widget.Box({
    children: [
      RoundedCorner('topleft', { className: 'corner-black' })
    ]
  })
})

const End = () => Widget.Box({
  className: 'end',
  children: [
    SeparatorDot(Mpris, m => m.players.length > 0),
    MediaIndicator(),
    Widget.Box({ hexpand: true }),
    SubMenu({
      items: submenuItems,
      children: [ Tray(), ColorPicker() ],
    }),
    SeparatorDot(),
    ScreenRecord(),
    SeparatorDot(Recorder, r => r.recording),
    SystemIndicators(),
    SeparatorDot(Battery, b => b.available),
    BatteryBar(),
    RoundedCorner('topright', { className: 'corner-black' })
  ],
})

export default () => Widget.Window({
  name: 'bar',
  exclusivity: 'exclusive',
  anchor: ['top', 'left', 'right'],
  child: Widget.CenterBox({
    className: 'bar-bg',
    startWidget: StartWidget(),
    centerWidget: Workspaces(),
    endWidget: End(),
  })
})
