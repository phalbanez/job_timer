import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_timer/app/modules/login/controller/login_controller.dart';

class LoginPage extends StatelessWidget {
  final LoginController controller;
  const LoginPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return BlocListener<LoginController, LoginState>(
      bloc: controller,
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == LoginStatus.failure) {
          final message = state.errorMessage ?? 'Erro ao realizar login';
          AsukaSnackbar.alert(message).show();
        }
      },
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0XFF0092B9),
              Color(0XFF0167B2),
            ]),
          ),
          child: SizedBox(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/logo.png'),
                  SizedBox(
                    height: screenSize.height * 0.1,
                  ),
                  SizedBox(
                    width: screenSize.width * 0.8,
                    height: 49,
                    child: ElevatedButton(
                      onPressed: () {
                        controller.singIn();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[200]),
                      child: Image.asset('assets/images/google.png'),
                    ),
                  ),
                  BlocSelector<LoginController, LoginState, bool>(
                    bloc: controller,
                    selector: (state) => state.status == LoginStatus.loaging,
                    builder: (context, show) {
                      return Visibility(
                        visible: show,
                        child: const Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: Center(
                            child: CircularProgressIndicator.adaptive(
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
