import { Widget } from '../../../imports.js'
import { FontIcon } from '../../../misc/main.js'
import Recorder from '../../../services/screenrecord.js'
import PanelButton from './PanelButton.js'
// import icons from '../../icons.js'

export default () => PanelButton({
  className: 'recorder',
  onClicked: () => Recorder.stop(),
  binds: [['visible', Recorder, 'recording']],
  content: Widget.Box({
    children: [
      FontIcon('󰑋'),
      Widget.Label({
        binds: [['label', Recorder, 'timer', time => {
          const sec = time % 60
          const min = Math.floor(time / 60)
          return `${min}:${sec < 10 ? '0' + sec : sec}`
        }]],
      }),
    ],
  }),
})
