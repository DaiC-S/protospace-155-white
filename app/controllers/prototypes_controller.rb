class PrototypesController < ApplicationController
  def index

  end

  def new
    @prototype = Prototype.new
  end
end
