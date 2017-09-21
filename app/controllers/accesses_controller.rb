class AccessesController < ApplicationController

  def index
    @accesses = Access.all
  end

end
