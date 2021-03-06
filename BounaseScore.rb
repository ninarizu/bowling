class BounaseScore
  
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