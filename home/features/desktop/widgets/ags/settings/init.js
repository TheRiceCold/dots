import { App, Utils } from '../imports.js'
import options from '../options.js'
import setGlobals from '../settings/globals.js'

export default () => {
  loadSass()
  setGlobals()
  gtkFontSettings()
}

function loadSass() {
  const css = `${App.configDir}/main.css`
  const sass = `${App.configDir}/sass/main.sass`

  Utils.exec(`sassc ${sass} ${css}`)
  App.resetCss()
  App.applyCss(`${App.configDir}/main.css`)

}

function gtkFontSettings() {
  const settings = imports.gi.Gtk.Settings.get_default()
  if (!settings) {
    console.error(Error('Gtk.Settings unavailable'))
    return
  }

  const callback = () => {
    const { size, font } = options.font
    settings.gtk_font_name = `${font.value} ${size.value}`
  }

  options.font.font.connect('notify::value', callback)
  options.font.size.connect('notify::value', callback)
}
