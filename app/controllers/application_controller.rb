class ApplicationController < ActionController::API
  private

  def query_params
    @query_params ||= request.query_parameters.with_indifferent_access
  end

  def request_body
    @request_body ||= request.request_parameters.symbolize_keys
  end
end
