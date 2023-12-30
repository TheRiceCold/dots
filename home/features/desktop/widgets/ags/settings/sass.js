import { App, Utils } from '../imports.js'
import { getOptions } from './option.js'
import { dependencies } from '../utils.js'

export async function reloadSass() {
  if (!dependencies(['sassc'])) return

  const opts = getOptions()
  const vars = opts.map(opt => {
    if (opt.sass === 'exclude') return ''

    const unit = typeof opt.value === 'number' ? opt.unit : ''
    const value = opt.sassFormat ? opt.sassFormat(opt.value) : opt.value
    return `$${opt.sass}: ${value}${unit};`
  })

  const bar_style = opts.find(opt => opt.id === 'bar.style')?.value || ''
  const additional = bar_style === 'normal' ? '//' : `
    window#quicksettings .window-content {
      margin-right: $wm-gaps
    }
  `

  try {
    const tmp = '/tmp/ags/sass'
    Utils.ensureDirectory(tmp)
    await Utils.writeFile(vars.join('\n'), `${tmp}/options.sass`)
    await Utils.writeFile(additional, `${tmp}/additional.sass`)
    await Utils.execAsync(`sassc ${App.configDir}/sass/main.sass ${tmp}/style.css`)
    App.resetCss()
    App.applyCss(`${tmp}/style.css`)
  } catch (error) {
    if (error instanceof Error) 
      console.error(error.message)

    if (typeof error === 'string') 
      console.error(error)
  }
}
