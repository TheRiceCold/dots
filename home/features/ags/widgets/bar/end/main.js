import { Widget } from '../../../imports.js'

// import Tray from './Tray.js'
import { RoundedCorner } from '../../../misc/main.js'

export default () => Widget.EventBox({
  hpack: 'end',
  className: 'bar-endspace',
  child: Widget.Box({
    children: [
      // Tray(),
      RoundedCorner('topright', { className: 'corner' })
    ]
  })
})
