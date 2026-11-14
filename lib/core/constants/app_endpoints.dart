
class AppEndpoints {
  AppEndpoints._();

  static const String baseUrl =
      'https://exam.elevateegy.com/api/v1/';

  // Authentication
  static const String register = 'auth/signup';
  static const String login = 'auth/signin';
  static const String changePassword = 'auth/changePassword';
  static const String deleteAccount = 'auth/deleteMe';
  static const String editAccount = 'auth/editProfile';
  static const String logout = 'auth/logout';
  static const String getLoggedUser = 'auth/profileData';

  // Password recovery
  static const String forgotPassword = 'auth/forgotPassword';
  static const String verifyResetCode = 'auth/verifyResetCode';
  static const String resetPassword = 'auth/resetPassword';

  // Exams
  static const String addExam = 'exams';
  static const String getExams = 'exams';
}
