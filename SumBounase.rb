#ボーナスの合計
class SumBounase
  
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
