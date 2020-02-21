import 'package:dabba_app/constants/route_names.dart';
import 'package:dabba_app/locator.dart';
import 'package:dabba_app/service/authentication_service.dart';
import 'package:dabba_app/service/navigation_service.dart';
import 'package:dabba_app/viewmodels/base_model.dart';

class StartUpViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future handleStartUpLogic() async {
    var hasLoggedInUser = await _authenticationService.isUserLoggedIn();

    if (hasLoggedInUser) {
      _navigationService.navigateToReplace(HomeViewRoute);
    } else {
      _navigationService.navigateToReplace(LoginViewRoute);
    }
  }
}
