class ResultsController < ApplicationController

  def index
    @results = Result.all
  end

  def new
    @result = Result.new
  end

  def download
      @result = Result.find(params[:id])

      send_file @result.file.path
    end

  def create
    @result = Result.new hola
    if @result.save
      redirect_to results_path
    else
      render :new
    end
  end

  def show
      @result = Result.find(params[:id])

      send_file Rails.root + "/public"  + @result.file.path, :filename => @result.file_file_name,
            :type => @result.file_content_type,
            :disposition => 'attachment'
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def hola
      params.require(:result).permit(:file)
    end



end
