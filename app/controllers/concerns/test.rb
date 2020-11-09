word = "hello"

word_comp = 'l l e h o '

def comparison(word,word_comp) 
	w_split = word.split("")
	wc_split = word_comp.split("")

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

p comparison("hello", 'hellothere')