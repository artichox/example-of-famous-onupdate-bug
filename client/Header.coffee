class @Header extends BaseNode
  constructor: ()->
    super

    pageSize = Scene.get().getPageSize()
    @.setOrigin .5, .5, 0
     .setMountPoint 0, 0, 0
     .setAlign 0, 0, 0
     .setSizeMode "relative", "relative"
     .setProportionalSize 1, .075

    @.domElement = new DOMElement @, {
      attributes: {
        class: "nav z-depth-2"
      }
    }

    @.logo = new Logo()
    @.addChild @.logo

    @.curriculumMenu = new CurriculumMenu()
    @.addChild @.curriculumMenu

    @.addUIEvent "click"

  onUpdate: ()->
    console.log "Header is updating"

  openCurriculumMenu: ()=>
    console.log "Opening curriculum menu"
    @.curriculumMenu.open()
    @
  

class Logo
  constructor: ()->
    @[name] = method for name, method of Node.prototype
    Node.apply @

    @.setOrigin .5, .5, .5
     .setMountPoint 0, 0, 0
     .setAlign .03, .05, .5
     .setSizeMode "absolute", "absolute", "absolute"
     .setAbsoluteSize 100, 30, 10

    @.domElement = new DOMElement @, {
      content: "<a href='/'><img class='round-tile z-depth-2' alt='Noora Health' src='NHlogo.png'/></a>"
    }

    @.addUIEvent "click"

class Menu

  constructor: ()->
    @[name] = method for name, method of Node.prototype
    Node.apply @

    @.setOrigin .5, .5, .5
     .setMountPoint 1, .5, 0
     .setAlign 1, .5, 0
     .setSizeMode "absolute", "absolute"
     .setAbsoluteSize 40, 30
     .setPosition 0, 100, 0

    @.domElement = new DOMElement @, {
      tagName: "a"
      content: "SELECT CURRICULUM"
      properties:
        cursor: "pointer"
        "background-color": "blue"
    }

    @.addUIEvent "click"


