import { Widget } from '../../imports.js';
const { Box, Button, Label } = Widget;

export const SidebarModule = ({ name, child }) => Box({
  className: 'sidebar-module',
  vertical: true,
  children: [
    Button({
      child: Box({
        children: [
          Label({ className: 'txt-small txt', label: `${name}` }),
          Label({ className: 'sidebar-module-btn-arrow' })
        ]
      })
    })
  ]
})
