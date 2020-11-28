import 'package:flutter/material.dart';
import 'package:login_ui/pages/home.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // initiating Signup class with formstatekey
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();

  SignUp _signUp = SignUp();

  String _validateemailaddress(String value) {
    return value.isEmpty ? 'Email Address' : null;
  }

  String _validateusername(String value) {
    return value.isEmpty ? 'Username' : null;
  }

  String _validatepassword(String value) {
    return value.isEmpty ? 'Password' : null;
  }

  String _validateconfirmpassword(String value) {
    return value.isEmpty ? 'Confirm Password' : null;
  }

  //creating submit order to check if all fields are valid
  // if the formstatekey login class is validated, save
  void _submitOrder() {
    if (_formStateKey.currentState.validate()) {
      _formStateKey.currentState.save();
    }
  }

  void _openhome({BuildContext context, bool fullscreenDialog = false}) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Home(),
          fullscreenDialog: fullscreenDialog,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                          padding: EdgeInsets.all(16.0),
                          child: FlatButton(
                            onPressed: () => _openhome(
                                context: context, fullscreenDialog: true),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey
                              ),
                            ),
                          ))
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(40.0),
                    child: CircleAvatar(
                      radius: 70.0,
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.camera_alt_outlined,
                          size: 135.0, color: Colors.white),
                    ),
                  )
                ],
              ),
              Container(
                child: Form(
                    key: _formStateKey,
                    autovalidateMode: AutovalidateMode.always,
                    child: Padding(
                      padding: EdgeInsets.all(40.0),
                      child: Column(
                        children: [
                          TextFormField(
                            decoration:
                                InputDecoration(hintText: 'Email address'),
                            validator: (value) => _validateemailaddress(value),
                            onSaved: (value) => Signup().email_address = value,
                          ),
                          TextFormField(
                            decoration: InputDecoration(hintText: 'Username'),
                            validator: (value) => _validateusername(value),
                            onSaved: (value) => Signup().email_address = value,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                hintText: 'Password',
                                suffixIcon: Icon(Icons.visibility_outlined)),
                            validator: (value) => _validatepassword(value),
                            onSaved: (value) => Signup().password = value,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                hintText: 'Confirm Password',
                                suffixIcon: Icon(Icons.visibility_outlined)),
                            validator: (value) => _validatepassword(value),
                            onSaved: (value) =>
                                Signup().confirm_password = value,
                          ),

                          //Divider(height: 32.0,),
                          Padding(
                              padding: EdgeInsets.all(60.0),
                              // overriding raised button height and width with button theme
                              child: ButtonTheme(
                                minWidth: 100.0,
                                height: 50.0,
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(18.0)),
                                  color: Colors.white,
                                  onPressed: () => _submitOrder(),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.check,
                                        color: Colors.blueAccent,
                                      ),
                                      Text(
                                        'SIGN UP',
                                        style:
                                            TextStyle(color: Colors.blueAccent),
                                      )
                                    ],
                                  ),
                                ),
                              ))
                        ],
                      ),
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "TERMS OF SERVICE",
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}

class Signup {
  String email_address;
  String username;
  String password;
  String confirm_password;
}
