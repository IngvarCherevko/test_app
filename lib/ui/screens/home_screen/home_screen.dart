import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_flutter_app/models/service_model.dart';
import 'package:firebase_auth_flutter_app/theme/colors.dart';
import 'package:firebase_auth_flutter_app/ui/actions/app_actions.dart';
import 'package:firebase_auth_flutter_app/ui/navigation/screens.dart';
import 'package:firebase_auth_flutter_app/ui/screens/home_screen/widgets/search_input.dart';
import 'package:firebase_auth_flutter_app/ui/screens/home_screen/widgets/service_card.dart';
import 'package:firebase_auth_flutter_app/utils/screen_dimensions.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget with AppActions {
  @override
  Widget build(BuildContext context) {
    ScreenDimensions.calculateMultipliers(context);
    final hMultiplier = ScreenDimensions.getInstance().getHeightMultiplier();
    final wMultiplier = ScreenDimensions.getInstance().getWidthMultiplier();
    final List<ServiceModel> models = ServiceModel().getMockModelList();
    return Scaffold(
      backgroundColor: dirtyWhite,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(21 * wMultiplier, 17 * hMultiplier,
                    21.42 * wMultiplier, 8.5 * hMultiplier),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SearchInput(),
                    IconButton(
                        icon: Image.asset(
                          'assets/icons/filter.png',
                          height: 48 * hMultiplier,
                        ),
                        padding: EdgeInsets.all(0),
                        onPressed: () async {
                          try {
                            await FirebaseAuth.instance.signOut();
                            navigateToReplacement(context, Screens.welcome);
                          } catch (e) {
                            print(e);
                          }
                        })
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: models.length,
                    itemBuilder: (context, index) => ServiceCard(
                          model: models[index],
                        )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
