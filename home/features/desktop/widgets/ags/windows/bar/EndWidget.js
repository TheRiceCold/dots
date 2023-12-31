import { Widget, SystemTray, Variable, Battery } from '../../imports.js'
import { RoundedCorner } from '../../misc/main.js'
import {
  Tray,
  SubMenu,
  BatteryBar,
  DateButton,
  ColorPicker,
  ScreenRecord,
  SeparatorDot,
  SystemIndicator,
} from './modules/exports.js'
import Recorder from '../../services/screenrecord.js'

const submenuItems = Variable(1)
SystemTray.connect('changed', () => {
  submenuItems.setValue(Tray.items.length + 1)
})

export default () => Widget.Box({
  hpack: 'end',
  className: 'end',
  children: [
    SubMenu({
      items: submenuItems,
      children: [ Tray(), ColorPicker() ],
    }),
    ScreenRecord(),
    SeparatorDot(Recorder, r => r.recording),
    SeparatorDot(Battery, b => b.available),
    BatteryBar(),
    SeparatorDot(),
    SystemIndicator(),
    SeparatorDot(),
    DateButton(),
    RoundedCorner('topright', { className: 'corner-black' })
  ],
})
