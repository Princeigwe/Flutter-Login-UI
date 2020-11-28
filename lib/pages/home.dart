
import 'package:flutter/material.dart';
import 'package:login_ui/pages/signup.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  void _opensignup({BuildContext context, bool fullScreenDialog = false}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: fullScreenDialog,
        builder: (context) => SignUp())
    );
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
                        child: FlatButton(onPressed: () => _opensignup(
                          context: context,
                          fullScreenDialog: true
                        ),
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),)
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              fontSize: 15.0, 
                              fontWeight: FontWeight.bold),
                        ),
                      )
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
                      backgroundColor: Colors.white70,
                      child: Icon(
                          Icons.account_circle,
                          size: 135.0,
                          color: Colors.grey
                        ),
                  ),
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
