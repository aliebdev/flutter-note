import 'dart:math';

final _random = Random();

extension RandomX on List {
  int get _index => _random.nextInt(length);

  dynamic get randomElement => this[_index];
}
