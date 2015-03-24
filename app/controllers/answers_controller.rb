class AnswersController < ApplicationController
  def new
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
    @answer.user_id = current_user.id
    if @answer.save
      flash[:notice] = "Answer successfully added!"
      redirect_to question_path(@answer.question)
    else
      render :new
    end
  end


  def edit
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    render :edit
  end

  def update
    @question = Question.find(params[:question_id])
    @answer= Answer.find(params[:id])
    if @answer.update(answer_params)
      redirect_to question_path(@question)
    else
      render :edit
    end
  end


  def destroy
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    @answer.destroy
    flash[:notice] = "Answer successfully deleted."
    redirect_to question_path(@question)
  end

  private
  def answer_params
    params.require(:answer).permit(:body, :user_id, :question_id)
  end

end
