const greetd = await Service.import('greetd')

const name = Widget.Entry({
  placeholderText: 'Username',
  onAccept: () => password.grab_focus(),
})

const password = Widget.Entry({
  placeholderText: 'Password',
  onAccept: loginHandler,
  visibility: false,
})

const response = Widget.Label()

function loginHandler() {
  try {
    greetd.login(
      name.text || '', 
      password.text || '', 
      'Hyprland'
    )
  } catch (err) {
    response.label = JSON.stringify(err)
  }
}

const win = Widget.Window({
  css: 'background: none',
  anchor: ['top', 'left', 'right', 'bottom'],
  child: Widget.Box({
    vertical: true,
    hpack: 'center',
    vpack: 'center',
    hexpand: true,
    vexpand: true,
    children: [ name, password, response ],
  }),
})

export default { windows: [win] }
