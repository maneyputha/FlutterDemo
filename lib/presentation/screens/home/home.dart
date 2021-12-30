import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/commons/constants/routing_constants.dart';
import 'package:flutter_demo/logic/blocs/auth/login/login_bloc.dart';
import 'package:flutter_demo/logic/blocs/auth/login/login_state.dart';
import 'package:flutter_demo/presentation/screens/home/body.dart';
import 'package:flutter_demo/presentation/widgets/home/home.dart';

///Home Widget
///Created By - Manendra Ranathunga
///Created Date - 16.12.2021
///Updated By - Manendra Ranathunga
///Updated Date - 30.12.2021
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          ///Change route on form set to initial state emitted
          if (state.signedIn == false) {
            Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
            Navigator.pushNamed(context, loginRoute);
          }
        },
        child: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
                appBar: AppBar(
                  ///hides the back button
                  automaticallyImplyLeading: false,
                  title: const Text('Title Bar'),
                  actions: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.add_alert),
                      tooltip: 'Show Snackbar',
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('This is a snackbar')));
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.navigate_next),
                      tooltip: 'Go to the next page',
                      onPressed: () {
                        ///TODO dummy code change to generated routing in real apps
                        Navigator.push(context, MaterialPageRoute<void>(
                          builder: (BuildContext context) {
                            return Scaffold(
                              appBar: AppBar(
                                title: const Text('Next page'),
                              ),
                              body: const Center(
                                child: Text(
                                  'This is the next page',
                                  style: TextStyle(fontSize: 24),
                                ),
                              ),
                            );
                          },
                        ));
                      },
                    ),
                    HomeWidgets.getSettingsMenu(context)
                  ],
                ),
                resizeToAvoidBottomInset: false,
                body: const Body())));
  }
}
