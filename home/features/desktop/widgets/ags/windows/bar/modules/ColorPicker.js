import { Widget } from '../../../imports.js'
import { FontIcon } from '../../../misc/main.js'

import Colors from '../../../services/colorpicker.js'
import PanelButton from './PanelButton.js'

const { Gdk } = imports.gi

export default () => PanelButton({
  className: 'color-picker',
  content: FontIcon(''),
  binds: [[
    'tooltip-text', 
    Colors, 
    'colors', 
    v => `${v.length} colors`
  ]],
  onClicked: () => Colors.pick(),

  on_secondary_click: btn => {
    if (Colors.colors.length === 0) return

    Widget.Menu({
      className: 'colorpicker',
      children: Colors.colors.map(color => Widget.MenuItem({
        child: Widget.Label(color),
        css: `background-color: ${color}`,
        on_activate: () => Colors.wlCopy(color),
      })),
    }).popup_at_widget(btn, Gdk.Gravity.SOUTH, Gdk.Gravity.NORTH, null)
  },
})
