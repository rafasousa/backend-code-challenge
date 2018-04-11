class ApplicationController < ActionController::API
  rescue_from(ActionController::UnpermittedParameters) do |pme|
    render json: { error:  { unknown_parameters: pme.params } },
             status: :bad_request
  end

  def cost_validations
    params.permit(:origin, :destination, :weight)
    errors = []
    params.each {|key, value| if value.blank? then errors << "Error: Parameter #{key} is empty." end}
    unless params[:origin] =~ /[[:alpha:]]/ then errors << "Error: Parameter origin must exist and be a letter." end
    unless params[:destination] =~ /[[:alpha:]]/ then errors << "Error: Parameter destination must exist and be a letter." end
    unless params[:weight] =~ /[[:digit:]]/ then errors << "Error: Parameter weight must be a number." end
    unless params[:weight].to_f > 0 && params[:weight].to_f <= 50 then errors << "Weight must be positive or maximum 50." end
    if errors.any? then render json: errors, status: :bad_request end
  end

  def path_validations
    params.permit(:source, :destination, :distance)
    errors = []
    params.each {|key, value| if value.blank? then errors << "Error: Parameter #{key} is empty." end}
    unless params[:source] =~ /[[:alpha:]]/ then errors << "Error: Parameter source must exist and be a letter." end
    unless params[:destination] =~ /[[:alpha:]]/ then errors << "Error: Parameter destination must exist and be a letter." end
    unless params[:distance] =~ /[[:digit:]]/ then errors << "Error: Parameter distance must be a number." end
    unless params[:distance].to_f > 0 && params[:distance].to_f <= 100000 then errors << "Distance must be positive or maximum 100000." end
    if errors.any? then render json: errors, status: :bad_request end
  end
end
