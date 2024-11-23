import 'package:flutter/widgets.dart';

import '../../localization.dart';

extension StringExtension on String {
  String tr(BuildContext context) =>
      AppLocalization.of(context)?.translate(this) ?? this;

  String remove(Pattern pattern) => replaceAll(pattern, '');

  String removeWhiteSpace() => remove(RegExp(r"\s"));
}
