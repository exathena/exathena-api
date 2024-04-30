defmodule ExAthenaApiWeb.Router do
  use ExAthenaApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug ExAthenaApiWeb.AuthPlug
  end

  scope "/", ExAthenaApiWeb do
    pipe_through :api

    scope "/charconfig" do
      post "/load", CharConfigController, :show
      post "/save", CharConfigController, :create
    end

    scope "/emblem" do
      post "/download", EmblemController, :download
      post "/upload", EmblemController, :upload
    end

    scope "/MerchantStore" do
      post "/load", MerchantStoreController, :show
      post "/save", MerchantStoreController, :create
    end

    scope "/party" do
      post "/add", PartyBookingController, :create
      post "/del", PartyBookingController, :delete
      post "/get", PartyBookingController, :get
      post "/info", PartyBookingController, :info
      post "/list", PartyBookingController, :index
      post "/search", PartyBookingController, :search
    end

    scope "/userconfig" do
      post "/load", UserConfigController, :show
      post "/save", UserConfigController, :create
    end
  end
end
