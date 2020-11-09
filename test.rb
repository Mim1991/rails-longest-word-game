array = ('a'..'z').to_a

rand(1..array.length)

new_array = []
array.each_with_index do |letter, index|
  if index < 10	
  new_array << array[rand(1...array.length)]
  index += 1
end
end

p new_array