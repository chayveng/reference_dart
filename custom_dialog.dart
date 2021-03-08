import "package:flutter/material.dart";

class CustomDialog2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      // content: dialogContent(context),
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    Time time = Time();
    Size sized = MediaQuery.of(context).size;
    var _formKey = GlobalKey<FormState>();
    Map<String, dynamic> setTime = {
      'h': '',
      'm': '',
    };
    return Container(
      width: sized.width,
      height: 300,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              Row(children: [Text('select time')]),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FieldTimePicker(
                    onSaved: (input) => setTime['h'] = input,
                  ),
                  customColon(),
                  FieldTimePicker(
                    onSaved: (input) => setTime['m'] = input,
                  ),
                ],
              ),
              SizedBox(height: 10),
              RaisedButton(
                child: Text('Ok'),
                onPressed: () {
                  _formKey.currentState.save();
                  print(setTime);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customColon() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          ':',
          style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
}
