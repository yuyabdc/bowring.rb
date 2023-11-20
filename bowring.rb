frames = Array. new(10) {Array.new(2)}

score = 0
frames.each_with_index do |frame, index|
    frame_score = frame.sum
    if frame_score == 10 && frame.size == 1 #ストライク
        next_frame = frames[index + 1]
        frame_score += next_frame.sum
        frame_score += frames[index + 2].first if next_frame.size == 1
    elsif frame_score == 10 #スペア
        frame_score += frames[index + 1].first
    end
    score += frame_score
end

def strike_or_spare_bonus(frame, next_frame, after_next_frame)
    if strike?(frame) #ストライク
        bonus = next_frame.sum
        bonus = after_next_frame.first if next_frame.sum = 10
    elsif apare?(frame) #スペア
        bonus = next_frame.first
    else
        bonus = 0
    end
    bonus
end

def strike?(frame)
    frame.first == 10
end

def spare?(frame)
    frame.sum == 10 && !strike?(frame)
end

def game_over?(frames)
    frames.size == 10
end

def winner?(players)
    players.max_by {|player| player[:score]}
end

def throw_ball
    pins = rand(11)
    if pins < 0 || pins > 10
        raise "ピンの数が不正です"
    end
    pins
end

10.times do
    frame = []
    2.times do
        pins = throw_ball
        frame << pins
        break if pins == 10  #ストライクの場合は次の投球をスキップ
    end
    frames << frame
end

while !game_over?(frames)
  players.each do |player|
    frame = []
    2.times do
      pins = throw_ball
      frame << pins
      break if pins

 == 10
    end
    player[:frames] << frame
    player[:score] = calculate_score(player[:frames])
  end
end

winner = winner(players)
puts "#{winner[:name]}が勝者です。最終スコア：#{winner[:score]}"
