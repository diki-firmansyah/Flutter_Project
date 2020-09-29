import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tekninkal_tes/screens/home_page.dart';
import 'package:tekninkal_tes/screens/login.dart';
import 'package:tekninkal_tes/services/loginService.dart';

class ConfirmationCode extends StatefulWidget {
  final String email;
  const ConfirmationCode({this.email});
  @override
  _ConfirmationCodeState createState() => _ConfirmationCodeState();
}

class _ConfirmationCodeState extends State<ConfirmationCode> {
  final _formKey = GlobalKey<FormState>();
  String _confirmcode = '';
  String _email = '';

  Future<void> _confirmcodeerror(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation Error'),
          content: const Text('Konfirmasi code anda tidak cocok'),
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
    _email = widget.email;
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
                      height: MediaQuery.of(context).size.height / 2.3,
                      child: new Stack(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                alignment: Alignment.topCenter,
                                image: AssetImage('assets/konfirmasi.jpg'),
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height / 20,
                            ),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.topCenter,
                                  //LOGO BUBUN
                                  //child: Image.asset('assets/bubunlogo.png',
                                  //  width: MediaQuery.of(context).size.height / 10,
                                  //),
                                ),
                                Text(
                                  "Konfirmasi",
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height / 30,
                                    fontWeight: FontWeight.w500,
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
                        //color: Colors.green,
                        child: Text(
                          'Kode Registrasi',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height / 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    new SizedBox(
                      height: MediaQuery.of(context).size.height / 50,
                    ),
                    Center(
                      child: Container(
                        alignment: Alignment.topCenter,
                        //color: Colors.red,
                        child: Text(
                          'Silahkan cek pesan anda untuk melihat kode registrasi',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height / 55,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                    new SizedBox(
                      height: MediaQuery.of(context).size.height / 30,
                    ),
                    Center(
                      child: Container(
                        alignment: Alignment.topCenter,
                        height: MediaQuery.of(context).size.height / 12,
                        width: MediaQuery.of(context).size.width / 1.2,
                        //color: Colors.green,
                        child: new TextFormField(
                          textAlign: TextAlign.center,
                          onSaved: (newValue) => _confirmcode = newValue,
                          decoration: new InputDecoration(
                              hintText: '(Kode Registrasi)',
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                        ),
                      ),
                    ),
                    new SizedBox(
                      height: MediaQuery.of(context).size.height / 100,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            //color: Colors.blue,
                            child: new Container(
                                alignment: Alignment.topRight,
                                height: MediaQuery.of(context).size.height / 25,
                                child: new Text('Belum mendapat email?',
                                    style: new TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                60,
                                        color: Color(0xff858585)))),
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
                                        builder: (context) => Login()));
                              },
                              child: new Container(
                                alignment: Alignment.topLeft,
                                height: MediaQuery.of(context).size.height / 25,
                                child: new Text(" Kirim ulang kode registrasi",
                                    style: new TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                60,
                                        color: Colors.orange[400])),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    new SizedBox(
                      height: MediaQuery.of(context).size.height / 5,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          final form = _formKey.currentState;
                          form.save();
                          _confirmationcode(_email, _confirmcode);
                        },
                        child: new Container(
                            alignment: Alignment.center,
                            height: MediaQuery.of(context).size.height / 13,
                            width: MediaQuery.of(context).size.width / 1.3,
                            decoration: new BoxDecoration(
                                color: Colors.orange[200],
                                borderRadius: new BorderRadius.circular(10.0)),
                            child: new Text('Konfirmasi',
                                style: new TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height / 40,
                                    fontFamily: 'Open Sans',
                                    color: Colors.black))),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  // _getemail() async{
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   // _email =  prefs.getString('email');
  // }

  void _confirmationcode(String email, String confirmcode) async {
    var res = await LoginService().doconfirmcode(email, confirmcode);
    var body = json.decode(res.body);
    if (body.length > 0) {
      if (body['status'] == "sukses") {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } else {
        _confirmcodeerror(context);
      }
    } else {
      _confirmcodeerror(context);
    }
  }
}
