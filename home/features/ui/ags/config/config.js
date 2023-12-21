import Bar from './widgets/bar/main.js';

const windows = () => [
  Bar(),
];

export default {
  stackTraceOnError: true,
  windows: windows().flat(1),
  maxStreamVolume: 1.05,
  cacheNotificationActions: false,
};

