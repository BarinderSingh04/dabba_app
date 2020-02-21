import 'package:dabba_app/constants/route_names.dart';
import 'package:dabba_app/locator.dart';
import 'package:dabba_app/models/dialog_models.dart';
import 'package:dabba_app/service/authentication_service.dart';
import 'package:dabba_app/service/dialog_service.dart';
import 'package:dabba_app/service/navigation_service.dart';
import 'package:dabba_app/viewmodels/base_model.dart';

class ForgetPasswordViewModel extends BaseModel {
  AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  DialogService _dialogService = locator<DialogService>();
  NavigationService _navigationService = locator<NavigationService>();

  Future sendResetPasswordEmail(String email) async {

    setBusy(true);

    var result = await _authenticationService.resetPassword(email);
    if (result is bool) {
      showDialog('Email Sent Successfully',
          'Please check your email account to proceed further.');

      setBusy(false);

    } else {
      await _dialogService.showDialog(
          title: 'Email is not correct', description: result);

      setBusy(false);
    }
  }

  showDialog(
    String title,
    String description,
  ) async {
    DialogResponse dialogResponse = await _dialogService.showConfirmationDialog(
      title: title,
      description: description,
      confirmationTitle: 'OK',
    );

    if (dialogResponse.confirmed) {
      _navigationService.navigateToReplace(LoginViewRoute);
    }
  }
}
