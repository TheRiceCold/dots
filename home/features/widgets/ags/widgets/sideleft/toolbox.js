import { Widget } from '../../imports.js';
import { QuickScripts } from './quickscripts.js';

const { Box, Scrollable } = Widget;

export default Scrollable({
  hscroll: "never",
  vscroll: "automatic",
  child: Box({
    vertical: true,
    children: [ QuickScripts() ]
  })
});
