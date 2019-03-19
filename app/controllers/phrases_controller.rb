class PhrasesController < ApplicationController

  before_action :set_phrase, only: [:show, :edit, :update, :destroy]

  def index
    @phrases = Phrase.all
  end

  def show
  end

  def new
    @phrase = Phrase.new
    @first_placeholder = LiterateRandomizer.word
    @second_placeholder = LiterateRandomizer.word
  end

  def create
    @phrase = Phrase.create(phrase_params)
    redirect_to phrases_path
    @phrase.save!
  end

  def edit
  end

  def update
    @phrase.update(phrase_params)
    redirect_to phrase_path(@phrase)
  end

  def destroy
    @phrase.destroy
    redirect_to phrases_path
  end

  def random
    # @phrase = Phrase.order('RANDOM()').first
    @phrase = Phrase.all.sample
  end

  private

  def phrase_params
    params.require(:phrase).permit(:first_word, :second_word, :color)
  end

  def set_phrase
    @phrase = Phrase.find(params[:id])
  end
end
