import 'package:multi_validator/multi_validator.dart';
import 'package:test/test.dart';

void main() {
  group('validate()', () {
    var validatorA, validatorB;
    final noErrorValidator = (String? value) => null;

    setUp(() {
      validatorA = (String? value) {
        return 'error validating A';
      };

      validatorB = (String? value) {
        return 'error validating B';
      };
    });

    test('Returns error from first validator if fails', () {
      final validator = MultiValidator<String>([
        validatorA,
        validatorB,
      ]);

      expect(validator.validate('test'), 'error validating A');
    });

    test('Returns error from next validator if previous one succeed', () {
      validatorA = noErrorValidator;

      final validator = MultiValidator<String>([
        validatorA,
        validatorB,
      ]);

      expect(validator.validate('test'), 'error validating B');
    });

    test('Returns null if all validators succeed', () {
      validatorA = noErrorValidator;
      validatorB = noErrorValidator;

      final validator = MultiValidator<String>([
        validatorA,
        validatorB,
      ]);

      expect(validator.validate('test'), null);
    });
  });
}
