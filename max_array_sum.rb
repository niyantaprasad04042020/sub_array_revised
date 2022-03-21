class ValidateArray

  def initialize(array:)
    @array = array
  end

  def check_for_valid_array
    if @array.flatten.uniq.all?{|i| i.is_a?(Integer)}
      return @array
    else
      return "Please Input Array of Integers!"
      exit
    end
  end

end

class FindMinMaxIndex

  def initialize(valid_array:)
    @valid_array = valid_array
  end

  def min_max_index
    max_index     = 0
    min_index     = 0
    max_sum       = 0
    min_max_index = []

    for i in 0..@valid_array.length() - 1
      array_sum = 0
      for j in i..@valid_array.length() - 1
        array_sum   = @valid_array[j] + array_sum
        if array_sum > max_sum
          max_sum   = array_sum
          min_index = i
          max_index = j
        end
      end
    end

    min_max_index << min_index
    min_max_index << max_index
    return min_max_index
  end 
end

class MaxArraySum

  def initialize(array)
    @array = array
  end

  def sub_array
    
    @valid_array   = validate_array.check_for_valid_array()

    @min_max_index = find_min_max_index.min_max_index()

    sub_array      = []  
      
    for i in @min_max_index[0]..@min_max_index[1]
      sub_array << @valid_array[i]
    end
  
    puts sub_array

  end

  private

  def validate_array
    @validate_array = ValidateArray.new(array: @array)
  end

  def find_min_max_index
    @find_min_max_index = FindMinMaxIndex.new(valid_array: @valid_array)
  end

end

arr_object = MaxArraySum.new([1,0,2,-3,1,2,1])
puts arr_object.sub_array