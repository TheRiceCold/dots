const resource = file => `resource:///com/github/Aylur/ags/${file}.js`
const require = async file => (await import(resource(file))).default

export const App = await require('app')
export const Widget = await require('widget')
export const Service = await require('service')
export const Variable = await require('variable')
export const Utils = await import(resource('utils'))
