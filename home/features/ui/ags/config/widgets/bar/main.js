import Widget from 'resource:///com/github/Aylur/ags/widget.js';

export default () => Widget.Window({
  name: 'bar',
  exclusivity: 'exclusive',
  anchor: ['top', 'left', 'right'],
  child: Widget.CenterBox({
    class_name: 'bar-bg',
    start_widget: Widget.Label({ label: 'StartWidget' }),
    center_widget: Widget.Label({ label: 'CenterWidget' }),
    end_widget: Widget.Label({ label: 'EndWidget' }),
  })
});
