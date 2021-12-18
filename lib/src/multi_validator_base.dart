class MultiValidator<T> {
  List<String? Function(T?)> _validators = [];
  MultiValidator(this._validators);

  void addValidator(String? Function(T?) validator) {
    _validators.add(validator);
  }

  String? validate(T? value) {
    for (var validator in _validators) {
      var error = validator(value);
      if (error != null) {
        return error;
      }
    }

    return null;
  }
}
