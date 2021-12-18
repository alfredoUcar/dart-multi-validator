import 'package:multi_validator/multi_validator.dart';

void main() {
  final MIN = 10, MAX = 100;

  String? minValidator(int? value) {
    if (value! < MIN) {
      return 'Value should be >= $MIN';
    }
    return null;
  }

  String? maxValidator(int? value) {
    if (value! > MAX) {
      return 'Value should be <= $MAX';
    }
    return null;
  }

  String? oddValidator(int? value) {
    if (!value!.isOdd) {
      return 'Value should be odd';
    }
    return null;
  }

  var oddRangeValidator = MultiValidator<int>([
    minValidator,
    maxValidator,
    oddValidator,
  ]);

  print(
      'Sample: validator composed of min($MIN), max($MAX) and odd validators');
  print('Result of validate value "9": ${oddRangeValidator.validate(9)}');
  print('Result of validate value "101": ${oddRangeValidator.validate(101)}');
  print('Result of validate value "50": ${oddRangeValidator.validate(50)}');
}
