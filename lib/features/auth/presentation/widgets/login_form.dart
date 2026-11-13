
import 'package:exam_app_team_1/core/constants/media_query.dart';
import 'package:exam_app_team_1/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
   LoginForm({super.key});


  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  GlobalKey<FormState> key = GlobalKey<FormState>();
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  @override
  void dispose() {
    loginEmailController.dispose();
    loginPasswordController.dispose();
    super.dispose();
  }

  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);
    return Scaffold(
      body: Form(
        key: key,
          child: Column(
        children: [
          AppBar(
            title: Text("Login"),
          ),
          TextFormField(
            controller: loginEmailController,
            decoration: InputDecoration(
              label: Text("Email"),
              hintText: "Enter your email"
            ),
          ),
          TextFormField(
            controller: loginPasswordController,
            decoration: InputDecoration(
                label: Text("Password"),
                hintText: "Enter your password"
            ),
          ),

          Row(
            children: [
              Checkbox(value: false, onChanged:(val){
                setState(() {
                  rememberMe=val??false;
                });
              }),
              Text("Remember me",style: theme.textTheme.titleSmall,),
              SizedBox(width: context.screenWidth*0.01,),
              InkWell(
                child: Text("Forgot Password?"),
                onTap: (){

                },
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              if (key.currentState!.validate()) {
                context.read<AuthCubit>().login(
                  loginEmailController.text.trim(),
                  loginPasswordController.text,);
              }
            },
            child: const Text("Login"),
          ),
        ],
      )),
    );
  }
}