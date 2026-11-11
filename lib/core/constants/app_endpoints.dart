
class AppEndpoints {
  AppEndpoints._();

  static const String baseUrl = "https://exam.elevateegy.com/";

  // Authentication
  static const String signup = "api/v1/auth/signup";
  static const String login = "api/v1/auth/signin";
  static const String changePassword = "api/v1/auth/changePassword";
  static const String deleteAccount = "api/v1/auth/deleteMe";
  static const String editAccount = "api/v1/auth/editProfile";
  static const String logout = "api/v1/auth/logout";
  static const String getLoggedUser = "api/v1/auth/profileData";

  // Password recovery
  static const String forgotPassword = "api/v1/auth/forgotPassword";
  static const String verifyResetCode = "api/v1/auth/verifyResetCode";
  static const String resetPassword = "api/v1/auth/resetPassword";

  // Exams
  static const String addExam = "api/v1/exams";
  static const String getExams = "api/v1/exams";
}
