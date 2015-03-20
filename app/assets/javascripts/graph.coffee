Morris.Line::xToDate = (x) ->
  relx = (x - @left) / (@right - @left)
  relx = Math.min(1, Math.max(0, relx))
  new Date(@xmin + relx * (@xmax - @xmin))

$("[data-graph]").each ->
  type=$(@).data("graph")
  options =$(@).data("graph-options")
  options.element = $(@)
  $(@).data "graph", Morris[type](options)
