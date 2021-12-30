import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/commons/constants/routing_constants.dart';
import 'package:flutter_demo/commons/constants/settings_drop_down.dart';
import 'package:flutter_demo/logic/blocs/auth/login/login_bloc.dart';
import 'package:flutter_demo/logic/blocs/auth/login/login_event.dart';

///Home related Custom Widgets
///Created By - Manendra Ranathunga
///Created Date - 30.12.2021
class HomeWidgets {
  ///Gets the settings menu and it's relevant functionality
  ///Params :
  ///appContext - BuildContext of the app.
  ///Returns:
  ///Widget - returns the requested settings drop down widget.
  ///Created By - Manendra Ranathunga
  ///Created Date - 30.12.2021
  static Widget getSettingsMenu(BuildContext appContext) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.settings),
      onSelected: (choice) {
        choiceAction(choice, appContext);
      },
      itemBuilder: (BuildContext newContext) {
        return SettingsDropDown.choices.map((String choice) {
          return PopupMenuItem<String>(
            value: choice,
            child: Text(choice),
          );
        }).toList();
      },
    );
  }

  static void choiceAction(String choice, BuildContext context) {
    if (choice == SettingsDropDown.FirstItem) {
      print('I First Item');
    } else if (choice == SettingsDropDown.SecondItem) {
      print('I Second Item');
    } else if (choice == SettingsDropDown.SignOut) {
      BlocProvider.of<LoginBloc>(context).add(SignoutClick());
    }
  }
}
