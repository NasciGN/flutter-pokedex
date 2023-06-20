String formatString(String name) {
  String cleanString = name.replaceAll(RegExp(r'[^a-zA-Z0-9]+'), ' ');

  List<String> words = cleanString.split(' ');

  String formattedString = words.map((word) {
    if (word.isNotEmpty) {
      return word[0].toUpperCase() + word.substring(1);
    }
    return '';
  }).join(' ');

  return formattedString;
}

String formatNumber(String numberString) {
  while (numberString.length < 3) {
    numberString = '0$numberString';
  }
  return '#$numberString';
}
