# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#
# =require ./graph

$(".years [data-graph]").each ->
  graph = $(@).data("graph")
  graph.on "click", (index, record, x, y) ->
    console.log graph.xToDate(x)
