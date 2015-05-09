class SnipetsController < ApplicationController
  def index
    @snipets = Snipet.all
  end
end
