import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tekninkal_tes/helpers/databasehelper.dart';
import 'package:tekninkal_tes/models/profile.dart';
import 'package:tekninkal_tes/screens/home_page.dart';
import 'package:tekninkal_tes/screens/login_info.dart';
import 'package:tekninkal_tes/screens/registrasi.dart';
import 'package:tekninkal_tes/services/loginService.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  String _user;
  String _password;
  int _id;
  Future<LoginInfo> loginInfo;
  Profile profile = Profile();

  Future<void> _loginfailedAlert(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Login Error'),
          content: const Text('User / password salah'),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  bool visibilityTag = false;
  bool visibilityObs = false;

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height / 2,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          alignment: Alignment.topCenter,
                          image: AssetImage('assets/login.jpg'),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        alignment: Alignment.topCenter,
                        height: MediaQuery.of(context).size.height / 12,
                        width: MediaQuery.of(context).size.width / 1.2,
                        //color: Colors.green,
                        child: new TextFormField(
                          textAlign: TextAlign.center,
                          onSaved: (newValue) => _user = newValue,
                          decoration: new InputDecoration(
                            hintText: 'Email/HandPhone',
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    new SizedBox(
                      height: MediaQuery.of(context).size.height / 100,
                    ),
                    Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height / 12,
                        width: MediaQuery.of(context).size.width / 1.2,
                        //color: Colors.pink,
                        child: new TextFormField(
                          obscureText: true,
                          textAlign: TextAlign.center,
                          onSaved: (newValue) => _password = newValue,
                          decoration: new InputDecoration(
                            hintText: 'Password',
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    new SizedBox(
                      height: MediaQuery.of(context).size.height / 8,
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.height / 15,
                          right: MediaQuery.of(context).size.height / 15,
                        ),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 13,
                          //color: Colors.purple,
                          child: GestureDetector(
                            onTap: () {
                              final form = _formKey.currentState;
                              form.save();
                              _login();
                            },
                            child: new Container(
                              alignment: Alignment.center,
                              height: MediaQuery.of(context).size.height / 20,
                              decoration: new BoxDecoration(
                                  color: Color(0xffFFD379),
                                  borderRadius:
                                      new BorderRadius.circular(10.0)),
                              child: new Text(
                                "Masuk",
                                style: new TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height / 40,
                                    fontFamily: 'Roboto',
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        //color: Colors.red,
                        child: GestureDetector(
                          //onTap: () {
                          //  Navigator.push(
                          //    context,
                          //    MaterialPageRoute(
                          //      builder: (context) => ForgotPassword(),
                          //    ),
                          //  );
                          //},
                          child: new Container(
                            alignment: Alignment.center,
                            height: MediaQuery.of(context).size.height / 35,
                            child: new Text(
                              "Lupa Password",
                              style: new TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height / 50,
                                fontFamily: 'Roboto',
                                color: Color(0xffFFD379),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            //color: Colors.blue,
                            child: new Container(
                                alignment: Alignment.centerRight,
                                height: MediaQuery.of(context).size.height / 15,
                                child: new Text("Belum Punya Akun?",
                                    style: new TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              60,
                                      color: Color(0xff858585),
                                      fontFamily: 'Roboto',
                                    ))),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            //color: Colors.red,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Registration()));
                              },
                              child: new Container(
                                alignment: Alignment.centerLeft,
                                height: MediaQuery.of(context).size.height / 15,
                                child: new Text(" Ayo Daftar Sekarang",
                                    style: new TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              60,
                                      color: Color(0xff1F4F5A),
                                      fontFamily: 'Roboto',
                                    )),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<int> _cleansaveprofile(Profile profile) async {
    DatabaseHelper helper = DatabaseHelper.instance;
    return await helper.Insert(profile);
  }

  void _login() async {
    final prefs = await SharedPreferences.getInstance();
    var res = await LoginService().dologin('login', _user, _password);
    var body = json.decode(res.body);
    if (body.length > 0) {
      profile.name = body[0]['name'];
      profile.email = body[0]['email'];
      _cleansaveprofile(profile).then((int id) {
        prefs.setInt('id_login_key', id);
      });
      if (body[0]['isvalid']) {
        prefs.setString('email_login_key', profile.email);
        Navigator.pushReplacement(
            context, new MaterialPageRoute(builder: (context) => HomePage()));
      } else {
        _loginfailedAlert(context);
      }
    } else {
      _loginfailedAlert(context);
    }
  }
}
