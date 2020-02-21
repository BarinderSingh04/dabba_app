import 'package:dabba_app/ui/shared/ui_helpers.dart';
import 'package:dabba_app/ui/widgets/busy_button.dart';
import 'package:dabba_app/ui/widgets/input_field.dart';
import 'package:dabba_app/viewmodels/forget_password_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';

class ForgetPasswordView extends StatelessWidget {
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<ForgetPasswordViewModel>.withConsumer(
      viewModel: ForgetPasswordViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Forget Password?',
                  style: TextStyle(
                    fontSize: 38,
                  ),
                ),
                verticalSpaceSmall,
                Text(
                    'Enter the email address associated with your account.'),
                verticalSpaceLarge,
                InputField(
                  placeholder: 'Enter your email address',
                  controller: emailController,
                ),
                verticalSpaceSmall,
                BusyButton(
                  title: 'Send',
                  busy: model.busy,
                  onPressed: (){
                    model.sendResetPasswordEmail(emailController.text.trim());
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
