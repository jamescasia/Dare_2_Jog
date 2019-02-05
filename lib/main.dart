import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'reactiveButton.dart';
import 'GreenSquares.dart';
import 'loginScreen.dart';
import 'setGoal.dart';

LinearGradient teal = LinearGradient(
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
  colors: [
    const Color(0xFF63DCA0),
    const Color(0xFF52C5A4),
    const Color(0xFF40A1A8)
  ],
  tileMode: TileMode.repeated,
);
LinearGradient BtnTeal = LinearGradient(
  begin: Alignment.centerRight,
  end: Alignment.centerLeft,
  colors: [
    const Color(0xFF40A1A8),
    const Color(0xFF52C5A4),
    const Color(0xFF63DCA0),
  ],
  tileMode: TileMode.repeated,
);
void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Varela',
        primarySwatch: Colors.blue,
      ),
      home: LogInScreen(),
    );
  }
}

_LogInScreenState home;

class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() {
    home = new _LogInScreenState();
    return home;
  }
}

class _LogInScreenState extends State<LogInScreen> {
  int weight_of_upper = 2;
  int weight_of_lower = 1;
  // Container upper, lower;
  int current = 0;
  @override
  void adjustScreen(u, l) {
    weight_of_upper = u;
    weight_of_lower = l;
    setState(() {});
  }

  void nextScreen() {
    current+=1;
    setState(() {});
  }

  void returnScreen(u, l) {
    weight_of_upper = u;
    weight_of_lower = l;
    setState(() {});
  }

  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: const Color(0xFF63DCA0),
    ));
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Flex(
          direction: Axis.vertical,
          children: <Widget>[
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: new BorderRadius.only(
                        bottomLeft: const Radius.circular(38),
                        bottomRight: const Radius.circular(38)),
                    gradient: teal),
                child:
                (current == 0)?logInScreenUpper():(current ==1)? setGoalUpper():logInScreenUpper()
                    // setGoalUpper()
                    ,
              ),
              flex: weight_of_upper,
            ),
            Expanded(flex: weight_of_lower, child:
             (current == 0)?logInScreenLower():(current ==1)? setGoalLower():logInScreenLower()
                // setGoalLower()
                // logInScreenLower(),
                )
          ],
        ),
      ),
    );
  }
}
