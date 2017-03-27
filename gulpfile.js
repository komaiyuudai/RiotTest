var gulp = require( 'gulp' );

gulp.task('copy', function() {
    return gulp.src([
        'node_modules/riot/riot+compiler.min.js'
    ])
    .pipe(gulp.dest( 'js' ));
});