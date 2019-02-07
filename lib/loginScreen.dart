import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'main.dart';
import 'reactiveButton.dart';
import 'setGoal.dart';

class LogInScreen {
  double btnHeight = 5;
  double btnScale = 1;

  int s = 0;
  double hangTabHeight = double.infinity;

  final _email_controller = TextEditingController();
  final _pass_controller = TextEditingController();
  final _email_focus = FocusNode();
  final _pass_focus = FocusNode();

  void logIn() {
    print(_email_controller.text);
    print(_pass_controller.text);
    logInSuccessful();
  }

  void logInSuccessful() {
    returnScreen();
    nextScreen(setGoalUpper(), setGoalLower());
  }
  void nextScreen(nextScreenUpper, nextScreenLower){
    home.nextScreen(nextScreenUpper, nextScreenLower);

  }


  void returnScreen() {
    home.returnScreen(2, 1);
  }

  void adjustScreen() {
    home.adjustScreen(-1, 1);
  }
}

LogInScreen logInScreen = LogInScreen();

class logInScreenUpper extends StatefulWidget {
  @override
  _logInScreenUpperState createState() => new _logInScreenUpperState();
}

class _logInScreenUpperState extends State<logInScreenUpper> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    logInScreen._email_focus.addListener(logInScreen.adjustScreen);
    logInScreen._pass_focus.addListener(logInScreen.adjustScreen);
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Image.asset(
            'assets/icons/jog_icon.png',
            fit: BoxFit.cover,
            width: 60,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30, top: 25),
            child: Text(
              "Log in to your\nDare2Jog account",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w100,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 18, right: 15, left: 15),
            child: Container(
              width: double.infinity,
              height: 95,
              decoration: BoxDecoration(
                  boxShadow: [
                    new BoxShadow(
                      blurRadius: 4,
                      color: Colors.black12,
                      offset: new Offset(-3, 3),
                    ),
                    new BoxShadow(
                      blurRadius: 2,
                      color: Colors.black26,
                      offset: new Offset(3, 3),
                    )
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(32))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                      width: double.infinity,
                      height: 47,
                      child: Flex(
                        direction: Axis.horizontal,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 24),
                            child: Image.asset(
                              'assets/icons/user_icon.png',
                              fit: BoxFit.cover,
                              width: 25,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 18),
                              child: TextField(
                                focusNode: logInScreen._email_focus,
                                // autofocus: true,
                                onSubmitted: (content) {
                                  FocusScope.of(context)
                                      .requestFocus(logInScreen._pass_focus);
                                },
                                controller: logInScreen._email_controller,
                                textInputAction: TextInputAction.next,
                                onTap: () {
                                  logInScreen.adjustScreen();
                                },
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontFamily: 'Varela',
                                ),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                      fontFamily: 'Varela',
                                      color: Colors.grey[400],
                                      fontSize: 16,
                                    ),
                                    hintText: 'email'),
                              ),
                            ),
                          )
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 21, right: 21),
                    child: Container(
                      height: 1,
                      color: Colors.grey[300],
                    ),
                  ),
                  Container(
                      width: double.infinity,
                      height: 47,
                      child: Flex(
                        direction: Axis.horizontal,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 27),
                            child: Image.asset(
                              'assets/icons/lock_icon.png',
                              fit: BoxFit.cover,
                              width: 18,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 18),
                              child: TextField(
                                focusNode: logInScreen._pass_focus,
                                // autofocus: true,
                                onSubmitted: (content) {
                                  logInScreen.returnScreen();
                                },
                                obscureText: true,
                                controller: logInScreen._pass_controller,
                                textInputAction: TextInputAction.done,
                                onTap: () {
                                  logInScreen.adjustScreen();
                                },
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontFamily: 'Varela',
                                ),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                      fontFamily: 'Varela',
                                      color: Colors.grey[400],
                                      fontSize: 16,
                                    ),
                                    hintText: 'password'),
                              ),
                            ),
                          )
                        ],
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class logInScreenLower extends StatefulWidget {
  @override
  _logInScreenLowerState createState() => new _logInScreenLowerState();
}

class _logInScreenLowerState extends State<logInScreenLower> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text("Don't have an account?",
                    style: TextStyle(
                      fontFamily: 'Varela',
                      color: Colors.grey[500],
                      fontSize: 14,
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 2.5),
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      print('create account now');
                    },
                    child: Text("CREATE NOW",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontFamily: 'Varela',
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[500],
                          fontSize: 14,
                        )),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: ReactiveButton(
                        onTaps: () {
                          logInScreen.logIn();
                        },
                        height: 55,
                        width: 165,
                        bgGradient: BtnTeal,
                        fontSize: 18,
                        shadowHeight: 3,
                        label: "LOG IN",
                        borderRadius: 100,
                        highlightColor: const Color(0xFF63DCA0),
                        splashColor: const Color(0xFF40A1A8),
                      ),
                    ),
                  ]),
            ),
          )
        ],
      ),
      // color: Colors.red,
    );
  }
}
