import 'package:dabba_app/ui/shared/ui_helpers.dart';
import 'package:dabba_app/ui/widgets/busy_button.dart';
import 'package:dabba_app/ui/widgets/input_field.dart';
import 'package:dabba_app/ui/widgets/text_link.dart';
import 'package:dabba_app/viewmodels/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';

class LoginView extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<LoginViewModel>.withConsumer(
      viewModel: LoginViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 38,
                ),
              ),
              verticalSpaceLarge,
              InputField(
                placeholder: 'Email',
                controller: emailController,
              ),
              verticalSpaceSmall,
              InputField(
                placeholder: 'Password',
                password: true,
                controller: passwordController,
              ),
              verticalSpaceMedium,
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextLink(
                    'Forget Password?',
                    onPressed: () {
                      model.navigateToForgetPassword();
                    },
                  ),
                  BusyButton(
                    title: 'Login',
                    busy: model.busy,
                    onPressed: () {
                      model.login(
                        email: emailController.text.trim(),
                        password: passwordController.text,
                      );
                    },
                  )
                ],
              ),
              verticalSpaceLarge,
              TextLink(
                'Create an Account if you\'re new.',
                onPressed: () {
                  model.navigateToSignUp();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
