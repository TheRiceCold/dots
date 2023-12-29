import { Widget } from '../../imports.js'
import { PopupWindow } from '../../misc/main.js'
import { SearchAndWindows } from './overview.js'

export default () => PopupWindow({
  name: 'overview',
  child: Widget.Box({
    vertical: true,
    children: [ SearchAndWindows() ]
  })
})
