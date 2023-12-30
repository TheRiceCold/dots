import { App, Utils } from './imports.js'

import init from './settings/init.js'
import Bar from './windows/bar/main.js'
import Desktop from './windows/desktop/main.js'
import Launcher from './windows/launcher/main.js'
// import Overview from './windows/overview/main.js'
import CheatSheet from './windows/cheatsheet/main.js'
// import Indicators from './windows/indicators/main.js'
import ScreenCorners from './windows/screencorners/main.js'

const windows = [
  Bar(),
  Desktop(),
  Launcher(),
  // Overview(),
  CheatSheet(),
  // Indicators(),
].concat(ScreenCorners)

export default {
  windows,
  onConfigParsed: init,
  stackTraceOnError: true,
  css: `${App.configDir}/main.css`,
}
