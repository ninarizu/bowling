#最大スコアを設定
class MaxPin
  
  def initialize(score,frame, throw_number)
    @score = score
    @frame = frame
    @throw_number = throw_number
  end
  
  def last_frame?
    frame == 10
  end
  
  def build_max_pins(score, frame, throw_number)
    max_pins = 10
    #ストライク時の得点
    strike_score = 10
 
    unless last_frame?(frame)
      if throw_number == 1 && score.sum == strike_score
        return max_pins = 0
      else
        return max_pins -= score.sum
      end
    end
      
    if last_frame?(frame) #フレーム10の対応
      if throw_number == 3 && score.sum < max_pins
        return max_pins = 0
      elsif throw_number == 3 && score.sum == max_pins
        return max_pins = 10
      elsif throw_number < 3
        return max_pins = (max_pins - score.sum)
      end
    end
    
    return max_pins if score.nil?  
  end
end

class Pins
  def initialize(frame, score, max_throw_number)
    # インスタンス変数には@をつける
    @frame = frame
    @score = score
    @max_throw_number = max_throw_number
  end
  
  def build_get_pins(frame, score, max_throw_number)
    
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