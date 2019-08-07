# if data shows a 1, all items (left, right, top, and bottom) will change to 1 also

class Image
  # make image accessable 
  attr_accessor :image
  def initialize(image)
    @image = image
  end

  # output what ever @image is equal to 
  def output_image
    image.each do |pix|
      puts pix.join
    end
  end

  def blur(n=2)
    n.times do
      loc_ones = grab_ones
      @image.each_with_index do |row, row_number|
        row.each_with_index do |pix, column_number|
          loc_ones.each do |one_row_num, one_column_num|
            # check if row_number is one_row_num and (&&) if column_number is one_column_num
            if row_number == one_row_num && column_number == one_column_num
               @image[row_number + 1][column_number] = 1 unless row_number == 7
               @image[row_number][column_number - 1] = 1 unless column_number == 0
               @image[row_number - 1][column_number] = 1 unless row_number == 0
               @image[row_number][column_number + 1] = 1 unless column_number == 5
            end
          end
        end
      end
    end
  
    output_image
  end

  # target the ones in the indiv pixels
  def grab_ones
    ones = []

    @image.each_with_index do |row, row_number|
      row.each_with_index do |pix, column_number|
        if pix == 1
           ones << [row_number, column_number]
        end
      end
    end

    ones
  end
end

@image = Image.new([
  [1, 0, 0, 0, 0, 1],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [1, 0, 0, 0, 0, 1]
])

@image.blur