class AnswersController < ApplicationController
  def new
  end

  def create
    @current_user = User.find_by(id: current_user.id)
    @question = Question.find(params[:question_id])
    @question_answer = @question.answers.new(answer_params)
    @question_answer.user = @current_user
    @question_answer.save!
    # @user_answer = @current_user.answers.create!(answer_params)
    redirect_to question_path(@question)
  end

  # def show
  #   @question = Question.find(params[:question_id])
  #   @all_answers = @question.answers
  #   p "*" * 90
  #   p @all_answers
  #   @current_user = User.find_by(id: current_user.id)
  #   @user_answers = @current_user.answers
  #   redirect_to question_path(@question)
  # end

  private
    def answer_params
      params.require(:answer).permit(:description)
    end

  # def destroy
  #   @answer = Answer.find(params[:id])
  #   @answer.destroy
  #   redirect_to @answer
  # end

end
