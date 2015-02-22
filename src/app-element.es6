export default function (el) {
  return new AppElement(el);
}

export class AppElement extends HTMLElement {
  constructor(el) {
    console.log('AppElement constructor, el:', el);
    el.innerHTML = '<h1>AppElement</h1>';
    return el
  }
}
