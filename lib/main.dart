import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'reactiveButton.dart';
import 'GreenSquares.dart';
import 'loginScreen.dart';

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
  _LogInScreenState createState() {home =  new _LogInScreenState();
  return home;}
}



class _LogInScreenState extends State<LogInScreen> {

  int weight_of_upper = 2;
  int weight_of_lower = 1;
  @override
  void adjustScreen(u, l ) {
    weight_of_upper = u;
    weight_of_lower = l;
    setState(() {});
  }

  void returnScreen(u,l) { 
    weight_of_upper = u;
    weight_of_lower = l;
    setState(() { 
        });
    
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
                // height: hangTabHeight,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: new BorderRadius.only(
                        bottomLeft: const Radius.circular(38),
                        bottomRight: const Radius.circular(38)),
                    gradient: teal),
                child: logInScreenUpper(),
                // Container(
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children: <Widget>[
                //       Image.asset(
                //         'assets/icons/jog_icon.png',
                //         fit: BoxFit.cover,
                //         width: 60,
                //       ),
                //       Padding(
                //         padding: const EdgeInsets.only(bottom: 30, top: 25),
                //         child: Text(
                //           "Log in to your\nDare2Jog account",
                //           textAlign: TextAlign.center,
                //           style: TextStyle(
                //             fontSize: 25,
                //             fontWeight: FontWeight.w100,
                //             color: Colors.white,
                //           ),
                //         ),
                //       ),
                //       Padding(
                //         padding: const EdgeInsets.only(
                //             bottom: 18, right: 15, left: 15),
                //         child: Container(
                //           width: double.infinity,
                //           height: 95,
                //           decoration: BoxDecoration(
                //               boxShadow: [
                //                 new BoxShadow(
                //                   blurRadius: 4,
                //                   color: Colors.black12,
                //                   offset: new Offset(-3, 3),
                //                 ),
                //                 new BoxShadow(
                //                   blurRadius: 2,
                //                   color: Colors.black26,
                //                   offset: new Offset(3, 3),
                //                 )
                //               ],
                //               color: Colors.white,
                //               borderRadius:
                //                   BorderRadius.all(Radius.circular(32))),
                //           child: Column(
                //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //             children: <Widget>[
                //               Container(
                //                   width: double.infinity,
                //                   height: 47,
                //                   child: Flex(
                //                     direction: Axis.horizontal,
                //                     children: <Widget>[
                //                       Padding(
                //                         padding:
                //                             const EdgeInsets.only(left: 24),
                //                         child: Image.asset(
                //                           'assets/icons/user_icon.png',
                //                           fit: BoxFit.cover,
                //                           width: 25,
                //                         ),
                //                       ),
                //                       Expanded(
                //                         child: Padding(
                //                           padding:
                //                               const EdgeInsets.only(left: 18),
                //                           child: TextField(
                //                             focusNode: _email_focus,
                //                             autofocus: true,
                //                             onSubmitted: (content) {
                //                               FocusScope.of(context)
                //                                   .requestFocus(_pass_focus);
                //                             },
                //                             controller: _email_controller,
                //                             textInputAction:
                //                                 TextInputAction.next,
                //                             onTap: () {
                //                               adjustScreen();
                //                             },
                //                             style: TextStyle(
                //                               color: Colors.grey,
                //                               fontSize: 16,
                //                               fontFamily: 'Varela',
                //                             ),
                //                             decoration: InputDecoration(
                //                                 border: InputBorder.none,
                //                                 hintStyle: TextStyle(
                //                                   fontFamily: 'Varela',
                //                                   color: Colors.grey[400],
                //                                   fontSize: 16,
                //                                 ),
                //                                 hintText: 'email'),
                //                           ),
                //                         ),
                //                       )
                //                     ],
                //                   )),
                //               Padding(
                //                 padding:
                //                     const EdgeInsets.only(left: 21, right: 21),
                //                 child: Container(
                //                   height: 1,
                //                   color: Colors.grey[300],
                //                 ),
                //               ),
                //               Container(
                //                   width: double.infinity,
                //                   height: 47,
                //                   child: Flex(
                //                     direction: Axis.horizontal,
                //                     children: <Widget>[
                //                       Padding(
                //                         padding:
                //                             const EdgeInsets.only(left: 27),
                //                         child: Image.asset(
                //                           'assets/icons/lock_icon.png',
                //                           fit: BoxFit.cover,
                //                           width: 18,
                //                         ),
                //                       ),
                //                       Expanded(
                //                         child: Padding(
                //                           padding:
                //                               const EdgeInsets.only(left: 18),
                //                           child: TextField(
                //                             focusNode: _pass_focus,
                //                             autofocus: true,
                //                             onSubmitted: (content) {
                //                               returnScreen();
                //                             },
                //                             obscureText: true,
                //                             controller: _pass_controller,
                //                             textInputAction:
                //                                 TextInputAction.done,
                //                             onTap: () {
                //                               adjustScreen();
                //                             },
                //                             style: TextStyle(
                //                               color: Colors.grey,
                //                               fontSize: 16,
                //                               fontFamily: 'Varela',
                //                             ),
                //                             decoration: InputDecoration(
                //                                 border: InputBorder.none,
                //                                 hintStyle: TextStyle(
                //                                   fontFamily: 'Varela',
                //                                   color: Colors.grey[400],
                //                                   fontSize: 16,
                //                                 ),
                //                                 hintText: 'password'),
                //                           ),
                //                         ),
                //                       )
                //                     ],
                //                   )),
                //             ],
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ),
              flex: weight_of_upper,
            ),
            Expanded(
              flex: weight_of_lower,
              child: logInScreenLower(), 
              // Container(
              //   child: Column(
              //     children: <Widget>[
              //       Padding(
              //         padding: const EdgeInsets.only(top: 20),
              //         child: Column(
              //           mainAxisAlignment: MainAxisAlignment.start,
              //           children: <Widget>[
              //             Text("Don't have an account?",
              //                 style: TextStyle(
              //                   fontFamily: 'Varela',
              //                   color: Colors.grey[500],
              //                   fontSize: 14,
              //                 )),
              //             Padding(
              //               padding: const EdgeInsets.only(top: 2.5),
              //               child: InkWell(
              //                 highlightColor: Colors.transparent,
              //                 splashColor: Colors.transparent,
              //                 onTap: () {
              //                   print('create account nodw');
              //                 },
              //                 child: Text("CREATE NOW",
              //                     style: TextStyle(
              //                       decoration: TextDecoration.underline,
              //                       fontFamily: 'Varela',
              //                       fontWeight: FontWeight.w500,
              //                       color: Colors.grey[500],
              //                       fontSize: 14,
              //                     )),
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //       Expanded(
              //         child: Container(
              //           height: double.infinity,
              //           width: double.infinity,
              //           child: Column(
              //               mainAxisAlignment: MainAxisAlignment.end,
              //               children: <Widget>[
              //                 Padding(
              //                   padding: const EdgeInsets.only(bottom: 50),
              //                   child: ReactiveButton(
              //                     onTaps: () {
              //                       logIn();
              //                     },
              //                     height: 55,
              //                     width: 165,
              //                     bgGradient: BtnTeal,
              //                     fontSize: 18,
              //                     shadowHeight: 3,
              //                     label: "LOG IN",
              //                     borderRadius: 100,
              //                     highlightColor: const Color(0xFF63DCA0),
              //                     splashColor: const Color(0xFF40A1A8),
              //                   ),
              //                 ),
              //               ]),
              //         ),
              //       )
              //     ],
              //   ),
              //   // color: Colors.red,
              // ),
            )
          ],
        ),
      ),
    );
  }
} 