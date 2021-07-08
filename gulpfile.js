const { watch, src } = require('gulp');
var webserver = require('gulp-webserver');
var run = require('gulp-run');

function build(cb) {
  console.log('开始build代码');
  run('idris2 --build learn-idris2.ipkg').exec()
  cb();
}

exports.default = function(cb) {
  watch('src/*',{ ignoreInitial: false }, build);
  src('.')
    .pipe(webserver({
      host: "localhost",
      livereload: true,
      directoryListing: true,
      open: "/dist/index.html",
      path: '/',
    }));
}