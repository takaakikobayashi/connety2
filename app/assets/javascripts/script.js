// position: stickyがブラウザで使えるかチェックするための関数
function detectSticky() {
  const div = document.createElement('div');
  div.style.position = 'sticky';
  return div.style.position.indexOf('sticky') !== -1;
}
 
// .stickyが指定されている要素に対してposition: stickyを適用させる関数
function callStickyState() {
  return new StickyState(document.querySelectorAll('.sticky'));
}
 
// もしブラウザでposition: stickyが使えなければ、callStickyState関数を呼び出す
if (!detectSticky()) {
  callStickyState();
}