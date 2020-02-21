import 'package:dabba_app/ui/shared/ui_helpers.dart';
import 'package:dabba_app/ui/widgets/busy_button.dart';
import 'package:dabba_app/viewmodels/account_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';

class AccountView extends StatelessWidget {

  final String imageUrl = "https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png";

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<AccountViewModel>.withConsumer(
      viewModel: AccountViewModel(),
      builder: (context, model, child) => Scaffold(
        body: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 250.0,
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.3))
                  ]),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {
                      model.logoutUser();
                    },
                    icon: Icon(Icons.exit_to_app),
                  ),
                ),
                Positioned(
                  top: 50.0,
                  left: 15.0,
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 125.0,
                        width: 125.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(62),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: model.selectedImage == null && model.user.profileImage == ""
                                ? NetworkImage(
                                    imageUrl)
                                : NetworkImage(model.user.profileImage),
                          ),
                        ),
                      ),
                      horizontalSpaceSmall,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            model.user.firstName,
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          verticalSpaceSmall,
                          Row(
                            children: <Widget>[
                              Icon(Icons.location_on),
                              horizontalSpaceTiny,
                              Text("Sector 52,Chandigarh")
                            ],
                          ),
                          verticalSpaceSmall,
                          Text(model.user.email),
                        ],
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 140,
                  left: 90,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.6),
                          )
                        ]),
                    child: IconButton(
                      icon: Icon(Icons.photo_camera),
                      onPressed: () {
                        model.selectImage();
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: 200,
                  left: 15,
                  right: 15,
                  child: BusyButton(title: "Edit Profile", onPressed: () {}),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
