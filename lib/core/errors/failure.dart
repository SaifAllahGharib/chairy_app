abstract class Failure {
  final String message;

  const Failure(this.message);
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class NetworkFailure extends Failure {
  const NetworkFailure() : super("No Internet Connection");
}

class UnknownFailure extends Failure {
  const UnknownFailure() : super("An unexpected error occurred");
}
