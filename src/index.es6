import debug from 'debug'

let log = debug('play-jspm');

log('in src/index.es6')

/**
 * Should boot the jspm-play thing.
 * It's important to be a function so that the module itself
 * does not have side effects.
 * Dependencies (injected)
 * * window {DOM.Window}
 */
export default class {
  constructor({ document }) {
    log('in jspm-play constructor', document);
  }
}
