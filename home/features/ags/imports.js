const resource = file => `resource:///com/github/Aylur/ags/${file}.js`
const require = async file => (await import(resource(file))).default

export const App = await require('app')
export const Widget = await require('widget')
