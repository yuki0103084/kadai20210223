S = gets.to_i  # ビンゴカードのサイズ


bingo_card = Array.new(S){ gets.split }  # ワードをスペース区切りでS行入力してビンゴカードとする
word_list  = bingo_card.flatten  # ビンゴカードの配列を平坦化しワードリストとする


N = gets.to_i  # 選ばれた単語の数
hit_words = Array.new(N){ gets.chomp }  # ワードをN行入力し当選ワードとする

hit_list = Array.new(S*S)  # S×Sマスの配列を当選ワードリストとする
hit_words.each do |hit|  # 当選ワードを一つずつ当選（hit)に紐づける
  if ij = word_list.find_index(hit)  # もし当たりがワードリストの何番目にあるか、それをi行目、j列目とするならば
    hit_list[ij] = true  # そのi行目、j列目を当選ワードリストとする。
  end
end

hit_card = hit_list.each_slice(S).to_a  # 当選ワードリストから取り出された当選ワードを当選カードとする


naname1 = Array.new(S){|i| hit_card[i][i] }.all?  # 右下がりななめビンゴ すべてのカードが当選カードならば
naname2 = Array.new(S){|i| hit_card[i][-i-1] }.all?  # 右上がりななめビンゴ

yoko = hit_card.any?(&:all?)  # 横ビンゴ

tate = hit_card.transpose.any?(&:all?)  # 縦ビンゴ 行と列の入れ換え すべてのカードが当選カードならば


if yoko || tate || naname1 || naname2
  puts "yes"
else
  puts "no"
end