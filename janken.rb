class Player
  def hand
    puts "数字を入力してください"
    puts "0:グー, 1:チョキ, 2:パー"
    possible_hands = ['0', '1', '2']
    input_hand = gets.chomp.to_s

    if possible_hands.include?(input_hand)
      return input_hand.to_i
    else
      puts "無効な入力です"
    end

    until false
      if  possible_hands.include?(input_hand)
        return input_hand.to_i
      else
        puts "もう一度数字を入力してください。"
        puts "0:グー, 1:チョキ, 2:パー"
        input_hand = gets.chomp.to_s
      end
    end
  end
end


class Enemy
  def hand
    rand(0..3)
  end
end


class Janken
  def pon(player_hand, enemy_hand)
    janken = ["グー", "チョキ", "パー"]
    puts "相手の手は#{janken[enemy_hand]}です"

    game_result = (player_hand + 3) % 3

    case game_result
    when 0
      puts "あいこです"
      true
    when 1
      puts "あなたの負けです"
      false
    when 2
      puts "あなたの勝ちです"
      false
    else
      puts "エラー: 予期せぬ結果です"
      false
    end
  end
end


player = Player.new

enemy = Enemy.new

janken = Janken.new

next_game = true

while next_game
  next_game = janken.pon(player.hand, enemy.hand)
end
