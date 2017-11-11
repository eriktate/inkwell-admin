'use strict';

var gulp = require('gulp');
var sass = require('gulp-sass');
var exec = require('child_process').exec;

// Watch for changes to regenerate CSS
gulp.task('watch', function() {
  gulp.watch('./src/**/*.elm', ['elm-css'])
})

// Regenerate CSS from elm source
gulp.task('elm-css', function() {
  exec('elm-css src/Stylesheets.elm --output src/', function(err, stdout, stderr) {
    console.log(stdout);
    console.log(stderr);
  });
})
