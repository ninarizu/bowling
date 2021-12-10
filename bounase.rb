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

class Bounase_score
  def initialize(score,frame, throw_number)
    @score = score
    @frame = frame
    @throw_number = throw_number
  end
  
  def build_bounas_score(frame, scores, bounases)
    bounas_score = 0
    #配列番号
    array_no = frame - 1
    #通常フレーム(1-9フレーム)の最後
    default_frame_end = 9
    #ストライク時の得点
    strike_score = 10
    #1投後
    after_first = 1
    #2投後
    after_second = 2
  
    if bounases[array_no] == 2 #ストライク
      if scores[array_no + after_first][0] == strike_score #次フレームがストライク
        if frame == default_frame_end
          return bounas_score = (strike_score + scores[array_no + after_first][1]) #フレーム10の1,2投げ分がボーナス
        else
          return bounas_score = (strike_score + scores[array_no + after_second][0]) if frame != 10  #2フレーム後までの得点(2フレーム目は1投目分のみ)がボーナス
        end
      else #次フレームがストライク以外
        return bounas_score = (scores[array_no + after_first].sum) #次フレームの2投分がボーナス
      end
    
    elsif bounases[array_no] == 1 #スペア
      return bounas_score = (scores[array_no + after_first][0]) #次フレームの1投分がボーナス
    else #通常
      return bounas_score
    end
  end 
end