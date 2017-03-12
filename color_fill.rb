
#Assuming image bitmap with x , y cordinates
  bitmap = [
      [1,1,1,1,1,1,1,1,1,1],
      [1,0,0,0,0,0,0,0,0,1],
      [1,0,0,0,0,0,0,0,0,1],
      [1,0,0,0,0,0,0,0,0,1],
      [1,0,0,0,0,0,0,0,0,1],
      [1,0,0,0,0,0,0,0,0,1],
      [1,0,0,0,0,0,0,0,0,1],
      [1,1,1,1,1,1,1,1,1,1],
  ]


#@param[2D array] image 2D array
#@param[Integer] x cordinate
#@param[Integer] y cordinate of location
#@param[Integer] target_color
#@param[Integer] replacement_color

#@return[2D array] array with replaced color

#Recursive function to replace color
def fill(bitmap, x, y, target_color, replacement_color)
  return unless bitmap[y][x] # valid point?

  return if bitmap[y][x] != target_color
  return if bitmap[y][x] == replacement_color


  bitmap[y][x] = replacement_color
  fill(bitmap, x+1, y, target_color, replacement_color)
  fill(bitmap, x-1, y, target_color, replacement_color)
  if(y!=bitmap.length-1)
    fill(bitmap, x, y+1, target_color, replacement_color)
  end
  if(y!=0)
    fill(bitmap, x, y-1, target_color, replacement_color)
  end
  bitmap
end

# Test cases without using any Ruby library for test cases i.e rspecs

#Bitmap before replacing color
# bitmap = [
#     [1,1,1,1,1,1,1,1,1,1],
#     [1,0,0,0,0,0,0,0,0,1],
#     [1,0,0,0,0,0,0,0,0,1],
#     [1,0,0,0,0,0,0,0,0,1],
#     [1,0,0,0,0,0,0,0,0,1],
#     [1,0,0,0,0,0,0,0,0,1],
#     [1,0,0,0,0,0,0,0,0,1],
#     [1,1,1,1,1,1,1,1,1,1],
# ]

#Test 1 : Replace 0 color in Bitmao with color 2
bb = fill(bitmap, 1,1,0,2)
if bb == [[1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
       [1, 2, 2, 2, 2, 2, 2, 2, 2, 1],
       [1, 2, 2, 2, 2, 2, 2, 2, 2, 1],
       [1, 2, 2, 2, 2, 2, 2, 2, 2, 1],
       [1, 2, 2, 2, 2, 2, 2, 2, 2, 1],
       [1, 2, 2, 2, 2, 2, 2, 2, 2, 1],
       [1, 2, 2, 2, 2, 2, 2, 2, 2, 1],
       [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]]
  puts "test1 passed color 0 replaced with color 2"
else
  puts "test1 failed"
end

#Test 2 : Replace 1 color in Bitmap with color 4
bb = fill(bitmap, 0,0,1,4)
if bb == [[4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
       [4, 2, 2, 2, 2, 2, 2, 2, 2, 4],
       [4, 2, 2, 2, 2, 2, 2, 2, 2, 4],
       [4, 2, 2, 2, 2, 2, 2, 2, 2, 4],
       [4, 2, 2, 2, 2, 2, 2, 2, 2, 4],
       [4, 2, 2, 2, 2, 2, 2, 2, 2, 4],
       [4, 2, 2, 2, 2, 2, 2, 2, 2, 4],
       [4, 4, 4, 4, 4, 4, 4, 4, 4, 4]]
  puts "test2 passed color 1 replaced with color 4"
else
  puts "test2 failed"
end
