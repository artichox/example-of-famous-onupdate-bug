class @CurriculumMenu extends BaseNode

  constructor: ()->
    super

    @.OPEN = 1
    @.CLOSED = 0

    @.items = []

    @.setOrigin .5, .5, .5
     .setMountPoint 1, 1, .5
     .setAlign 1, 0
     .setSizeMode Node.ABSOLUTE_SIZE, Node.ABSOLUTE_SIZE
     .setAbsoluteSize 300, 900
     .setPosition 0, 0, 0

    @.domElement = new DOMElement @

    @.curriculums = [
      {title: "Title1"},
      {title: "Title2"},
      {title: "Title3"},
      {title: "Title4"}
    ]

    @.fillCurriculumList()
    @.positionTransitionable = new Transitionable 0

  fillCurriculumList: ()->
    index = 0
    for curr in @.curriculums
      console.log "Making a list time"
      item = new ListItem(curr , index * 50)
      @.addChild item
      @.items.push item
      index++

  onUpdate: ()->
    console.log "On update"
    @.setPosition 0, @.positionTransitionable.get() * 500, 0

  open: ()=>
    @.slideMenuTo @.OPEN

  close: ()=>
    @.slideMenuTo @.CLOSED

  toggle: ()=>
    if @.positionTransitionable.get() == @.OPEN
      target = @.CLOSED
    else
      target = @.OPEN

    @.slideMenuTo target

  slideMenuTo: ( target )=>
    console.log "Sliding the menu to ", target
    @.positionTransitionable.halt()
    @.positionTransitionable.to target, "easeOut", 2000
    @.requestUpdateOnNextTick @

class @ListItem extends Node

  constructor: (@curriculum, @offset)->
    @[name] = method for name, method of Node.prototype
    Node.apply @

    @.setOrigin .5, .5, .5
     .setMountPoint 0, 0, .5
     .setAlign 0, .5, .5
     .setSizeMode Node.RELATIVE_SIZE, Node.ABSOLUTE_SIZE
     .setProportionalSize .8
     .setAbsoluteSize 0, 40
     .setPosition 0, @.offset, 10

    title = @.curriculum.title
    @.domElement = new DOMElement @,
      tagName: "a"
      content: "#{title}"

    @.domElement.addClass "btn"
    @.domElement.addClass "green"
    @.domElement.addClass "waves-effect"
    @.domElement.addClass "waves-light"

    @.addUIEvent "click"

