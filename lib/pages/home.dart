import 'package:flutter/material.dart';
import 'package:login_ui/pages/signup.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //initiating Login class using the formstatekey
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();

  Login _login = Login();

  // creating validating username method
  String _validateusername(String value) {
    return value.isEmpty ? "Username Required" : null;
  }

  //creating validating password method
  String _validatepassword(String value) {
    return value.isEmpty ? "Password Required" : null;
  }

  //creating submit order to check if all fields are valid
  // if the formstatekey login class is validated, save
  void _submitOrder() {
    if (_formStateKey.currentState.validate()) {
      _formStateKey.currentState.save();
    }
  }

  void _opensignup({BuildContext context, bool fullScreenDialog = false}) {
    Navigator.push(
        context,
        MaterialPageRoute(
            fullscreenDialog: fullScreenDialog,
            builder: (context) => SignUp()));
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
                          "Login",
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
                            onPressed: () => _opensignup(
                                context: context, fullScreenDialog: true),
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
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
                      child: Icon(Icons.account_circle,
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
                            decoration: InputDecoration(hintText: 'Username'),
                            validator: (value) => _validateusername(value),
                            onSaved: (value) => Login().username = value,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                hintText: 'Password',
                                suffixIcon: Icon(Icons.visibility_outlined)),
                            validator: (value) => _validatepassword(value),
                            onSaved: (value) => Login().password = value,
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
                                        'LOG IN',
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
                      "Login with",
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    RawMaterialButton(
                      onPressed: () {},
                      child: Image(
                        image: AssetImage('assets/images/google icon.png'),
                        height: 30.0,
                        width: 30.0,
                      ),
                      shape: CircleBorder(),
                    ),
                    RawMaterialButton(
                      onPressed: () {},
                      child: Image(
                        image: AssetImage('assets/images/github.png'),
                        height: 30.0,
                        width: 30.0,
                      ),
                      shape: CircleBorder(),
                    ),
                    RawMaterialButton(
                      onPressed: () {},
                      child: Image(
                        image: AssetImage('assets/images/twitter.png'),
                        height: 30.0,
                        width: 30.0,
                      ),
                      shape: CircleBorder(),
                    ),
                    RawMaterialButton(
                      onPressed: () {},
                      child: Image(
                        image: AssetImage('assets/images/Facebook.png'),
                        height: 30.0,
                        width: 30.0,
                      ),
                      shape: CircleBorder(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}

class Login {
  String username;
  String password;
}
