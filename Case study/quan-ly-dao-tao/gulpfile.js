var gulp = require('gulp'),
    watch = require('gulp-watch');

gulp.task('watch', function () {
    return watch('src/main/webapp/**/*.*', () => {
        gulp.src('src/main/webapp/**')
            //replace with build/resources/main/ for netBeans
            .pipe(gulp.dest('C:\\Tomcat\\apache-tomcat-9.0.67\\webapps\\ROOT'));
    });
});

gulp.task('watch');