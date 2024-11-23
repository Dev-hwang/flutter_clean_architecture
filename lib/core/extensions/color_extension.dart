import 'dart:ui';

extension ColorExtension on Color {
  bool get isFullyOpaque => (alpha == 255);
}
