// import{ Gtk } = imports.gi;
import Widget from 'resource:///com/github/Aylur/ags/widget.js';

import { ModuleLeftSpace } from './leftspace.js';
// import { ModuleMusic } from "./music.js";

const left = Widget.Box({
  className: 'bar-sidemodule',
  // children: [ModuleMusic()]
});

// const center = Widget.Box({
//   children: [
//     RoundedCorner('topright', { className: 'corner-bar-group' }),
//     ModuleWorkspaces(),
//     RoundedCorner('topleft', { className: 'corner-bar-group' }),
//   ]
// });


export default () => Widget.Window({
  name: 'bar',
  anchor: ['top', 'left', 'right'],
  exclusivity: 'exclusive',
  visible: true,
  child: Widget.CenterBox({
    className: 'bar-bg',
    startWidget: ModuleLeftSpace(),
    centerWidget: Widget.Box({
      className: 'spacing-h--20' ,
      children: [
        left,
      //   center,
      //   right
      ]
    }),
    // endWidget: ModuleRightSpace(),
    setup: self => {
      const styleContext = self.get_style_context();
      // const minHeight = styleContext.get_property('min-height', Gtk.StateFlags.NORMAL);
      // execAsync(['bash', '-c', `hyprctl keyword monitor ,addreserved,${minHeight},0,0,0`]).catch(print);
    }
  })
});
