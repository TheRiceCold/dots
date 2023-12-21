import Bar from './widgets/bar/main.js';
import AppLauncher from './widgets/app-launcher/main.js';

const windows = () => [
  Bar(),
  AppLauncher(),
];

export default {
  stackTraceOnError: true,
  windows: windows().flat(1),
  maxStreamVolume: 1.05,
  cacheNotificationActions: false,
};
