'strict mode';
import { App, Utils } from './imports.js';
import Bar from './widgets/bar/main.js';
import Session from './widgets/session/main.js';
import SideLeft from './widgets/sideleft/main.js';
import SideRight from './widgets/sideright/main.js';

const CLOSE_ANIM_TIME = 210;

Utils.exec(`sassc ${App.configDir}/scss/main.scss ${App.configDir}/style.css`);
App.resetCss();
App.applyCss(`${App.configDir}/style.css`);

export default {
  css: `${App.configDir}/style.css`,
  stackTraceOnError: true,
  closeWindowDelay: { // For animations
    'sideright': CLOSE_ANIM_TIME,
    'sideleft': CLOSE_ANIM_TIME,
    'osk': CLOSE_ANIM_TIME,
  },
    windows: [
      Bar(),
      // CornerTopleft(),
      // CornerTopright(),
      // CornerBottomleft(),
      // CornerBottomright(),
      // DesktopBackground(),
      // Dock(), // Buggy
      // Overview(),
      // Indicator(),
      // Cheatsheet(),
      SideLeft(),
      SideRight(),
      // Osk(), // On-screen keyboard
      Session(), // Power menu, if that's what you like to call it
    ],
};
