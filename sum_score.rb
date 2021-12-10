class Sum_score
  def initialize(scores)
    @scores = scores
  end
  
  #スコアの合計
  def build_sum_score(scores)
    sum_score = 0 #合計値
    
    scores.each do |n|
      sum_score += n.sum
    end
    return sum_score
  end
end

#ボーナスの合計
class Sum_bounas
  def initialize(bounas_score)
    @bounas_score = bounas_score
  end

  def build_sum_bounas(bounas_score)
    sum_bounas = 0 #合計値
  
    bounas_score.each do |y|
      sum_bounas += y
    end
    return sum_bounas
  end
end
