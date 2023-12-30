import { Widget } from '../../imports.js'
import { RoundedCorner } from '../../misc/main.js'

export default () => Widget.EventBox({
  child: Widget.Box({
    children: [
      RoundedCorner('topleft', { className: 'corner-black' })
    ]
  })
})
