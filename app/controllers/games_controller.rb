require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    array = ('a'..'z').to_a
    new_array = []
    array.each_with_index do |letter, index|
      if index < 10
        new_array << array[rand(1...array.length)]
        index += 1
      end
    end
    @letters = new_array
  end

  def score
    letters_generated = params[:letters]
    word_input = params[:word]
    word_serialized = open("https://wagon-dictionary.herokuapp.com/#{word_input}").read
    word_api = JSON.parse(word_serialized)
    @score = word_api  
    @letters_generated = letters_generated
    @compared = comparison(word_input, letters_generated)
  end

  def comparison(word, letters)
    w_split = word.split('')
    wc_split = letters.split(' ')
    new_array = []
    w_split.each do |letter|
      if wc_split.include?(letter)
        new_array << letter
      end
    end
    if new_array == w_split
      true
     else
     	false
    end
  end
end
