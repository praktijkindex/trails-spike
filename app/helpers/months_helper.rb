module MonthsHelper
  def month_number
    params[:id].to_i
  end

  def month
    params[:id] && Month.new(2015, month_number)
  end
end
