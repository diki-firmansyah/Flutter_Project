import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:random_string/random_string.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tekninkal_tes/helpers/databasehelper.dart';
import 'package:tekninkal_tes/models/profile.dart';
import 'package:tekninkal_tes/screens/konfimasi_code.dart';
import 'package:tekninkal_tes/screens/login.dart';
import 'package:tekninkal_tes/services/loginService.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _formKey = GlobalKey<FormState>();
  String _name;
  String _password;
  String _email;
  String _phone;
  String _kodekonfirmasi;

  Future<void> _successform(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Bubun Mobile Info'),
          content: const Text('Data Berhasil masuk'),
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

  Future<void> _errorform(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Bubun Mobile Info'),
          content: const Text('email atau nomor telpon sudah terdaftar hubungi kontak person'),
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

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
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
                      child: new Stack(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                alignment: Alignment.topCenter,
                                image: AssetImage('assets/daftarbaru.jpg'),
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height / 40,
                            ),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'Daftar Baru',
                                  style: TextStyle(
                                    fontSize: 23.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Container(
                        alignment: Alignment.topCenter,
                        height: MediaQuery.of(context).size.height / 13,
                        width: MediaQuery.of(context).size.width / 1.2,
                        //color: Colors.green,
                        child: new TextFormField(
                          textAlign: TextAlign.center,
                          onSaved: (newValue) => _name = newValue,
                          decoration: new InputDecoration(
                            hintText: 'Nama',
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
                        alignment: Alignment.topCenter,
                        height: MediaQuery.of(context).size.height / 13,
                        width: MediaQuery.of(context).size.width / 1.2,
                        //color: Colors.green,
                        child: new TextFormField(
                          textAlign: TextAlign.center,
                          onSaved: (newValue) => _email = newValue,
                          decoration: new InputDecoration(
                            hintText: 'Email',
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
                        alignment: Alignment.topCenter,
                        height: MediaQuery.of(context).size.height / 13,
                        width: MediaQuery.of(context).size.width / 1.2,
                        //color: Colors.green,
                        child: new TextFormField(
                          obscureText: true,
                          textAlign: TextAlign.center,
                          onSaved: (newValue) => _password = newValue,
                          decoration: new InputDecoration(
                            hintText: 'Passsword',
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
                      height: MediaQuery.of(context).size.height / 50,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          final form = _formKey.currentState;
                          if (form.validate()) {
                            form.save();
                            _register();
                          }
                        },
                        child: new Container(
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height / 13,
                          width: MediaQuery.of(context).size.width / 1.4,
                          decoration: new BoxDecoration(
                              color: Colors.orange[200],
                              borderRadius: new BorderRadius.circular(10.0)),
                          child: new Text(
                            'Daftar Jadi Pelanggan',
                            style: new TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width / 25,
                                fontFamily: 'Open Sans',
                                color: Colors.black),
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
                              height: MediaQuery.of(context).size.height / 25,
                              child: new Text(
                                "Sudah Jadi Pelanggan? ",
                                style: new TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height / 60,
                                  color: Color(0xff858585),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            //color: Colors.red,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Login(),
                                  ),
                                );
                              },
                              child: new Container(
                                alignment: Alignment.bottomLeft,
                                height: MediaQuery.of(context).size.width / 25,
                                child: new Text(
                                  "Silahkan Masuk",
                                  style: new TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height / 60,
                                    color: Color(0xff1F4F5A),
                                  ),
                                ),
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

  _getkodekonfirmasi() {
    return randomAlphaNumeric(5).toUpperCase();
  }

  _saveEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email_login_key', _email);
  }

  _saveLocalprofile() async {
    Profile profile = Profile();
    profile.name = _name;
    profile.email = _email;
    DatabaseHelper helper = DatabaseHelper.instance;
    int id = await helper.Insert(profile);
    return id;
  }

  _readLocalprofile() async {
    DatabaseHelper helper = DatabaseHelper.instance;
    Profile profile = await helper.queryProfile(1);
    if (profile == null) {
      print('empty');
    } else {
      print('read row ${profile.id}');
    }
  }

  void _register() async {
    _kodekonfirmasi = _getkodekonfirmasi();
    var data = {
      "params": {
        "name": _name,
        "password": _password,
        "email": _email,
        "kode_konfirmasi": _kodekonfirmasi,
        "registervia": "mobile"
      }
    };

    _saveEmail();
    var res = await LoginService().doregister(data, 'register');
    // send notif nexmo 

    var body = json.decode(res.body);
    if (body.length > 0) {
      if (body['result'] == "sukses") {
        _saveLocalprofile();
        // _readLocalprofile();
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => ConfirmationCode(
                      email: _email,
                    )));
      } else {
        _errorform(context);
      }
    }
  }
}
