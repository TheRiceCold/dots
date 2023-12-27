import { Widget } from '../../../imports.js'
import RoundedCorner from '../../../misc/RoundedCorner.js'
import Workspaces from './Workspaces.js'

export default () => Widget.Box({
  children: [
    RoundedCorner('topright', { className: 'corner-bar-group' }),
    Workspaces(),
    RoundedCorner('topleft', { className: 'corner-bar-group' }),
  ]
})
