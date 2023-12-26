import { Widget } from '../../imports.js'
import Clock from '../../misc/clock.js'

const TimeDate = () => Widget.Box({
  hpack: 'end',
  vpack: 'end',
  vertical: true,
  className: 'bg-time-box',
  children: [
    Clock({ 
      interval: 5000,
      format: '%I:%M %p',
      className: 'bg-time-clock',
    }),
    Clock({ 
      interval: 5000,
      format: '%A, %d/%m/%Y',
      className: 'bg-time-date',
    })
  ],
})

export default() => Widget.Window({
  name: 'desktop',
  layer: 'background',
  className: 'desktop',
  anchor: ['top', 'bottom', 'left', 'right'],
  child: TimeDate(),
})
