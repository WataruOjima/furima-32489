class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :update, :new, :update, :destroy]
  def index
  end

end
