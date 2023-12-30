import { Widget, SystemTray, Variable, Battery, Mpris } from '../../imports.js'

import Tray from './modules/Tray.js'
import SubMenu from './modules/SubMenu.js'
import BatteryBar from './modules/BatteryBar.js'
import ColorPicker from './modules/ColorPicker.js'
import ScreenRecord from './modules/ScreenRecord.js'
import SeparatorDot from './modules/SeparatorDot.js'
import MediaIndicator from './modules/MediaIndicator.js'
import SystemIndicators from './modules/SystemIndicator.js'

import { RoundedCorner } from '../../misc/main.js'
import Recorder from '../../services/screenrecord.js'

const submenuItems = Variable(1)
SystemTray.connect('changed', () => {
  submenuItems.setValue(Tray.items.length + 1)
})

export default () => Widget.Box({
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
