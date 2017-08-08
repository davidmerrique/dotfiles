mapkey('J', '#3Go one tab left', 'RUNTIME("previousTab")');
mapkey('K', '#3Go one tab right', 'RUNTIME("nextTab")');
mapkey('H', '#4Go back in history', 'history.go(-1)', {repeatIgnore: true});
mapkey('L', '#4Go forward in history', 'history.go(1)', {repeatIgnore: true});
unmap('j', /(twitter|feedbin)\.com/i);
unmap('k', /(twitter|feedbin)\.com/i);
unmap('h', /feedbin\.com/i);
unmap('l', /feedbin\.com/i);