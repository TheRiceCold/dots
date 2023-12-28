import { Widget } from '../../imports.js'

import StartWidget from './start.js'
import CenterWidget from './center.js'
import EndWidget from './end.js'

export default () => Widget.Window({
  name: 'bar',
  visible: true,
  layer: 'overlay',
  exclusivity: 'ignore',
  anchor: ['top', 'left', 'right'],
  child: Widget.CenterBox({
    className: 'bar',
    startWidget: StartWidget(),
    centerWidget: CenterWidget(),
    endWidget: EndWidget(),
  })
})
