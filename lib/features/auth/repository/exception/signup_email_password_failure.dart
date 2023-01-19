class SignUpWithEmailAndPasswordFailure {
  final String message;

  const SignUpWithEmailAndPasswordFailure(
      [this.message = "unkonwn error occured."]);

  factory SignUpWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return SignUpWithEmailAndPasswordFailure('Please enter a stronger password');
      case 'invalid-email':
        return SignUpWithEmailAndPasswordFailure('Email Is not valid');
      case 'email-alredy-in-use':
        return SignUpWithEmailAndPasswordFailure('An account is alredy exist for that email!');
      case 'operation-not-allowed':
        return SignUpWithEmailAndPasswordFailure('Operation not allowed please contact support');
      case 'user-disabled':
        return SignUpWithEmailAndPasswordFailure('This account has been disabled. Please contact support for help');
      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }
}
