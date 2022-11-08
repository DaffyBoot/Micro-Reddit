class HomeController < ApplicationController
  def index
    @posts = Post.all.limit(25)
  end
end
