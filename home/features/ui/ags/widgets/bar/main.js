import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import OverviewButton from './buttons/OverviewButton.js';

const Start = () => Widget.Box({
  class_name: 'start',
  children: [
    OverviewButton(),
  ]
})

export default () => Widget.Window({
  name: 'bar',
  exclusivity: 'exclusive',
  anchor: ['top', 'left', 'right'],
  child: Widget.CenterBox({
    class_name: 'bar-bg',
    start_widget: Start(),
    center_widget: Widget.Label({ label: 'CenterWidget' }),
    end_widget: Widget.Label({ label: 'EndWidget' }),
  })
})
