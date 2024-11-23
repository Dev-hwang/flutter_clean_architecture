extension StringExtension on String {
  String remove(Pattern pattern) => replaceAll(pattern, '');

  String removeWhiteSpace() => remove(RegExp(r"\s"));
}
