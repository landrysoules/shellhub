require "rails_helper"

RSpec.describe SnipetsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/snipets").to route_to("snipets#index")
    end

    it "routes to #new" do
      expect(:get => "/snipets/new").to route_to("snipets#new")
    end

    it "routes to #show" do
      expect(:get => "/snipets/1").to route_to("snipets#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/snipets/1/edit").to route_to("snipets#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/snipets").to route_to("snipets#create")
    end

    it "routes to #update" do
      expect(:put => "/snipets/1").to route_to("snipets#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/snipets/1").to route_to("snipets#destroy", :id => "1")
    end

  end
end
