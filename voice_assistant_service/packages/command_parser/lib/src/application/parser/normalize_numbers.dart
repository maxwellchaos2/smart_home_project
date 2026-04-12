List<String> normalizeNumbers(List<String> words) {
  final numbers = {
    "ноль": 0,
    "один": 1,
    "одна": 1,
    "первый": 1,
    "первую": 1,
    "два": 2,
    "две": 2,
    "второй": 2,
    "вторую": 2,
    "три": 3,
    "третий": 3,
    "третью": 3,
    "четыре": 4,
    "четвертый": 4,
    "четвертую": 4,
    "пять": 5,
    "пятый": 5,
    "пятую": 5,
    "шесть": 6,
    "шестую": 6,
    "семь": 7,
    "седьмую": 7,
    "восемь": 8,
    "восьмую": 8,
    "девять": 9,
    "девятую": 9,
    "десять": 10,
    "десятую": 10,
    "одиннадцать": 11,
    "одиннадцатую": 11,
    "двенадцать": 12,
    "двенадцатую": 12,
    "тринадцать": 13,
    "тринадцатую": 13,
    "четырнадцать": 14,
    "четырнадцатую": 14,
    "пятнадцать": 15,
    "пятнадцатую": 15,
    "шестнадцать": 16,
    "шестнадцатую": 16,
    "семнадцать": 17,
    "семнадцатую": 17,
    "восемнадцать": 18,
    "восемнадцатую": 18,
    "девятнадцать": 19,
    "девятнадцатую": 19,
    "двадцать": 20,
    "тридцать": 30,
    "сорок": 40,
    "пятьдесят": 50,
    "шестьдесят": 60,
    "семьдесят": 70,
    "восемьдесят": 80,
    "девяносто": 90,
    "сто": 100,
  };

  final result = <String>[];
  int buffer = 0;
  bool hasNumber = false;

  for (final word in words) {
    if (int.tryParse(word) != null) {
      // уже число в тексте
      if (hasNumber) {
        result.add(buffer.toString());
        buffer = 0;
        hasNumber = false;
      }
      result.add(word);
    } else if (numbers.containsKey(word)) {
      buffer += numbers[word]!;
      hasNumber = true;
    } else {
      if (hasNumber) {
        result.add(buffer.toString());
        buffer = 0;
        hasNumber = false;
      }
      result.add(word);
    }
  }

  // если в конце остался буфер (например "двадцать пять")
  if (hasNumber) {
    result.add(buffer.toString());
  }

  return result;
}

void main() {
  print(normalizeNumbers("включи устройство двадцать пять".split(" ")));
  // [включи, устройство, 25]

  print(normalizeNumbers("выключи лампу один".split(" ")));
  // [выключи, лампу, 1]

  print(normalizeNumbers("включи лампу 12".split(" ")));
  // [включи, лампу, 12]
}
