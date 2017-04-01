class WorkshopsController < ApplicationController
  before_action :set_workshop, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index, :show]

  # GET /workshops
  # GET /workshops.json
  def index
    if current_user.try(:is_user?) || current_user.try(:is_admin?)
      @workshops = Workshop.all
    else
      @workshops = Workshop.where('allow_access = ?', true)
    end
    @question_type_1 = Question.where('question_type_id = ?', 1)
    @question_type_2 = Question.where('question_type_id = ?', 2)
  end

  # GET /workshops/1
  # GET /workshops/1.json
  def show
    @workshop = Workshop.find(params[:id])
    @feedback_form = FeedbackForm.new
    @question_type_1 = Question.where('question_type_id = ?', 1)
    @question_type_2 = Question.where('question_type_id = ?', 2)
    @answer = Answer.new
  end

  # GET /workshops/new
  def new
    @workshop = Workshop.new
  end

  # GET /workshops/1/edit
  def edit
  end

  # POST /workshops
  # POST /workshops.json
  def create
    @workshop = Workshop.new(workshop_params)
        @workshop.user_id = current_user.id
        @workshop.token = 6.times.map{rand(6)}.join
    respond_to do |format|
      if @workshop.save
        format.html { redirect_to @workshop, notice: 'Workshop was successfully created.' }
        format.json { render :show, status: :created, location: @workshop }
      else
        format.html { render :new }
        format.json { render json: @workshop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workshops/1
  # PATCH/PUT /workshops/1.json
  def update
    respond_to do |format|
      if @workshop.update(workshop_params)
        format.html { redirect_to @workshop, notice: 'Workshop was successfully updated.' }
        format.json { render :show, status: :ok, location: @workshop }
      else
        format.html { render :edit }
        format.json { render json: @workshop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workshops/1
  # DELETE /workshops/1.json
  def destroy
    @workshop.destroy
    respond_to do |format|
      format.html { redirect_to workshops_url, notice: 'Workshop was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def stats
    @workshop = Workshop.find(params[:workshops])
    @question_type_1 = Question.where('question_type_id = ?', 1)
    @question_type_2 = Question.where('question_type_id = ?', 2)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workshop
      @workshop = Workshop.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def workshop_params
      params.require(:workshop).permit(:title, :description, :start_date, :end_date, :token, :user_id, :department_id, :allow_access, instructor_ids: [], department_ids: [])
    end
end
