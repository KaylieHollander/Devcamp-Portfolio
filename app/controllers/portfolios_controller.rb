  class PortfoliosController < ApplicationController
  def index
    @portfolio_items = Portfolio.all
  end
  
def new
    @portfolio_item = Portfolio.new
end

def create
      @portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Your portfolio item is now live.' }
        format.json { render :show, status: :created, location: @portfolio_item }
      else
        format.html { render :new }
        format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
      end
    end
end

def edit
  @portfolio_item = Portfolio.find(params[:id])
end 

def show
  @portfolio_item = Portfolio.find(params[:id])
end

 def destroy
   # Preform the lookup
   @portfolio_item = Portfolio.find(params[:id])
   
   # Delte/destroy the record
    @portfolio_item.destroy
    
    # Redirects 
    respond_to do |format|
    format.html { redirect_to portfolios_url, notice: 'Record was removed.' }
    end
 end

  end