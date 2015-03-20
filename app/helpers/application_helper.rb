module ApplicationHelper
  def tracked_hours_graph options = {}
    type = options.delete(:type) || "Bar"
    content_tag :div, nil,
      "data-graph" => type,
      "data-graph-options" => tracked_hours_graph_defaults.merge(options).to_json
  end

  def tracked_hours_graph_defaults
    {
      data: per_week.values,
      xkey: "week",
      ykeys: employees,
      labels: employees,
      hideHover: "auto",
      postUnits: "uur",
    }
  end
end
