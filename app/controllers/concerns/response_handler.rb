module ResponseHandler
  def json_response(object, status = :ok)
    render json: object, status: status
  end
end