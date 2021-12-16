class SumScore
  
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