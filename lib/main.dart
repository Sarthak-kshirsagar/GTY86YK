import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:ubixstarassignment/Features/BLoc/show_widgets_bloc.dart';
import 'package:ubixstarassignment/Features/Screens/showWidgets.dart';
import 'package:ubixstarassignment/firebase_options.dart';

import 'Features/Screens/buttonsUi.dart';
import 'Features/provider/selectOptions.dart';

void main() async {
  //firebase initialization
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  return runApp(MultiProvider(
    providers: [
      //same solution can be developed using the provider
      ChangeNotifierProvider(create: (_) => SelectedOptionsProvider()),
      //bloc to handle the communication between the checkboxes and widgets screen
      BlocProvider<ShowWidgetsBloc>(create: (_) => ShowWidgetsBloc()),
    ],
    child: MaterialApp(
      home: LandingPage(),
    ),
  ));
}

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late ShowWidgetsBloc showwid;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showwid = ShowWidgetsBloc();
  }

  @override
  Widget build(BuildContext context) {
    return ButtonsUi(showWidgetsBloc: showwid);
  }
}
