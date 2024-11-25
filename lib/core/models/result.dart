sealed class Result<V, E extends Exception> {
  const Result();
}

final class Success<V, E extends Exception> extends Result<V, E> {
  const Success(this.value);

  final V value;
}

final class Failure<V, E extends Exception> extends Result<V, E> {
  const Failure(this.exception);

  final E exception;
}
