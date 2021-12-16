class Bounase
  
  def initialize(frame, scores)
    @frame = frame
    @scores = scores
  end
  
  def build_bounase(frame, scores)
    bounase = 0
    default_bounase_count = 3
    #配列番号
    array_no = frame - 1
    #配列の1つ目
    first_array = 0
    #ストライク時の配列の要素数
    strike_array = 1
  
    # 10フレーム目はボーナスなし
    return bounase if frame >= 10
    # 通常得点
    return bounase if scores[array_no].sum < 10
    # ストライク ⇒ 2を返す
    return bounase = default_bounase_count - strike_array if scores[array_no][first_array] == 10
    # スペア ⇒  1を返す
    return bounase = default_bounase_count - scores[array_no].count if scores[array_no].sum >= 10
  end
end