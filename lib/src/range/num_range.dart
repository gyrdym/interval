import 'package:xrange/src/range/range.dart';

class NumRange extends Range<num> {
  NumRange(
      {required num lower,
      required num upper,
      bool lowerClosed = false,
      bool upperClosed = false})
      : super(
            lower: lower,
            upper: upper,
            lowerClosed: lowerClosed,
            upperClosed: upperClosed);

  NumRange.open(num lower, num upper) : super.open(lower, upper);

  NumRange.closed(num lower, num upper) : super.closed(lower, upper);

  NumRange.openClosed(num lower, num upper) : super.openClosed(lower, upper);

  NumRange.closedOpen(num lower, num upper) : super.closedOpen(lower, upper);

  NumRange.atLeast(num lower) : super.atLeast(lower);

  NumRange.atMost(num upper) : super.atMost(upper);

  NumRange.greaterThan(num lower) : super.greaterThan(lower);

  NumRange.lessThan(num upper) : super.lessThan(upper);

  NumRange.all() : super.all();

  NumRange.singleton(num value) : super.singleton(value);

  int? get firstValue {
    final l = lower;
    if (l == null) {
      return null;
    }
    return (lowerClosed ? l : l + 1).toInt();
  }

  int? get lastValue {
    final u = upper;
    if (u == null) {
      return null;
    }
    return (upperClosed ? u : u - 1).toInt();
  }

  Iterable<num> values({int step = 1}) sync* {
    if (step <= 0) {
      throw ArgumentError.value(step, 'A step should be greater than 0');
    }
    final f = firstValue;
    final l = lastValue;
    if (!bounded || l == null || f == null) {
      throw Exception('There is no bound, '
          '${lower == null ? '`lower`' : '`upper`'} is not defined');
    }
    for (var val = f; val <= l; val += step) {
      yield val;
    }
  }
}
