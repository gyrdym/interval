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
    if (lower == null) {
      return null;
    }
    return (lowerClosed ? lower! : lower! + 1).toInt();
  }

  int? get lastValue {
    if (upper == null) {
      return null;
    }
    return (upperClosed ? upper! : upper! - 1).toInt();
  }

  Iterable<num> values({int step = 1}) sync* {
    if (step <= 0) {
      throw ArgumentError.value(step, 'A step should be greater than 0');
    }
    if (lastValue == null || firstValue == null) {
      final message = [
        if (lower == null) 'lower bound is undefined',
        if (upper == null) 'upper bound is undefined',
      ].join(',');
      throw Exception('The range is unbound: $message');
    }
    for (var val = firstValue!; val <= lastValue!; val += step) {
      yield val;
    }
  }
}
