import { App } from './imports.js'

import Desktop from './widgets/desktop/main.js'
import Launcher from './widgets/launcher/main.js'
import CheatSheet from './widgets/cheatsheet/main.js'
import Workspaces from './widgets/workspaces/main.js'
import ScreenCorners from './widgets/screencorners/main.js'

App.applyCss(`${App.configDir}/main.css`)

const windows = [
  Desktop(),
  Launcher(),
  CheatSheet(),
  Workspaces(),
].concat(ScreenCorners)

export default {
  css: `${App.configDir}/main.css`,
  stackTraceOnError: true,
  windows
}
