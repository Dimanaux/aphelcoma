require "rails_helper"

describe UsersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/users").to route_to("users#index")
    end

    it "routes to #show using username as a slug" do
      expect(get: "/users/john").to route_to("users#show", username: "john")
    end
  end
end
