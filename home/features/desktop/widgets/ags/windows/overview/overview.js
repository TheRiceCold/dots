const { Gdk, Gtk } = imports.gi
import { 
  App, 
  Utils, 
  Widget, 
  Variable, 
  Hyprland,
} from '../../imports.js'

import { DoubleRevealer } from '../../misc/main.js'
// import { setupCursorHoverGrab } from '../../misc/CursorHover.js'

import { dumpToWorkspace, swapWorkspace } from './actions.js'

export const SCREEN_WIDTH = Number(Utils.exec(
  `bash -c "xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f1 | head -1" | awk '{print $1}'`
))
export const SCREEN_HEIGHT = Number(Utils.exec(
  `bash -c "xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f2 | head -1" | awk '{print $1}'`
))

const OVERVIEW_SCALE = 0.18 // = overview workspace box / screen size
const OVERVIEW_WS_NUM_SCALE = 0.09
const OVERVIEW_WS_NUM_MARGIN_SCALE = 0.07
const TARGET = [Gtk.TargetEntry.new('text/plain', Gtk.TargetFlags.SAME_APP, 0)]

const overviewTick = Variable(false)

function truncateTitle(str) {
  let lastDash = -1
  let found = -1 // 0: em dash, 1: en dash, 2: minus, 3: vertical bar, 4: middle dot
  for (let i = str.length - 1; i >= 0; i--) {
    if (str[i] === '—') {
      found = 0
      lastDash = i
    }
    else if (str[i] === '–' && found < 1) {
      found = 1
      lastDash = i
    }
    else if (str[i] === '-' && found < 2) {
      found = 2
      lastDash = i
    }
    else if (str[i] === '|' && found < 3) {
      found = 3
      lastDash = i
    }
    else if (str[i] === '·' && found < 4) {
      found = 4
      lastDash = i
    }
  }
  if (lastDash === -1) return str
  return str.substring(0, lastDash)
}

function iconExists(iconName) {
  let iconTheme = Gtk.IconTheme.get_default()
  return iconTheme.has_icon(iconName)
}

function substitute(str) {
  const subs = [
    { from: 'code-url-handler', to: 'visual-studio-code' },
    { from: 'Code', to: 'visual-studio-code' },
    { from: 'GitHub Desktop', to: 'github-desktop' },
    { from: 'wpsoffice', to: 'wps-office2019-kprometheus' },
    { from: 'gnome-tweaks', to: 'org.gnome.tweaks' },
    { from: 'Minecraft* 1.20.1', to: 'minecraft' },
    { from: '', to: 'image-missing' },
  ]

  for (const { from, to } of subs)
    if (from === str) 
      return to

  if (!iconExists(str)) str = str.toLowerCase().replace(/\s+/g, '-') // Turn into kebab-case
  return str
}

const ContextWorkspaceArray = ({ 
  label, 
  actionFunc, 
  thisWorkspace 
}) => Widget.MenuItem({
  label: `${label}`,
  setup: menuItem => {
    let submenu = new Gtk.Menu()
    submenu.className = 'menu'
    for (let i = 1; i <= 10; i++) {
      let button = new Gtk.MenuItem({ label: `Workspace ${i}` })
      button.connect('activate', () => {
        actionFunc(thisWorkspace, i)
        overviewTick.value = !overviewTick.value
      })
      submenu.append(button)
    }
    menuItem.set_reserve_indicator(true)
    menuItem.set_submenu(submenu)
  }
})

const client = ({ 
  address, size: [w, h], 
  workspace: { id, name }, 
  class: c, 
  title, 
  xwayland 
}) => {
  const revealInfoCondition = (Math.min(w, h) * OVERVIEW_SCALE > 70)

  if (w <= 0 || h <= 0) 
    return null

  title = truncateTitle(title)
  return Widget.Button({
    className: 'overview-tasks-window',
    hpack: 'center',
    vpack: 'center',
    onClicked: () => {
      Utils.execAsync([
        `bash`, `-c`, 
        `hyprctl dispatch focuswindow address:${address}`, `&`
      ]).catch(print)
      App.closeWindow('overview')
    },
    onMiddleClickRelease: () => Utils.execAsync([
      `bash`, `-c`, 
      `hyprctl dispatch closewindow address:${address}`, `&`
    ]).catch(print),
    onSecondaryClick: (button) => {
      button.toggleClassName('overview-tasks-window-selected', true)
      const menu = Widget.Menu({
        className: 'menu',
        children: [
          Widget.MenuItem({
            child: Widget.Label({ xalign: 0, label: "Close (Middle-click)" }),
            onActivate: () => {
              Utils.execAsync([
                `bash`, `-c`, 
                `hyprctl dispatch closewindow address:${address}`, `&`
              ]).catch(print)
            }
          }),
          ContextWorkspaceArray({
            label: "Dump windows to workspace",
            actionFunc: dumpToWorkspace,
            thisWorkspace: Number(id)
          }),
          ContextWorkspaceArray({
            label: "Swap windows with workspace",
            actionFunc: swapWorkspace,
            thisWorkspace: Number(id)
          }),
        ],
      })
      menu.connect('deactivate', () => {
        button.toggleClassName('overview-tasks-window-selected', false)
      })
      menu.connect('selection-done', () => {
        button.toggleClassName('overview-tasks-window-selected', false)
      })
      menu.popup_at_pointer(null) // Show the menu at the pointer's position
    },
    child: Widget.Box({
      css: `
          min-width: ${Math.max(w * OVERVIEW_SCALE - 4, 1)}px;
          min-height: ${Math.max(h * OVERVIEW_SCALE - 4, 1)}px;
      `,
      homogeneous: true,
      child: Widget.Box({
        vertical: true,
        vpack: 'center',
        className: 'spacing-v-5',
        children: [
          Widget.Icon({
            icon: substitute(c),
            size: Math.min(w, h) * OVERVIEW_SCALE / 2.5,
          }),
          // TODO: Add xwayland tag instead of just having italics
          DoubleRevealer({
            transition1: 'slide_right',
            transition2: 'slide_down',
            revealChild: revealInfoCondition,
            child: Widget.Scrollable({
              hexpand: true,
              vscroll: 'never',
              hscroll: 'automatic',
              child: Widget.Label({
                truncate: 'end',
                className: `${xwayland ? 'txt txt-italic' : 'txt'}`,
                css: `
                  font-size: ${Math.min(SCREEN_WIDTH, SCREEN_HEIGHT) * OVERVIEW_SCALE / 14.6}px;
                  margin: 0px ${Math.min(SCREEN_WIDTH, SCREEN_HEIGHT) * OVERVIEW_SCALE / 10}px;
                `,
                // If the title is too short, include the class
                label: (title.length <= 1 ? `${c}: ${title}` : title),
              })
            })
          })
        ]
      })
    }),
    tooltipText: `${c}: ${title}`,

    setup: (button) => {
      // setupCursorHoverGrab(button)

      button.drag_source_set(Gdk.ModifierType.BUTTON1_MASK, TARGET, Gdk.DragAction.MOVE)
      button.drag_source_set_icon_name(substitute(c))

      button.connect('drag-begin', (button) => {  // On drag start, add the dragging class
        button.toggleClassName('overview-tasks-window-dragging', true)
      })

      button.connect('drag-data-get', (_w, _c, data) => { // On drag finish, give address
        data.set_text(address, address.length)
        button.toggleClassName('overview-tasks-window-dragging', false)
      })
    },
  })
}

const workspace = index => {
  const fixed = Gtk.Fixed.new()

  const WorkspaceNumber = i => Widget.Label({
    className: 'overview-tasks-workspace-number',
    label: `${i}`,
    css: `
      margin: ${Math.min(SCREEN_WIDTH, SCREEN_HEIGHT) * OVERVIEW_SCALE * OVERVIEW_WS_NUM_MARGIN_SCALE}px;
      font-size: ${SCREEN_HEIGHT * OVERVIEW_SCALE * OVERVIEW_WS_NUM_SCALE}px;
    `,
  })

  const widget = Widget.Box({
    className: 'overview-tasks-workspace',
    vpack: 'center',
    css: `
      min-width: ${SCREEN_WIDTH * OVERVIEW_SCALE}px;
      min-height: ${SCREEN_HEIGHT * OVERVIEW_SCALE}px;
    `,
    children: [
      Widget.EventBox({
        hexpand: true,
        vexpand: true,
        onPrimaryClickRelease: () => {
          Utils.execAsync([
            `bash`, `-c`, 
            `hyprctl dispatch workspace ${index}`, `&`
          ]).catch(print)
          App.closeWindow('overview')
        },
        setup: eventbox => {
          eventbox.drag_dest_set(Gtk.DestDefaults.ALL, TARGET, Gdk.DragAction.COPY)
          eventbox.connect('drag-data-received', (_w, _c, _x, _y, data) => {
            overviewTick.value = !overviewTick.value
            Utils.execAsync([
              `bash`, `-c`, 
              `hyprctl dispatch movetoworkspacesilent ${index},address:${data.get_text()}`, `&`
            ]).catch(print)
          })
        },
        child: fixed,
      })
    ],
  })
  widget.update = clients => {
    clients = clients.filter(({ workspace: { id } }) => id === index)
    clients = clients.map(client => {
      const [x, y] = client.at
      if (x > SCREEN_WIDTH) client.at = [x - SCREEN_WIDTH, y]
      return client
    })

    fixed.get_children().forEach(ch => ch.destroy())
    fixed.put(WorkspaceNumber(index), 0, 0)
    clients.forEach(c => c.mapped && fixed.put(
      client(c), c.at[0] * OVERVIEW_SCALE, c.at[1] * OVERVIEW_SCALE
    ))
    fixed.show_all()
  }
  return widget
}

const arr = (s, n) => {
  const array = []
  for (let i = 0; i < n; i++) array.push(s + i)
  return array
}

const OverviewRow = ({ 
  workspaces, 
  startWorkspace, 
  windowName = 'overview' 
}) => Widget.Box({
  children: arr(startWorkspace, workspaces).map(workspace),
  properties: [['update', box => {
    Utils.execAsync('hyprctl -j clients')
      .then(clients => {
        const json = JSON.parse(clients)
        box.get_children().forEach(ch => ch.update(json))
      }).catch(print)
  }]],
  setup: (box) => box._update(box),
  connections: [
    // Update on change
    [overviewTick, box => { 
      if (!App.getWindow(windowName).visible) return
      Utils.timeout(2, () => box._update(box)) 
    }],
    [Hyprland, box => { 
      if (!App.getWindow(windowName).visible) return 
      box._update(box)
    }, 'client-added' ],
    [Hyprland, box => { 
      if (!App.getWindow(windowName).visible) return
      box._update(box) 
    }, 'client-removed'],
    [App, (box, name, visible) => { // Update on open
      if (name == 'overview' && visible)
        box._update(box)
    }],
  ]
})

export const SearchAndWindows = () => {
  return Widget.Revealer({
    revealChild: true,
    transition: 'slide_down',
    transitionDuration: 200,
    child: Widget.Box({
      vertical: true,
      className: 'overview-tasks',
      children: [
        OverviewRow({ startWorkspace: 1, workspaces: 5 }),
        OverviewRow({ startWorkspace: 6, workspaces: 5 }),
      ]
    }),
  })
} 
