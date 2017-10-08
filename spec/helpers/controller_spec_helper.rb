# spec/helpers/controller_spec_helper
module ControllerSpecHelper
  # Parse JSON response to ruby hash
  def json
    JSON.parse(response.body)
  end
end