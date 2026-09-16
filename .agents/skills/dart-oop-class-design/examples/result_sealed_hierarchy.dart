/// Demonstrates an exhaustive Result / Either type using modern Dart 3 sealed classes
sealed class Result<T> {
  const Result();

  bool get isSuccess => this is Success<T>;
  bool get isFailure => this is Error<T>;
}

final class Success<T> extends Result<T> {
  final T data;
  const Success(this.data);
}

final class Error<T> extends Result<T> {
  final String message;
  final Exception? exception;
  const Error(this.message, [this.exception]);
}

void main() {
  final Result<int> outcome = Success(42);

  // Exhaustive pattern matching: compiler errors if any subtype is omitted
  final status = switch (outcome) {
    Success(:final data) => 'Operation succeeded with: $data',
    Error(:final message) => 'Operation failed with error: $message',
  };

  print(status);
}
