# 韵母列表 24 个
yun_mu=['a', 'o', 'e', 'i', 'u', 'v', 'ai ', 'ei', ' ui ', 'ao', ' ou',
        ' iu ', 'ie ', 've', ' er', ' an ', 'en ', 'in', ' un ', 'vn ', 'ang ', 'eng', ' ing ', 'ong']

# 不存在的组合,随机组合的时候需要剔除这种下面的可能性 TODO 应该直接找存在的组合
illegal_composite= {
    :b => %w(e v ou ong er iu ia iang iong ui un vn ua uai uan uang uo ve),
    :p => %w(e v ong er iu ia iang iong ui un vn ua uai uan uang uo ve),
    :m => %w(v ong er ia iang iong ui un vn ua uai uan uang uo ve),
    :f => %w(e i v ai ao ong er iu ie in ing ia iao ian iang iong ui un vn ua uai uan uang uo ve),
    :d => %w(o v er in iang iong ua uai uang ve),
    :t => %w(o v er en iu in ia iang iong ua uai uang ve),
    :n => %w(o v er ia iong ui ua uai uang),
    :l => %w(o v er en iong ui ua uai uang),
    :g => %w(o i v er iu ie in ing ia iao ian iang iong ve),
    :k => %w(o i v er iu ie in ing ia iao ian iang iong ve),
    :h => %w(o i v er iu ie in ing ia iao ian iang iong ve),
    :j => %w(a o e u ai ao an ang ou ong ei er en eng ui ua uai uang uo),
    :q => %w(a o e u ai ao an ang ou ong ei er en eng ui ua uai uang uo),
    :x => %w(a o e u ai ao an ang ou ong ei er en eng ui ua uai uang uo),
    :z => %w(o v er iu ie in ing ia iao ian iang iong ua uai uang ve),
    :c => %w(o v er iu ie in ing ia iao ian iang iong ua uai uang ve),
    :s => %w(o v ei er iu ie in ing ia iao ian iang iong ua uai uang ve),
    :zh => %w(o v er iu ie in ing ia iao ian iang iong ve),
    :ch => %w(o v ei er iu ie in ing ia iao ian iang iong ve),
    :sh => %w(o v ong er iu ie in ing ia iao ian iang iong ve),
    :r => %w(a o v ai ei er iu ie in ing ia iao ian iang iong uai uang ve),
    :y => %w(u ai ei er en eng iu ie ia iao ian iang iong ui un vn ua uai uang uo),
    :w => %w(e i v ao ou ong er iu ie in ing ia iao ian iang iong ui un vn ua uai uan uang uo ve),
}

result =''
illegal_composite.each { |key, value|
  str = ":#{key.upcase} => %w("
  yun_mu.each { |yun|
    yun = yun.strip
    unless value.include? yun
      str<<"#{yun} "
    end
  }
  str<<"),\n"
  result<<str
}

puts result










