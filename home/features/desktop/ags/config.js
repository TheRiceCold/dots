import { App } from './imports.js';
import Bar from './widgets/bar.js';

App.applyCss(`${App.configDir}/main.css`);

// Config object
export default {
  css: `${App.configDir}/main.css`,
  stackTraceOnError: true,
  windows: [
    Bar()
  ],
};
