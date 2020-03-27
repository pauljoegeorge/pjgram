class VocabulariesController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def index
    @vocabulary = Vocabulary.new
    @vocabularies = Vocabulary.order('id DESC').page params[:page]
    @vocabulary_search = Vocabulary.search(word: params[:word])
  end

  def create
    vocabulary = Vocabulary.new permitted_params(params)
    vocabulary.user_id = current_user.id
    if vocabulary.valid?
      vocabulary.save
      flash[:success] = "Saved successfully !!"
      redirect_to vocabularies_path
    else
      @vocabulary = Vocabulary.new
      @vocabularies = Vocabulary.all.page params[:page]
      flash[:error] = vocabulary.errors.full_messages.to_sentence
      render 'index'
    end
  end

  def show
    @vocabulary = Vocabulary.find(params[:id])
  end

  def edit
    @vocabulary = Vocabulary.find(params[:id])
  end

  def update
    @vocabulary = Vocabulary.find(params[:id])
    if @vocabulary.update permitted_params(params)
      flash[:success] = "Updated successfully !!"
      redirect_to show_word_path(@vocabulary.id)
    end
  end

  def destroy
    vocabulary = Vocabulary.find(params[:id])
    vocabulary.destroy
    flash[:success] = "Deleted successfully !!"
    redirect_to vocabularies_path
  end

  #search by word
  def search_by_word
    @vocabulary = Vocabulary.new
    @vocabulary_search = Vocabulary.search(word: params[:word])
    if params[:word].present?
      @vocabularies = Vocabulary.where(word: params[:word]).page params[:page]
    else
      @vocabularies = Vocabulary.all.page params[:page]
    end
    render :index
  end

  private

  def permitted_params(params)
    params.require(:vocabulary).permit(:word, :meaning, :example)
  end
end
