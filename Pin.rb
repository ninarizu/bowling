class Pin
  
  def initialize(frame, score, max_throw_number)
    # インスタンス変数には@をつける
    @frame = frame
    @score = score
    @max_throw_number = max_throw_number
  end
  
  def build_get_pins(frame, score, max_throw_number)
    
    require './MaxPin.rb'
    max_throw_number.each do |throw_number| 
      
      max_pin = MaxPin.new(score, frame, throw_number)
      max_get_pin = max_pin.build_max_pins(score, frame, throw_number)
      max_pins = max_get_pin == nil ? 0 : max_get_pin
      pin = rand(0..max_pins) #倒したピンの本数
      # pin = 10
      break if throw_number == 3 && score.sum < 10 && frame == 10
      score.push(pin)
      break if throw_number == 1 && pin == 10 && frame != 10
    end
    return score
  end
end