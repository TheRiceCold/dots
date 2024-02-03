const greetd = await Service.import('greetd')

const name = Widget.Entry({
  placeholderText: 'Username',
  onAccept: () => password.grab_focus(),
})

const password = Widget.Entry({
  visibility: false,
  placeholderText: 'Password',
  onAccept: () => {
    greetd.login(name.text || '', password.text || '', 'Hyprland')
      .catch(err => response.label = JSON.stringify(err))
  },
})

const response = Widget.Label()

const win = Widget.Window({
  css: 'background-color: transparent;',
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
