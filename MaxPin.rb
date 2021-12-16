#最大スコアを設定
class MaxPin
  
  def initialize(score,frame, throw_number)
    @score = score
    @frame = frame
    @throw_number = throw_number
  end
  
  MAX_PIN = 10
  def build_max_pins(score, frame, throw_number)
    # 最終フレーム以外(ストライク時は10-10 = 0となるので問題なし)
    return MAX_PIN - score.sum unless @frame == 10
    # 最終フレーム(1-2投目 ※下記はすべて最終フレームが入る)
    return MAX_PIN - score.sum if throw_number < 3
    # 最終フレーム(3投目)
    return MAX_PIN if throw_number == 3
  end
end
