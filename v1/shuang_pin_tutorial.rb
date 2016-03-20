# 声母列表 23 个 + 一个特殊的声母 o 用来输入单音节的韵母字
sheng_mu = ['b', 'p', 'm', 'f', 'd', 't', 'n', 'l', 'g', 'k', 'h', 'j', 'q',
            'x', 'zh', 'ch', 'sh', 'z', 'c', 's ', ' y', 'w', 'r', 'o']
# 韵母列表 24 个
# yun_mu=['a', 'o', 'e', 'i', 'u', 'v', 'ai ', 'ei', ' ui ', 'ao', ' ou',
#         ' iu ', 'ie ', 've', ' er', ' an ', 'en ', 'in', ' un ', 'vn ', 'ang ', 'eng', ' ing ', 'ong']

# 声母对应合法的韵母组合
legal_composite= {
    :B => %w(a o i u ai ei ao ie an en in ang eng ing ),
    :P => %w(a o i u ai ei ao ou ie an en in ang eng ing ),
    :M => %w(a o e i u ai ei ao ou iu ie an en in ang eng ing ),
    :F => %w(a o u ei ou an en ang eng ),
    :D => %w(a e i u ai ei ui ao ou iu ie an en un vn ang eng ing ong ),
    :T => %w(a e i u ai ei ui ao ou ie an un vn ang eng ing ong ),
    :N => %w(a e i u ai ei ao ou iu ie ve an en in un vn ang eng ing ong ),
    :L => %w(a e i u ai ei ao ou iu ie ve an in un vn ang eng ing ong ),
    :G => %w(a e u ai ei ui ao ou an en un vn ang eng ong ),
    :K => %w(a e u ai ei ui ao ou an en un vn ang eng ong ),
    :H => %w(a e u ai ei ui ao ou an en un vn ang eng ong ),
    :J => %w(i v iu ie ve in un vn ing ),
    :Q => %w(i v iu ie ve in un vn ing ),
    :X => %w(i v iu ie ve in un vn ing ),
    :Z => %w(a e i u ai ei ui ao ou an en un vn ang eng ong ),
    :C => %w(a e i u ai ei ui ao ou an en un vn ang eng ong ),
    :S => %w(a e i u ai ui ao ou an en un vn ang eng ong ),
    :ZH => %w(a e i u ai ei ui ao ou an en un vn ang eng ong ),
    :CH => %w(a e i u ai ui ao ou an en un vn ang eng ong ),
    :SH => %w(a e i u ai ei ui ao ou an en un vn ang eng ),
    :R => %w(e i u ui ao ou an en un vn ang eng ong ),
    :Y => %w(a o e i v ao ou ve an in ang ing ong ),
    :W => %w(a o u ai ei an en ang eng ),
    :O => %w(a o e an ao ai ei)
}


# 每个按键对应的双拼表
valid_composite={
    :Q => %w(q, iu),
    :W => %w(w ia ua),
    :E => %w(e),
    :R => %w(r uan er),
    :T => %w(t ue),
    :Y => %w(y uai v),
    :U => %w(u sh),
    :I => %w(i ch),
    :O => %w(o uo),
    :P => %w(p un),
    :A => %w(a),
    :S => %w(s ong iong),
    :D => %w(d ang iang),
    :F => %w(f en),
    :G => %w(g eng),
    :H => %w(h ang),
    :J => %w(j an),
    :K => %w(k ao),
    :L => %w(l ai),
    ';' => %w(ing),
    :Z => %w(z ei),
    :X => %w(x ie),
    :C => %w(c iao),
    :V => %w(zh ve ui),
    :B => %w(b ou),
    :N => %w(n in),
    :M => %w(m ian),
}


# TODO 解决类似“安”的 an 单读音的情况,单读音比如 an的输入要使用 输入oan

# 随机组合
result = ''
5.times do
  sheng =sheng_mu.sample
  yun = legal_composite[sheng.strip.upcase.to_sym].sample
  if sheng =='o'
    result<<" #{yun.strip} "
  else
    result<<" #{sheng.strip}#{yun.strip} "
  end
end

puts "请输入下面对应双拼规则 使用空格隔开\n#{result}"

# 错误的字
incorrect ={}


input_answer = gets
input_answer.split.each_with_index { |input_keys, index|

  if input_keys.length!=2
    incorrect["#{index+1}.#{input_keys}"] = '双拼只能由两个字母组合而成!'
    next
  end

  answers=[]
  catch :for_loop do
    # 根据输入的组合找出对应双拼数组
    input_keys.split(//).each { |k|
      k=k.strip
      if k==';'
        answer=valid_composite[k]
      else
        answer=valid_composite[k.upcase.to_sym]
      end
      answers<<answer
    }

    # 根据得到的双拼二维数组看能不能得到对应值
    an1 = answers[0]
    an2 = answers[1]
    res = result.split[index]
    an1.each { |a1|
      an2.each { |a2|
        if (a1+a2)==res
          throw :for_loop
          break
        end
      }
    }
    # TODO 给出正确答案
    incorrect["#{index+1}.#{input_keys}"] = "不能得到 #{res} 哦!"
  end
}

if incorrect.length == 0
  puts '恭喜你全对耶!'
else
  incorrect.each { |key, value|
    puts "#{key} 错误 => #{value}"
  }
end

if input_answer.split.length<result.split.length
  puts '你好像有几个没有写完哦!'
end


