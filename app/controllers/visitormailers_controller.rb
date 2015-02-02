class VisitormailersController < ApplicationController
  before_action :set_visitormailer, only: [:show, :edit, :update, :destroy]

  # GET /visitormailers
  # GET /visitormailers.json
  def index
    @visitormailers = Visitormailer.all
  end

  # GET /visitormailers/1
  # GET /visitormailers/1.json
  def show
  end

  # GET /visitormailers/new
  def new
    @visitormailer = Visitormailer.new
  end

  # GET /visitormailers/1/edit
  def edit
  end

  # POST /visitormailers
  # POST /visitormailers.json
  def create
    @visitormailer = Visitormailer.new(visitormailer_params)

    respond_to do |format|
      if @visitormailer.save
      VisitorMailer.newsletterconfirmation(@visitormailer).deliver
      redirect_to @visitormailer
      else
        render "new"
      end
    end
  end

  # PATCH/PUT /visitormailers/1
  # PATCH/PUT /visitormailers/1.json
  def update
    respond_to do |format|
      if @visitormailer.update(visitormailer_params)
        format.html { redirect_to @visitormailer, notice: 'Visitormailer was successfully updated.' }
        format.json { render :show, status: :ok, location: @visitormailer }
      else
        format.html { render :edit }
        format.json { render json: @visitormailer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /visitormailers/1
  # DELETE /visitormailers/1.json
  def destroy
    @visitormailer.destroy
    respond_to do |format|
      format.html { redirect_to visitormailers_url, notice: 'Visitormailer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visitormailer
      @visitormailer = Visitormailer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def visitormailer_params
      params.require(:visitormailer).permit(:name, :email, :login)
    end
end
