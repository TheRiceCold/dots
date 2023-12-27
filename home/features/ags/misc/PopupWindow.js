import { App, Widget } from '../imports.js'

export default ({
  name,
  child,
  ...props
}) => Widget.Window({
  name,
  popup: true,
  visible: false,
  focusable: true,
  layer: 'overlay',
  ...props,

  child: Widget.Box({ 
    className: 'window-content',
    child 
  }),
})
