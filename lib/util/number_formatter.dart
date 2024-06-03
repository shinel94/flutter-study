String formatLikeCountInteger(int number) {
  if (number > 10000) {
    int prime = number ~/ 10000;
    if (prime > 10) {
      return "$prime만";
    }
    return "${(number / 10000).toStringAsFixed(1)}만";
  }
  return "${(number / 1000).toStringAsFixed(1)}천";
}

String formatIntToMinSeconds(int number) {
  return "${(number / 60).toInt()}:${(number % 60).toString().padLeft(2, '0')}";
}
