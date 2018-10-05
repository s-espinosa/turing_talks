class Admin::InningsController < Admin::BaseController
  def new
    @inning = Inning.new
  end

  def create
    @inning = Inning.new(inning_params)
    if @inning.save
      flash[:success] = "Inning was successfully created"
      redirect_to admin_dashboard_path
    else
      render :new
    end

  end

  private
  def inning_params
    params.require(:inning).permit(:name)
  end
end
