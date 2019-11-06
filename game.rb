# Этот код необходим только при использовании русских букв на Windows
if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require_relative 'methods.rb'

regexp_string = get_random_regexp_string

puts "Придумайте как можно больше слов, "\
      "содержащих шаблон '#{regexp_string.gsub('.','*')}'"
puts "Для выхода наберите X"

user_answers = []
# Счетчик правильных слов
count = 0

# цикл повторяется пока пользователь не введет слово
loop do
  # Введенное пользователем слово
  word = STDIN.gets.chomp

  # Если введен 'x' - выход из цикла
  if word.downcase == 'х'
    break
  end

  # Проверка на повторябщееся слово
  unless user_answers.include?(word)
    # Существует ли такое слово ?
    if word_exists?(word)
      # Если слово подходит по условия счетчик +1
      if word =~ /#{regexp_string}/
        puts '..OK =)'
        count +=1
        puts
        # если слово не подходит для заданного условия
      else
        puts '.. не подходит =('
      end
      # Такого слова не существует
    else
      puts "Нет такого слова!"
    end

    # Вносим слово в массив уже использованных
    user_answers << word

  # Если слово уже было введено
  else
    puts "Такое слово уже было введено!"
  end
end

puts "Игра закончена, ваш счет: #{count}"


