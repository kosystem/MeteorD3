if Meteor.isClient 
  Template.svg.greeting = -> 
    "Welcome to MeteorD3."

  Template.svg.events
    'click input' : -> 
      # template data, if any, is available in 'this'
      if console?
        console.log("You pressed the button")

  Template.svg.rendered = ->
    self = this

    svg = d3.select("p").append("svg")
      .attr
        width:500
        height:300

    circle = svg.append("circle")
      .attr
        cx : 200
        cy : 100
        r  : 50
        fill : "red"
      .on "mouseover", (d) ->
        d3.select(this)
          .attr({fill:"orange"})
      .on "mouseout", (d) ->
        d3.select(this)
          .attr({fill:"red"})

if Meteor.isServer
  Meteor.startup ->
    # code to run on server at startup
