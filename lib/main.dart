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

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: const Color(0xFF63DCA0),
    ));
    return new Scaffold(
      resizeToAvoidBottomPadding: true,
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
                                  blurRadius: 4,
                                  color: Colors.black12,
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
                                  height: 56.5,
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
                                            onTap: () {
                                              weight_of_upper = 0;
                                              setState(() {});
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
                                  height: 2,
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
                                height: 56.5,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 35, top: 4),
                                  child: TextField(
                                    onTap: () {
                                      weight_of_upper = 0;
                                      setState(() {});
                                      print('adfaf');
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
              flex: 1,
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
                                fontSize: 20,
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
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[500],
                                    fontSize: 20,
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
                                    print('wtf');
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
