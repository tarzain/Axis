Audio5js = require('audio5')

module.exports = class Sound
    @audioReady = false
    
    constructor: ->
      @_setupAudio()

    #############
    # Audio stuff
    #############

    _setupAudio: ->
      @audio = new Audio5js(
        swf_path: "node_modules/audio5/swf/audio5js.swf"
        throw_errors: true
        ready: @_audioReady
      )

    _audioReady: ->
      @audioReady = true


    play: (soundName)->
      switch soundName
        when 'explosion'
          @audio.load("/audio/explosion.mp3")
          @audio.play()