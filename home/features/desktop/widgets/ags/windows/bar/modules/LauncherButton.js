import { App, Widget, Hyprland } from '../../../imports.js'
import { RoundedCorner } from '../../../misc/main.js'

const { get_os_info } = imports.gi.GLib

const distroIcon = (() => {
  switch (get_os_info('ID')) {
    case 'fedora': return ''
    case 'arch': return ''
    case 'nixos': return ''
    case 'debian': return ''
    case 'opensuse-tumbleweed': return ''
    case 'ubuntu': return ''
    case 'endeavouros': return ''
    default: return ''
  }
})()

export default () => Widget.EventBox({
  hpack: 'start',
  className: 'bar-startspace',
  onPrimaryClick: () => App.toggleWindow('launcher'),
  child: Widget.Box({
    children: [
      RoundedCorner('topleft', { className: 'corner' }),
      Widget.Label({ 
        label: distroIcon,
        className: 'launcher',
      }),
      Widget.Label({
        xalign: 0,
        className: 'client',
        connections: [[Hyprland.active.client, label => {
          const title = Hyprland.active.client._class
          label.label = title.length === 0 
            ? 'Desktop' : title.charAt(0).toUpperCase() + title.slice(1)
        }]],
      }),
    ]
  })
})
