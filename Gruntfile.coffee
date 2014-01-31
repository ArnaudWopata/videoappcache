module.exports = (grunt) ->
  grunt.loadNpmTasks "grunt-manifest"
  grunt.loadNpmTasks "grunt-contrib-watch"

  # Default task.
  grunt.registerTask "default", ["build"]
  grunt.registerTask "dev", ["build", "watch"]
  grunt.registerTask "heroku:production", "build"
  grunt.registerTask "build", [
    "manifest"
  ]

  # Print a timestamp (useful for when watching)
  grunt.registerTask "timestamp", ->
    grunt.log.subhead Date()

  # Project configuration.
  grunt.initConfig

    distdir: "public"

    pkg: grunt.file.readJSON("package.json")

    manifest:
      generate:
        options:
          preferOnline: true
          timestamp: true
          hash: true
          basePath: "<%= distdir %>"
          exclude: [
            'online.html'
            'fallback.html' ]
          fallback: ['/ /fallback.html']
        src: [ "*" ]
        dest: "<%= distdir %>/cache.manifest"
        filter: 'isFile'

    watch:
      all:
        files: ["<%= distdir %>/**/*"]
        tasks: ['build']
        options:
          livereload: true
          spawn: false

