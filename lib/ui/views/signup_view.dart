import 'package:dabba_app/ui/shared/ui_helpers.dart';
import 'package:dabba_app/ui/widgets/busy_button.dart';
import 'package:dabba_app/ui/widgets/expansion_list.dart';
import 'package:dabba_app/ui/widgets/input_field.dart';
import 'package:dabba_app/ui/widgets/text_link.dart';
import 'package:dabba_app/viewmodels/signup_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';

enum gender { Male, Female }

class SignUpView extends StatelessWidget {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<SignUpViewModel>.withConsumer(
      viewModel: SignUpViewModel(),
      onModelReady: (model) => model.onInitState(),
      builder: (context, model, child) => Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 38,
                  ),
                ),
                verticalSpaceLarge,
                Row(
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      child: InputField(
                        placeholder: 'First Name',
                        controller: firstNameController,
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Flexible(
                      child: InputField(
                        placeholder: 'Last Name',
                        controller: lastNameController,
                      ),
                    )
                  ],
                ),
                verticalSpaceSmall,
                InputField(
                  placeholder: 'Email',
                  controller: emailController,
                ),
                verticalSpaceSmall,
                InputField(
                  placeholder: 'Password',
                  password: true,
                  controller: passwordController,
                  additionalNote:
                      'Password has to be a minimum of 6 characters.',
                ),
                verticalSpaceSmall,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Gender:"),
                    horizontalSpaceMedium,
                    Text("Male"),
                    Radio(
                        activeColor: Colors.black,
                        value: 1,
                        groupValue: model.selectedRadio,
                        onChanged: model.setSelectedRadio),
                    Text("Female"),
                    Radio(
                        activeColor: Colors.black,
                        value: 2,
                        groupValue: model.selectedRadio,
                        onChanged: model.setSelectedRadio),
                  ],
                ),
                verticalSpaceSmall,
                ExpansionList<String>(
                    items: ['Cook', 'Foodie'],
                    title: model.selectedRole,
                    onItemSelected: model.setSelectedRole),
                verticalSpaceMedium,
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    BusyButton(
                      title: 'Sign Up',
                      busy: model.busy,
                      onPressed: () {
                        model.signUp(
                          firstName: firstNameController.text.trim(),
                          lastName: lastNameController.text.trim(),
                          email: emailController.text.trim(),
                          password: passwordController.text,
                        );
                      },
                    )
                  ],
                ),
                verticalSpaceMedium,
                TextLink(
                  'Already have an Account. Login Here.',
                  onPressed: () {
                    model.navigateToLogin();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
