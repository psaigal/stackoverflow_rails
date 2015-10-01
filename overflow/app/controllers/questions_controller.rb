class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    @current_user = User.find_by(id: current_user.id)
  end

  def show
    @question = Question.find(params[:id])
    @all_answers = @question.answers
  end

  def new
    @question = Question.new
  end

  def create
    @current_user = User.find_by(id: current_user.id)
    @question = @current_user.questions.new(question_params)

    if @question.save
      redirect_to @question
    else
      render 'new'
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to @question
  end

  private
  def question_params
    params.require(:question).permit(:title, :description)
  end
end
