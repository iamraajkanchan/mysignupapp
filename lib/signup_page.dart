import 'package:flutter/material.dart';
import 'package:mysignupapp/homepage.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  GlobalKey<FormState> _key = new GlobalKey();
  bool _autoValidate = false;
  String name;
  String email;
  String moblie;
  String collegeName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: Text('SignUp'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                Image(
                  image: AssetImage('assets/logo.png'),
                  width: 100.0,
                  height: 100.0,
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Enter Name';
                      }
                    },
                    decoration: InputDecoration(labelText: 'Name'),
                    onSaved: (input) => this.name = input,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.email),
                  title: TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Enter Email';
                      }
                    },
                    decoration: InputDecoration(labelText: 'Email'),
                    onSaved: (input) => this.email = input,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.phone),
                  title: TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Enter Mobile';
                      }
                    },
                    decoration: InputDecoration(labelText: 'Mobile'),
                    onSaved: (input) => this.moblie = input,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.school),
                  title: TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Enter College Name';
                      }
                    },
                    decoration: InputDecoration(labelText: 'Collecge Name'),
                    onSaved: (input) => this.collegeName = input,
                  ),
                ),
                ButtonTheme(
                  height: 40.0,
                  minWidth: 200.0,
                  child: MaterialButton(
                    color: Colors.redAccent,
                    onPressed: _sendToNextScreen,
                    child: Text(
                      'Save',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                      10.0,
                    )),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(
                  10.0,
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  _sendToNextScreen() {
    if (_key.currentState.validate()) {
      // save to global key
      _key.currentState.save();
      // send to next screen
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage(
                    name: this.name,
                    email: this.email,
                    mobile: this.moblie,
                    collegeName: this.collegeName,
                  )));
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }
}
