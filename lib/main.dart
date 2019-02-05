import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'reactiveButton.dart';
import 'GreenSquares.dart';

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

class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() => new _LogInScreenState();
}

double btnHeight = 5;
double btnScale = 1;
int weight_of_upper = 2;
int weight_of_lower = 1;
int s = 0;

class _LogInScreenState extends State<LogInScreen> {
  final _email_controller = TextEditingController();
  final _pass_controller = TextEditingController();

  void logIn() {
    returnScreen();
    print(_email_controller.text);
    print(_pass_controller.text);
  }

  @override
  void adjustScreen() {
    weight_of_upper = -1;
    weight_of_lower = 1;
    setState(() {});
  }

  void returnScreen() {
    setState(() {});
    weight_of_upper = 2;
    weight_of_lower = 1;
  }

  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: const Color(0xFF63DCA0),
    ));
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        // padding: EdgeInsets.only(bottom:),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        // decoration: BoxDecoration(
        //   gradient: teal,
        // ),
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
                child: Container(
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
                        padding: const EdgeInsets.only(
                            bottom: 18, right: 15, left: 15),
                        child: Container(
                          width: double.infinity,
                          height: 116,
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(32))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                  width: double.infinity,
                                  height: 57,
                                  child: Flex(
                                    direction: Axis.horizontal,
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 18),
                                        child: Image.asset(
                                          'assets/icons/user_icon.png',
                                          fit: BoxFit.cover,
                                          width: 25,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 18),
                                          child: TextField(
                                            controller: _email_controller,
                                            textInputAction:
                                                TextInputAction.next,
                                            onTap: () {
                                              adjustScreen();
                                            },
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 20,
                                              fontFamily: 'Varela',
                                            ),
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintStyle: TextStyle(
                                                  fontFamily: 'Varela',
                                                  color: Colors.grey[400],
                                                  fontSize: 20,
                                                ),
                                                hintText: 'email'),
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8, right: 8),
                                child: Container(
                                  height: 1,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(100)),
                                      boxShadow: [
                                        new BoxShadow(
                                          blurRadius: 2,
                                          color: Colors.grey[300],
                                          offset: new Offset(0, 0),
                                        ),
                                      ]),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 57,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 35, top: 4),
                                  child: TextField(
                                    controller: _pass_controller,
                                    onSubmitted: (content) { 
                                      returnScreen();
                                    },
                                    textInputAction: TextInputAction.done,
                                    onTap: () {
                                      adjustScreen();
                                    },
                                    obscureText: true,
                                    style: TextStyle(
                                      fontFamily: 'Varela',
                                      color: Colors.grey,
                                      fontSize: 20,
                                    ),
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(
                                          fontFamily: 'Varela',
                                          color: Colors.grey[400],
                                          fontSize: 20,
                                        ),
                                        hintText: 'password'),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              flex: weight_of_upper,
            ),
            Expanded(
              flex: weight_of_lower,
              child: Container(
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
                                print('create account nodw');
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
                                    logIn();
                                  },
                                  height: 62,
                                  width: 190,
                                  bgGradient: BtnTeal,
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
