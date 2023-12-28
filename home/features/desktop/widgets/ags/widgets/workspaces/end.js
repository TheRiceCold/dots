import { Widget } from '../../imports.js'

import { RoundedCorner } from '../../misc/main.js'

export default () => Widget.EventBox({
  hpack: 'end',
  className: 'bar-endspace',
  child: Widget.Box({
    children: [
      RoundedCorner('topright', { className: 'corner-black' }),
    ]
  })
})
