require 'net/http'

# Создание паттерна (условия игры)
def get_random_regexp_string
  patterns = ['торф', 'мотор', 'крыша', 'труба', 'крик']

  # Выбираем 1 случайный элемент массива
  pattern = patterns.sample

  # .split - разбивает слово по буквам ,а в втрибуте указываем,
  # что между буквами не должно быть пробела. Выбираем 1 случайную букву
  letter = pattern.split('').sample

  # Заменяем выбранную букву letter на *
  # и возвращаем паттерн
  return pattern.gsub(letter, '.')

end

# Есть ли такое слово на вики словаре?
def word_exists?(word)
  # создаем url чтобы проверить наше слово
  url = "https://ru.wiktionary.org/wiki/#{word}"

  # отправляем завпрос и получаем ответ  в виде страницы сайта
  wiktionary_page = Net::HTTP.get(URI.parse(URI.encode(url))).force_encoding('UTF-8')

  if wiktionary_page =~ /В настоящий момент текст на данной странице отсутствует./
    return false
  else
    return true
  end

end