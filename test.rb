max_frame = (1..10)
# max_frame = 10
scores = [] 
last_frame = 10

def last_frame?(frame)
  return frame == 10
end

## どうし + 名詞
def build_max_score(score, frame)

  ### 残りのピンのを提出する
    
  ### 初期値
  max_score = 10
  return max_score if score.nil?
    
  # if frame != 10
  unless last_frame?(frame)
    max_score -= score.sum
  end
      
  if last_frame?(frame)
    # break if throw_number == 3 && score.sum < 10 #10フレームの1,2投目までに10点出したとき以外は2投
    # max_score = (throw_number == 3) ? 10 : (10 - score.sum)
    max_score -= score.sum
  end
  return max_score
end

#各フレームの取得点を作成
max_frame.each do |i|
# max_frame.times.each do |i|
  frame = i + 1
  score = []
  max_score = build_max_score(score,frame)
end