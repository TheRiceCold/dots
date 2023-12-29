import { App, Utils } from './imports.js'

import Bar from './windows/bar/main.js'
import Desktop from './windows/desktop/main.js'
import Launcher from './windows/launcher/main.js'
import Overview from './windows/overview/main.js'
import CheatSheet from './windows/cheatsheet/main.js'
import Indicators from './windows/indicators/main.js'
import ScreenCorners from './windows/screencorners/main.js'

const css = `${App.configDir}/style.css`
const sass = `${App.configDir}/scss/main.sass`
Utils.exec(`sassc ${sass} ${css}`)

App.resetCss()
App.applyCss(`${App.configDir}/main.css`)

const windows = [
  Bar(),
  Desktop(),
  Launcher(),
  Overview(),
  CheatSheet(),
  Indicators(),
].concat(ScreenCorners)

export default {
  css: `${App.configDir}/main.css`,
  stackTraceOnError: true,
  windows
}
