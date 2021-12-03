max_frame = (1..10)
scores = [] 
bounases = []
bounas_score = []

## メソッド名: 動詞 + 名詞
def last_frame?(frame)
  return frame == 10
end

#最大投球数を設定
def build_max_throw_no(frame)
  return (frame == 10) ? (1..3) : (1..2) 
  
end

#最大スコアを設定
def build_max_pins(score, frame, throw_number)

  ### 残りのピンのを提出する
  max_pins = 10
  #ストライク時の得点
  strike_score = 10
 
  # if frame != 10
  unless last_frame?(frame)
    if throw_number == 1 && score.sum == strike_score
      return max_pins = 0
    else
      return max_pins -= score.sum  
    end
  end
      
  if last_frame?(frame) #フレーム10の対応
    # break if throw_number == 3 && score.sum < 10 #10フレームの1,2投目までに10点出したとき以外は2投
    # max_pins = (throw_number == 3) ? 10 : (10 - score.sum)
    # max_pins -= score.sum
    if throw_number == 3 && score.sum < max_pins
      return max_pins = 0
    elsif throw_number < 3
      return max_pins = (max_pins - score.sum)
    end
  end
  
  return max_pins if score.nil?  
  
end

#取得スコアを設定
# def build_get_pins(frame,score,max_throw_number)
  
#   max_throw_number.each do |throw_number|  
#     # throw_number = j #投球
#     max_pins = build_max_pins(score, frame, throw_number) == nil ? 0 : build_max_pins(score, frame, throw_number)
#     # max_pins = build_max_pins(score, frame, throw_number)
#     #倒したピンの本数
#     pin = rand(0..max_pins)
#     # pin = 10
    
#     score.push(pin)
#   end
  
#   return score 
# end

class Pins
  
  # インスタンス作成の時に実行される
  def initialize(frame, score, max_throw_number)
    # インスタンス変数には@をつける
    @frame = frame
    @score = score
    @max_throw_number = max_throw_number
  end
  
  def build_get_pins
    @max_throw_number.each do |throw_number|  
      max_pins = build_max_pins(@score, @frame, throw_number) == nil ? 0 : build_max_pins(@score, @frame, throw_number)
      #倒したピンの本数
      pin = rand(0..max_pins)
      # pin = 10
      @score.push(pin)
      # return pin
    end
    # p @score
    return @score
  end
end

#スコアの合計
def build_sum_score(scores)
  sum_score = 0 #合計値
  
  #scoreを足す
  scores.each do |n|
    # pp n
    sum_score += n.sum
    # pp "各フレームの得点#{n.sum}"
  end
  
  return sum_score
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
  # p scores
  # p array_no
  # p scores[0]
  # p scores[array_no]
  
  # 10フレーム目はボーナスなし
  return bounase if frame >= 10
  # 通常得点
  return bounase if scores[array_no].sum < 10
  # ストライク ⇒ 2を返す
  return bounase = default_bounase_count - strike_array if scores[array_no][first_array] == 10
  # スペア ⇒  1を返す
  return bounase = default_bounase_count - scores[array_no].count if scores[array_no].sum >= 10
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

#ボーナスの合計
def build_sum_bounas(bounas_score)
  sum_bounas = 0 #合計値
  
  #scoreを足す
  bounas_score.each do |y|
    # pp y
    sum_bounas += y
  end
  
  return sum_bounas
end

#各フレームのスコアを作成
max_frame.each do |frame|
  # frame = i
  score = []
  #最大投球数
  max_throw_number =  build_max_throw_no(frame)
  #取得スコア
  # Pinsという型（クラス）の値をnewで作成し変数scoreへ代入
  pins = Pins.new(frame,score,max_throw_number)
  # p score
  # score = pins.build_get_pins(frame,score,max_throw_number)
  score = pins.build_get_pins
  scores.push(score)
  
end 
pp "スコア#{scores}"

# #各フレームのボーナス得点
max_frame.each do |frame|
  
  # 各フレームのボーナス判定(0: 通常、1:スペア、 2:ストライク)
  bounases.push(build_bounase(frame, scores))
  # 判定をもとにボーナス点を設定
  bounas_score.push(build_bounas_score(frame, scores, bounases))
end
# pp "ボーナス判定#{bounases}"
pp "ボーナス得点#{bounas_score}"

#スコア合計点
sum_score = build_sum_score(scores)
# pp "テスト#{sum_score}"

#ボーナス合計点
sum_bonaus = build_sum_bounas(bounas_score)
# pp "テスト#{sum_bonaus}"

#全合計点
all_score = sum_score + sum_bonaus
pp "合計点#{all_score}"



