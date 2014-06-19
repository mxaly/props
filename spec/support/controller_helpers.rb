module ControllerHelpers
  def sign_in(user = double('user'))
    allow(controller).to receive(:current_user) { user }
  end

  def json_response
    JSON.load(response.body)
  end
end
