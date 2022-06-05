import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_news/helpers/validation_form.dart';
import 'package:weather_news/login/bloc/login_bloc.dart';
import 'package:weather_news/register/register_screen.dart';
import 'package:weather_news/widgets/primary_button.dart';
import 'package:weather_news/widgets/text_form_filed.dart';
import '../theme.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool passwordVisible = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void togglePassword() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          if (state.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return SafeArea(
              child: Padding(
                padding: EdgeInsets.fromLTRB(24.0, 40.0, 24.0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Login to your\naccount',
                          style: heading2.copyWith(color: textBlack),
                        ),
                        SizedBox(height: 20),
                        Image.asset(
                          'assets/images/accent.png',
                          width: 99,
                          height: 4,
                        ),
                      ],
                    ),
                    SizedBox(height: 48),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          CTextFormField(
                            label: "Username",
                            validator: FormValid.emptyValue,
                            onChanged: (value) {
                              context
                                  .read<LoginBloc>()
                                  .add(OnChangeUsername(value));
                            },
                          ),
                          CTextFormField(
                            label: "Password",
                            obsureText: !passwordVisible,
                            validator: FormValid.emptyValue,
                            onChanged: (value) {
                              context
                                  .read<LoginBloc>()
                                  .add(OnChangePassword(value));
                            },
                            suffixIcon: IconButton(
                              color: textGrey,
                              splashRadius: 1,
                              icon: Icon(passwordVisible
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined),
                              onPressed: () {
                                setState(() {
                                  passwordVisible = !passwordVisible;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 32),
                    CustomPrimaryButton(
                      buttonColor: primaryBlue,
                      textValue: 'Login',
                      textColor: Colors.white,
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<LoginBloc>().add(LoginSubmitted());
                        }
                      },
                    ),
                    SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: regular16pt.copyWith(color: textGrey),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterScreen()),
                                (route) => false);
                          },
                          child: Text(
                            'Register',
                            style: regular16pt.copyWith(color: primaryBlue),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
