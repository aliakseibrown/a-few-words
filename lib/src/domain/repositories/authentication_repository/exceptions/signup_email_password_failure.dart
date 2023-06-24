
class SignUpWithEmailAndPasswordFailure {
  final String message;

  const SignUpWithEmailAndPasswordFailure([this.message = 'An Unkown errpr occured.']);

  factory SignUpWithEmailAndPasswordFailure.code(String code) {
    switch(code) {
      case 'weak-password' : return const SignUpWithEmailAndPasswordFailure('Please enter a stronger password');
      case 'email-already-in-use' : return const SignUpWithEmailAndPasswordFailure('An account already exists for that email');
      case 'invalid-email' : return const SignUpWithEmailAndPasswordFailure('Email is not valid');
      case 'user-disiabled' : return const SignUpWithEmailAndPasswordFailure('This user has been disabled. Please contact support for help');

      default : return const SignUpWithEmailAndPasswordFailure();
    }
  }
}