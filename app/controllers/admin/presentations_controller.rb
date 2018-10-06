class Admin::PresentationsController < Admin::BaseController
  def new
    @inning       = Inning.find(params[:inning_id])
    @presentation = @inning.presentations.new
  end

  def create
    @inning = Inning.find(params[:inning_id])
    @presentation = @inning.presentations.new(presentation_params)
    if @presentation.save
      flash[:success] = "Successfully created presentation date."
      redirect_to admin_inning_path(@inning)
    else
      flash[:error] = "Something went wrong."
      render :new
    end
  end

  def edit
    @presentation = Presentation.find(params[:id])
    @inning = @presentation.inning
  end

  def update
    @presentation = Presentation.find(params[:id])
    if @presentation.update(presentation_params)
      flash[:success] = "Successfully updated presentation date"
      redirect_to admin_inning_path(@presentation.inning)
    else
      flash[:error] = "Something went wrong."
      render :edit
    end
  end

  private
  def presentation_params
    params.require(:presentation).permit(:date, :due_date)
  end
end
