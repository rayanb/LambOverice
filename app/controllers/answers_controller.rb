class AnswersController < ApplicationController

  def create
    question = Question.find(params[:question_id])
    answer = question.answers.new(content: params[:answer][:content], user_id: session[:user_id])
    if answer.save
      # Ajax
      redirect_to question
    else
      #Ajax
      redirect_to question
    end
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def update
    answer = Answer.find(params[:id])
    question = answer.question
    if answer.update(content: params[:answer][:content])
      redirect_to question
    else
      redirect_to :back
    end
  end

  def delete
    answer = Answer.find(params[:id])
  end

end
