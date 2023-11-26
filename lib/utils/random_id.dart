import 'dart:math';

String generateRandomLetters(int length) {
  const letters = 'abcdefghijklmnopqrstuvwxyz';
  final random = Random();
  return List.generate(
      length, (index) => letters[random.nextInt(letters.length)]).join();
}

String generateRandomUsername() {
  return 'User${generateRandomLetters(5)}';
}
