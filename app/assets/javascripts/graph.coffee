Morris.Line::xToDate = (x) ->
  relx = (x - @left) / (@right - @left)
  relx = Math.max(0, relx)
  new Date(@xmin + relx * (@xmax - @xmin))

$("[data-graph]").each ->
  type=$(@).data("graph")
  options =$(@).data("graph-options")
  options.element = $(@)
  unless options.data.length
    options.data = ({week: "2015 W#{w}"} for w in [1..52])
  $(@).data "graph", Morris[type](options)
