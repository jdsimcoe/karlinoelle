module.exports = function (grunt) {
  'use strict';

  // Load local NPM tasks
  grunt.loadNpmTasks('grunt-recess');
  grunt.loadNpmTasks('grunt-growl');

  grunt.initConfig({

    lint : {
      all: [
        '../js/master.js'
      ]
    },

    minify : {
      all: [
        '../less/master.less'
      ]
    },

    recess: {
      main: {
        src: [
        '../less/master.less'
        ],
        dest: '../css/master.1.0.1.css',
        options: {
            compile: true,
            compress: true
        }
      }
    },

    watch : {
      scripts: {
        files: [
          '../less/*.less',
          '../js/*.js'
        ],
        tasks: 'lint:all min:dist recess:main'
      }
    },

    min: {
      dist: {
        src : [
          '../bootstrap/docs/assets/js/jquery.js',
          '../bootstrap/docs/assets/js/bootstrap.min.js',
          '<config:lint.all>',
          '../js/responsimage.js',
          '../js/reftagger.js',
        ],
        dest: '../js/master.1.0.1.js',
        separator: ';'
      }
    },

    growl : {
      compile : {
        title : "Grunt.js",
        message : "Grunt was run successfully"
      }
    }

});

// Main task
grunt.registerTask('default', 'lint:all min:dist recess:main growl:compile')};