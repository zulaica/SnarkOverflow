class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    # @user = User.find(@question.user_id)
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.new(questions_params)
    # @question.user_id = current_user.id
    if @question.save
      redirect_to questions_path
    else
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
    render :edit
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(questions_params)
      redirect_to questions_path
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    flash[:notice] = "Question deleted!"
    redirect_to questions_path
  end

private
  def questions_params
    params.require(:question).permit(:title, :body, :user_id)
  end
end
