---
layout: post
title: Foundation 5 grunt configuration with CoffeeScript and grunt-newer
tags: Foundation grunt CoffeeScript
---

Configurazione per **[Foundation 5](http://foundation.zurb.com/)** [Ruby Gem](http://foundation.zurb.com/docs/sass.html), con aggiunto supporto per **[CoffeeScript](http://coffeescript.org/)** ed integrazione **[grunt-newer](https://www.npmjs.org/package/grunt-newer)**.

#### Gruntfile.js
<pre><code>
module.exports = function(grunt) {
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    coffee: {
      compileJoined: {
        options: {
          join: true
        },
        files: {
          'js/app.js': ['coffeescripts/app.coffee', 'coffeescripts/*.coffee']
        }
      },
      glob_to_multiple: {
        expand: true,
        flatten: true,
        cwd: 'p_coffeescripts',
        src: ['*.coffee'],
        dest: 'js/plugins/',
        ext: '.js'
      }
    },
    sass: {
      options: {
        includePaths: ['bower_components/foundation/scss']
      },
      dist: {
        options: {
          outputStyle: 'compressed'
        },
        files: {
          'css/app.css': 'scss/app.scss'
        }
      }
    },
    watch: {
      grunt: { files: ['Gruntfile.js'] },
      sass: {
        files: 'scss/**/*.scss',
        tasks: ['sass']
      },
      coffee: {
        options: {
          livereload: true
        },
        files: ['coffeescripts/*.*', 'p_coffeescripts/*.*'],
        tasks: ['coffee']
      },
      html: {
        options: {
          livereload: true
        },
        files: ['*.html']
      }
    }
  });

  grunt.loadNpmTasks('grunt-contrib-coffee');
  grunt.loadNpmTasks('grunt-sass');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-newer');

  grunt.registerTask('build', ['newer:sass', 'newer:coffee']);
  grunt.registerTask('default', ['build','watch']);
}

</code></pre>

#### package.json
<pre><code>
{
  "name": "foundation-libsass-template",
  "version": "0.0.1",
  "devDependencies": {
    "node-sass": "~0.7.0",
    "grunt": "~0.4.1",
    "grunt-contrib-watch": "^0.5.3",
    "grunt-sass": "~0.8.0",
    "grunt-contrib-coffee": "^0.10.1",
    "grunt-newer": "^0.6.1"
  }
}

</code></pre>

### [Gist[!]](https://gist.github.com/genoma/9248932)
