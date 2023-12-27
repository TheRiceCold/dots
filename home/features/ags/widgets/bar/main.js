import { Widget } from '../../imports.js'

import StartWidget from './start/main.js'
import CenterWidget from './center/main.js'
import EndWidget from './end/main.js'

export default () => Widget.Window({
  name: 'bar',
  visible: true,
  exclusivity: 'ignore',
  anchor: ['top', 'left', 'right'],
  child: Widget.CenterBox({
    className: 'bar',
    startWidget: StartWidget(),
    centerWidget: CenterWidget(),
    endWidget: EndWidget(),
  })
})
