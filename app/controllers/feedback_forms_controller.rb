class FeedbackFormsController < ApplicationController
  before_action :set_feedback_form, only: [:show, :edit, :update, :destroy]

  before_filter :authenticate_user!
  # GET /feedback_forms
  # GET /feedback_forms.json
  def index
    @feedback_forms = FeedbackForm.all
  end

  # GET /feedback_forms/1
  # GET /feedback_forms/1.json
  def show
  end

  # GET /feedback_forms/new
  def new
    @feedback_form = FeedbackForm.new
  end

  # GET /feedback_forms/1/edit
  def edit
  end

  # POST /feedback_forms
  # POST /feedback_forms.json
  def create
    @feedback_form = FeedbackForm.new(feedback_form_params)
    @workshop = Workshop.find(params[:workshop_id])
    @question_type_1 = Question.where('question_type_id = ?', 1)
    @question_type_2 = Question.where('question_type_id = ?', 2)
    @answer = Answer.new
    respond_to do |format|
      if @feedback_form.save
        format.html { redirect_to @feedback_form, notice: 'Feedback form was successfully created.' }
        format.json { render :show, status: :created, location: @feedback_form }
      else
        format.html { render :new }
        format.json { render json: @feedback_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /feedback_forms/1
  # PATCH/PUT /feedback_forms/1.json
  def update
    respond_to do |format|
      if @feedback_form.update(feedback_form_params)
        format.html { redirect_to @feedback_form, notice: 'Feedback form was successfully updated.' }
        format.json { render :show, status: :ok, location: @feedback_form }
      else
        format.html { render :edit }
        format.json { render json: @feedback_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feedback_forms/1
  # DELETE /feedback_forms/1.json
  def destroy
    @feedback_form.destroy
    respond_to do |format|
      format.html { redirect_to feedback_forms_url, notice: 'Feedback form was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feedback_form
      @feedback_form = FeedbackForm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feedback_form_params
      params.require(:feedback_form).permit(:name, :register_number, :token, :workshop_id, answers_attributes:[:question_id, :feedback_form_id, :feedback])
    end
end
