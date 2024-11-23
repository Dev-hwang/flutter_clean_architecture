import 'dart:ui';
import 'dart:math' as math;

extension OffsetExtension on Offset {
  Offset subtractTo(Offset other) {
    return other - this;
  }

  double distanceTo(Offset other) {
    final Offset len = subtractTo(other);
    return math.sqrt(len.dx * len.dx + len.dy * len.dy);
  }

  double directionTo(Offset other) {
    final Offset len = subtractTo(other);
    return math.atan2(len.dy, len.dx);
  }

  double angleTo(Offset other) {
    double angle = directionTo(other) * (180 / math.pi);
    if (angle.isNegative) {
      angle += 360;
    }
    return angle;
  }
}
