import gulp from 'gulp';
import gulpLoadPlugins from 'gulp-load-plugins';
import runSequence from 'run-sequence';

const $ = gulpLoadPlugins();
let src = {};

// The default task
gulp.task('default', ['serve']);

gulp.task('cpp', () => {
    src.cpp = './src/**/*.{cpp,cc,c}';
    var options = {
        continueOnError: false, // default = false, true means don't emit error event
        pipeStdout: false, // default = false, true means stdout is written to file.contents
        customTemplatingThing: "test" // content passed to gutil.template()
    };
    var reportOptions = {
        err: true, // default = true, false means don't write err
        stderr: true, // default = true, false means don't write stderr
        stdout: true // default = true, false means don't write stdout
    };
    return gulp.src(src.cpp)
        .pipe($.exec('./run.sh', options))
        .pipe($.exec.reporter(reportOptions));
});

gulp.task('build', (cb) => {
    runSequence(['cpp'], cb);
});

gulp.task('serve', ['build'], () => {
    $.nodemon({
        exec: 'cd build && python3 -m http.server 8000',
        tasks: runSequence('build', () => {
            gulp.watch(src.cpp, ['cpp']);
        })
    });
});