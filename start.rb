#変数の設定
max_frame = (1..10)
scores = [] 
bounases = []
bounas_scores = []

#各フレームのスコアを作成
require './pin.rb'
max_frame.each do |frame|
  score = []
  #最大投球数
  max_throw_number = (frame == 10) ? (1..3) : (1..2) 
  
  #取得スコア
  pins_class = Pins.new(frame,score,max_throw_number)
  score = pins_class.build_get_pins(frame,score,max_throw_number)
  scores.push(score)
end 
pp "スコア#{scores}"

#各フレームのボーナス得点
require './bounase.rb'
max_frame.each do |frame|
  # 各フレームのボーナス判定(0: 通常、1:スペア、 2:ストライク)
  bounase_class = Bounase.new(frame, scores)
  bounase = bounase_class.build_bounase(frame, scores)
  bounases.push(bounase)
  
  # 判定をもとにボーナス点を設定
  bounase_score_class = Bounase_score.new(frame, scores, bounases)
  bounase_score = bounase_score_class.build_bounas_score(frame, scores, bounases)
  bounas_scores.push(bounase_score)
end
# pp "ボーナス判定#{bounases}"
pp "ボーナス得点#{bounas_scores}"

#スコア合計点
require './sum_score.rb'
sum_score_class = Sum_score.new(scores)
sum_score = sum_score_class.build_sum_score(scores)
#ボーナス合計点
sum_bounas_class = Sum_bounas.new(bounas_scores)
sum_bonaus = sum_bounas_class.build_sum_bounas(bounas_scores)

#全合計点
all_score = sum_score + sum_bonaus
pp "合計点#{all_score}"