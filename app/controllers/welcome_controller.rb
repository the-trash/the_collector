class WelcomeController < ApplicationController
  def index
    @items = Kaminari.paginate_array(Collection.first.items).page(params[:page]).per(10)
  end
end
