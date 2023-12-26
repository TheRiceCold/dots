import { App, Widget, SystemTray } from '../../imports.js'
import { RoundedCorner } from '../../misc/main.js'

const { Gravity } = imports.gi.Gdk

const SysTrayItem = item => Widget.Button({
  className: 'bar-systray-item',
  child: Widget.Icon({
    hpack: 'center',
    icon: item.bind('icon')
  }),
  binds: [['tooltipMarkup', item, 'tooltip-markup']],
  onClicked: btn => item.menu.popup_at_widget(btn, Gravity.SOUTH, Gravity.NORTH, null),
  onSecondaryClick: btn => item.menu.popup_at_widget(btn, Gravity.SOUTH, Gravity.NORTH, null),
})

const Tray = () => Widget.Box({
  spacing: 8,
  className: 'bar-systray bar-group',
  attribute: {
    items: new Map(),
    onAdded: (box, id) => {
      const item = SystemTray.getItem(id)
      if (!item) return

      item.menu.className = 'menu'

      if (box.attribute.items.has(id) || !item) return

      const widget = SysTrayItem(item)
      box.pack_start(widget, false, false, 0)
      box.attribute.items.set(id, widget)
      box.show_all()
    },
    onRemoved: (box, id) => {
      if (!box.attribute.items.has(id)) return

      box.attribute.items.get(id).destroy()
      box.attribute.items.delete(id)
    },
  }
})
  .hook(SystemTray, (box, id) => box.attribute.onAdded(box, id), 'added')
  .hook(SystemTray, (box, id) => box.attribute.onRemoved(box, id), 'removed')


export default () => Widget.EventBox({
  hpack: 'end',
  className: 'bar-endspace',
  child: Widget.Box({
    children: [
      Tray(),
      RoundedCorner('topright', { className: 'corner-black' })
    ]
  })
})
