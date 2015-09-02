class @Scene
  @get: ()->
    if !@.scene
      @.scene = new PrivateScene()
    return @.scene

  @init: ()->
    scene = Scene.get()
    scene.init()
    return scene

  class PrivateScene
    constructor: ()->
    init: ()->
      @.famousScene = FamousEngine.createScene "body"

      @.root = @.famousScene.addChild()
      @.pageSize =
        x: 0
        y: 0
        z: 0
      @.root.addComponent
        onSizeChange: (x, y, z)=>
          @.pageSize =
            x: x
            y: y
            z: z

      @.camera = new Camera @.famousScene
      @.camera.setDepth 1000

      @.header = new Header()
      @.root.addChild @.header
      @.header.openCurriculumMenu()
      console.log "Added the Header!"

    getPageSize: ()->
      return @.pageSize




