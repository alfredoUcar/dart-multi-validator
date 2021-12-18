Chain multiple validators and run together as one.

## Usage

Declaring validators in constructor 

```dart
var customValidator = MultiValidator<int>([
    firstValidator,
    secondValidator,
    // ...aditional validators
  ]);
```

Adding with `addValidator` method

```dart
var customValidator = MultiValidator<int>();
customValidator.addValidator(firstValidator);
customValidator.addValidator(secondValidator);
```

## Additional information

A simple validator is a function that receives the value to be validated
and outputs the message error if any or null.

All validators must expect the same input type.

Note that validators are applied in the order they are declared or added and stops at first failing validator.
