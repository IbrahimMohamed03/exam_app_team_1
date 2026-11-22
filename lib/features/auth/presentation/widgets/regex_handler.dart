import '../../../../core/constants/ui_strings.dart';

class RegexHandler {
  static final RegExp _emailRegex = RegExp(
    r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$',
  );

  static final RegExp _passwordRegex = RegExp(
    r'^(?=.*[A-Z])(?=.*\d).{8,}$',
  );

  static final RegExp _phoneRegex = RegExp(
    r'^01[0125][0-9]{8}$',
  );

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return UiStrings.PleaseEnterYourEmail;
    }
    if (!_emailRegex.hasMatch(value.trim())) {
      return UiStrings.ThisEmailIsNotValid;
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return UiStrings.PleaseEnterYourPassword;
    }
    if (value.length < 6 || !_passwordRegex.hasMatch(value)) {
      return UiStrings.PasswordMust;
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return UiStrings.PleaseConfirmYourPassword;
    }
    if (value != password) {
      return UiStrings.PasswordNotMatched;
    }
    return null;
  }

  static String? validateUsername(String? value) {
    if (value == null || value.trim().isEmpty) {
      return UiStrings.PleaseEnterYourUsername;
    }
    if (value.trim().length < 3) {
      return UiStrings.UsernameMinLength;
    }
    return null;
  }

  static String? validateName(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      if (fieldName == 'first name') {
        return UiStrings.PleaseEnterFirstName;
      }
      return UiStrings.PleaseEnterLastName;
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return UiStrings.PleaseEnterYourPhoneNumber;
    }
    if (!_phoneRegex.hasMatch(value.trim())) {
      return UiStrings.InvalidPhoneNumber;
    }
    return null;
  }
}
