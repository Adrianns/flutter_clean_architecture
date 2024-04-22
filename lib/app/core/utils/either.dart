class Either<L, R> {
  final L? left;
  final R? right;

  Either.left(this.left) : right = null;
  Either.right(this.right) : left = null;

  bool get isLeft => left != null;
  bool get isRight => right != null;

  T fold<T>(T Function(L) onLeft, T Function(R) onRight) {
    if (isLeft) {
      return onLeft(left!);
    } else {
      return onRight(right!);
    }
  }

  T getOrElse<T>(T defaultValue) {
    if (isLeft) {
      return defaultValue;
    } else {
      return right as T;
    }
  }
}
