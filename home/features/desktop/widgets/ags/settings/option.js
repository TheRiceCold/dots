import options from '../options.js'
import { Service, Utils } from '../imports.js'

const CACHE_FILE = Utils.CACHE_DIR + '/options.json'
let cacheObj = JSON.parse(Utils.readFile(CACHE_FILE) || '{}')

export class Opt extends Service {
  static { Service.register(this, {}, { 'value': ['jsobject'] }) }

  #value
  #scss = ''
  unit = 'px'
  noReload = false
  persist = false
  id = ''
  title = ''
  note = ''
  type = ''
  category = ''
  enums = []
  format = v => v
  scssFormat = v => v

  constructor(value, config) {
    super()
    this.#value = value
    this.type = typeof value
    this.defaultValue = value

    if (config) Object.keys(config).forEach(c => this[c] = config[c])
    import('../options.js').then(this.#init.bind(this))
  }

  set scss(scss) { this.#scss = scss }
  get scss() {
    return this.#scss || this.id
      .split('.').join('-').split('_').join('-')
  }

  #init() {
    getOptions()

    if (cacheObj[this.id] !== undefined) 
      this.setValue(cacheObj[this.id])

    const words = this.id
      .split('.').flatMap(w => w.split('_'))
      .map(word => word.charAt(0).toUpperCase() + word.slice(1))

    this.title ||= words.join(' ')
    this.category ||= words.length === 1 ? 'General' : words.at(0) || 'General'

    this.connect('changed', () => {
      cacheObj[this.id] = this.value
      Utils.writeFile(
        JSON.stringify(cacheObj, null, 2),
        CACHE_FILE,
      )
    })
  }

  get value() { return this.#value }
  set value(value) { this.setValue(value) }

  setValue(value, reload = false) {
    if (typeof value !== typeof this.defaultValue) {
      console.error(Error(
        `WrongType: Option "${this.id}" can't be set to ${value}, ` + 
        `expected "${typeof this.defaultValue}", but got "${typeof value}"`
      ))
      return
    }

    if (this.value !== value) {
      this.#value = this.format(value)
      this.changed('value')

      if (reload && !this.noReload) {
        // reloadScss()
        // setupHyprland()
      }
    }
  }

  reset(reload = false) {
    if (!this.persist) this.setValue(this.defaultValue, reload)
  }
}

export const Option = (value, config) => new Opt(value, config)

export const getOptions = (object = options, path = '') =>
  Object.keys(object).flatMap(key => {
    const obj = object[key]
    const id = path ? path + '.' + key : key

    if (obj instanceof Opt) {
      obj.id = id
      return obj
    }

    if (typeof obj === 'object') return getOptions(obj, id)

    return []
  })
