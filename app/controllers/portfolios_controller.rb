class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: [:edit, :update, :show, :destroy]
  layout 'portfolio'
  
  def index
    @portfolio_items = Portfolio.all
  end
  
  def new 
    @portfolio_item = Portfolio.new
    3.times { @portfolio_item.technologies.build }
  end
  
  def create
   @portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Your Portfolio Item is Now Live.' }
      else
        format.html { render :new }
      end
    end
  end
  
  def edit
    
  end
  
  def update
    
    respond_to do |format|
      if @blog.update(params.require(:portfolio).permit(:title, :subtitle, :body))
        format.html { redirect_to portfolios_path, notice: 'The Record was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end
  
  def show
    binding.pry
  end
  
  def destroy
    #Preform the lookup
    @portfolio_item = Portfolio.find(params[:id])
    
    #destroy/delet the record
    @portfolio_item.destroy
    
    # Redirect
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Post was successfully removed.' }
    end
  end
  
  def portfolio_params
    params.require(:portfolio).permit(:title,
                                      :subtitle,
                                      :body,
                                      technologies_attributes: [:name]
                                      )
  end
  
  def set_portfolio_item
    @portfolio_item = Portfolio.find(params[:id])
  end
end
  
 
