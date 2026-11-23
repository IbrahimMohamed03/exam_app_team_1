import 'package:exam_app_team_1/core/constants/ui_strings.dart';
import 'package:exam_app_team_1/features/auth/domain/params/register_params.dart';
import 'package:exam_app_team_1/features/auth/presentation/widgets/regex_handler.dart';
import 'package:exam_app_team_1/core/constants/media_query.dart';
import 'package:exam_app_team_1/core/constants/ui_strings.dart';
import 'package:exam_app_team_1/features/auth/presentation/cubit/auth/auth_cubit.dart';
import 'package:exam_app_team_1/features/auth/presentation/cubit/auth/auth_events.dart';
import 'package:exam_app_team_1/features/auth/presentation/widgets/regex_handler.dart';
import 'package:exam_app_team_1/features/auth/presentation/widgets/register/register_email_field.dart';
import 'package:exam_app_team_1/features/auth/presentation/widgets/register/register_header.dart';
import 'package:exam_app_team_1/features/auth/presentation/widgets/register/register_login_link.dart';
import 'package:exam_app_team_1/features/auth/presentation/widgets/register/register_name_field.dart';
import 'package:exam_app_team_1/features/auth/presentation/widgets/register/register_password_field.dart';
import 'package:exam_app_team_1/features/auth/presentation/widgets/register/register_phone_field.dart';
import 'package:exam_app_team_1/features/auth/presentation/widgets/register/register_submit_button.dart';
import 'package:exam_app_team_1/features/auth/presentation/widgets/register/register_username_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(_onPasswordChanged);
  }

  void _onPasswordChanged() {
    if (_autovalidateMode != AutovalidateMode.disabled &&
        _rePasswordController.text.isNotEmpty) {
      _formKey.currentState?.validate();
    }
  }

  @override
  void dispose() {
    _passwordController.removeListener(_onPasswordChanged);
    _usernameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _rePasswordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _onRegister() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<AuthCubit>().onEvent(
        RegisterEvent(
          params: RegisterParams(
            email: _emailController.text.trim(),
            password: _passwordController.text,
            username: _usernameController.text.trim(),
            phone: _phoneController.text.trim(),
            firstName: _firstNameController.text.trim(),
            lastName: _lastNameController.text.trim(),
            rePassword: _rePasswordController.text,
          ),
        ),
      );
    }
    else {
      if (_autovalidateMode != AutovalidateMode.onUserInteraction) {
        setState(() {
          _autovalidateMode = AutovalidateMode.onUserInteraction;
        });
      }
    }}

    @override
    Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          autovalidateMode: _autovalidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: context.screenHeight * 0.025),
              const RegisterHeader(),
              SizedBox(height: context.screenHeight * 0.025),
              RegisterUsernameField(
                controller: _usernameController,
              ),
              SizedBox(height: context.screenHeight * 0.02),
              RegisterNameFields(
                firstNameController: _firstNameController,
                lastNameController: _lastNameController,
              ),
              SizedBox(height: context.screenHeight * 0.02),
              RegisterEmailField(
                controller: _emailController,
              ),
              SizedBox(height: context.screenHeight * 0.02),
              RegisterPasswordField(
                controller: _passwordController,
                label: UiStrings.Password,
              ),
              SizedBox(height: context.screenHeight * 0.02),
              RegisterPasswordField(
                controller: _rePasswordController,
                label: UiStrings.ConfirmPassword,
                validator: (value) =>
                    RegexHandler.validateConfirmPassword(
                      value,
                      _passwordController.text,
                    ),
              ),
              SizedBox(height: context.screenHeight * 0.02),
              RegisterPhoneField(
                controller: _phoneController,
              ),
              SizedBox(height: context.screenHeight * 0.04),
              RegisterSubmitButton(
                onPressed: _onRegister,
              ),
              SizedBox(height: context.screenHeight * 0.02),
              const RegisterLoginLink(),
              SizedBox(height: context.screenHeight * 0.025),
            ],
          ),
        ),
      );
    }
  }
