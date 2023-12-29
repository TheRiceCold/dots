import { Widget, Hyprland } from '../../../imports.js'
import { RoundedCorner } from '../../../misc/main.js'

const NUM_OF_WORKSPACES = 10

const WorkspaceButton = i => Widget.EventBox({
  className: 'workspace-button',
  onPrimaryClickRelease: () => Hyprland.sendMessage(`dispatch workspace ${i}`),
  child: Widget.Label({ label: `${i}`, className: 'button-label' })
}).hook(Hyprland.active.workspace, btn => {
  btn.toggleClassName('active', Hyprland.active.workspace.id === i)
})

const Workspaces = () => Widget.EventBox({
  className: 'workspaces-background',
  child: Widget.Box({
    className: 'workspaces',
    children: Array.from(
      { length: NUM_OF_WORKSPACES },
      (_, i) => i + 1
    ).map(i => WorkspaceButton(i)), 
  }).hook(Hyprland, ({ children }) => {
    children.forEach((item, i) => {
      const ws = Hyprland.getWorkspace(i + 1)
      const ws_before = Hyprland.getWorkspace(i)
      const ws_after = Hyprland.getWorkspace(i + 2)

      item.toggleClassName('occupied', ws?.windows > 0)
      item.toggleClassName('occupied-right', !ws_after || ws_after?.windows <= 0)
      item.toggleClassName('occupied-left', !ws_before || ws_before?.windows <= 0)
    })
  }, 'notify::workspaces')
})


export default () => Widget.Box({
  children: [
    RoundedCorner('topright', { className: 'corner-bar-group' }),
    Workspaces(),
    RoundedCorner('topleft', { className: 'corner-bar-group' }),
  ]
})
