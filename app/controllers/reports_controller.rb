class ReportsController < ApplicationController

  def index
    @reports = Report.all
  end

  def create
    @report = Report.new(report_params)
    if @report.save
      redirect_to reports_path
      flash[:success] = "Successfully created !"
    else
      render 'index'
    end
  end

  def new
    @report = Report.new
  end

  def edit
    @report = Report.find(params[:id])
  end

  def update
    @report = Report.find(params[:id])
    @report.update_attributes(report_params)
    redirect_to reports_path
    flash[:success] = "Rapport mis à jour avec succès"
  end

  def destroy
    @report = Report.find(params[:id])
    @report.destroy
    redirect_to reports_path
    flash[:success] = "Rapport supprimé avec succès"
  end

  private
  def report_params
    params.require(:report).permit(:user_name, :forest_name, :village, :governorate, :farmers_visited, :women_beneficiaries, :trees_planted, :visited_area, :trees_in_poor_condition, :farmers_problems, :name_of_farmers_met, :observation, :action, :forest_photo)
  end

end