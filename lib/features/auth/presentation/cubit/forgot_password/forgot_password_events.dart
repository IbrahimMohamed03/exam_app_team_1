sealed class ForgotPasswordEvents {}

final class SubmitEmailEvent extends ForgotPasswordEvents {
  final String email;
  SubmitEmailEvent({required this.email});
}

final class VerifyResetCodeEvent extends ForgotPasswordEvents {
  final String resetCode;
  VerifyResetCodeEvent({required this.resetCode});
}

final class SubmitResetPasswordEvent extends ForgotPasswordEvents {
  final String newPassword;
  SubmitResetPasswordEvent({required this.newPassword});
}
