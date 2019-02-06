import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'main.dart'; 
import 'package:intl/intl.dart';
import 'reactiveButton.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class setGoalUpper extends StatefulWidget {
  @override
  _setGoalUpperState createState() => new _setGoalUpperState();
}

class SetGoal {
final formats = {
    InputType.both: DateFormat("EEEE, MMMM d, yyyy 'at' h:mma"),
    InputType.date: DateFormat('yyyy-MM-dd'),
    InputType.time: DateFormat("HH:mm"),
  };

  // Changeable in demo
  InputType inputType = InputType.both;
  bool editable = true;
  DateTime date;


  final _kms_controller = TextEditingController();
  final _days_controller = TextEditingController();
  final _when_controller = TextEditingController();

  final _kms_focus = FocusNode();
  final _days_focus = FocusNode();
  final _when_focus = FocusNode();

  void returnScreen() {
    home.returnScreen(2, 1);
  }

  void adjustScreen() {
    home.adjustScreen(-1, 1);
  }
}

SetGoal setGoal = SetGoal();

class _setGoalUpperState extends State<setGoalUpper> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Image.asset(
            'assets/icons/plan_icon.png',
            fit: BoxFit.cover,
            width: 60,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30, top: 25),
            child: Text(
              "Set a RUNNING goal.\nPAY if you fail to reach it.",
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
              height: 143,
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
                              'assets/icons/dart_icon.png',
                              fit: BoxFit.cover,
                              width: 25,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 18),
                              child: TextField(
                                focusNode: setGoal._kms_focus,
                                autofocus: true,
                                onSubmitted: (content) {
                                  FocusScope.of(context)
                                      .requestFocus(setGoal._days_focus);
                                },
                                controller: setGoal._kms_controller,
                                textInputAction: TextInputAction.next,
                                onTap: () {
                                  setGoal.adjustScreen();
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
                                    hintText: 'How many kilometres?'),
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
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 18),
                              child: TextField(
                                // inputFormatters: TextInputFormatter() ,

                                focusNode: setGoal._days_focus,
                                autofocus: true,
                                onSubmitted: (content) {
                                  FocusScope.of(context)
                                      .requestFocus(setGoal._when_focus);
                                },

                                controller: setGoal._days_controller,
                                textInputAction: TextInputAction.next,
                                onTap: () {
                                  setGoal.adjustScreen();
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
                                    hintText: 'Which days? (Optional)'),
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
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 18),
                              child: TextField(
                                focusNode: setGoal._when_focus,
                                autofocus: true,
                                onSubmitted: (content) {
                                  setGoal.returnScreen();
                                },
                                obscureText: true,
                                controller: setGoal._when_controller,
                                textInputAction: TextInputAction.done,
                                onTap: () {
                                  setGoal.adjustScreen();
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
                                    hintText: 'Until when?'),
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

class setGoalLower extends StatefulWidget {
  @override
  _setGoalLowerState createState() => new _setGoalLowerState();
}

class _setGoalLowerState extends State<setGoalLower> {

  
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              width: double.infinity,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    DateTimePickerFormField(
                      inputType: setGoal.inputType,
                      format: setGoal.formats[setGoal.inputType],
                      editable: setGoal.editable,
                      decoration: InputDecoration(
                          labelText: 'Date/Time',
                          hasFloatingPlaceholder: false),
                      onChanged: (dt) => setState(() => setGoal.date = dt),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: ReactiveButton(
                        onTaps: () {},
                        height: 55,
                        width: 165,
                        bgGradient: BtnTeal,
                        fontSize: 18,
                        shadowHeight: 3.0,
                        label: "PROCEED",
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
