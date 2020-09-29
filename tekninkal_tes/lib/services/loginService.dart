import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginService {
  _setHeaders() => {
      'Content-type' : 'application/json',
      'Accept' : 'application/json',
  };

  String baseUrl = "http://18.139.50.74:8080/v2/api-docs/";

  dologin(String action, String user, String password) async {
      var fullUrl = baseUrl + action + '/' + user + '/' + password; 
      return await http.get(
        fullUrl, 
        // headers: _setHeaders()
      );
  }


  doregister(data,String action ) async{
    var fullurl = baseUrl +  action ;
    return await http.post(
      fullurl,
      headers: _setHeaders(),
      body : jsonEncode(data),
      );

  }


  doconfirmcode(String email,String confirmcode) async {
      var action = 'login/code';
      var fullUrl = baseUrl + action + '/' + email + '/' + confirmcode; 
      print(fullUrl);
      return await http.get(
        fullUrl, 
        // headers: _setHeaders()
      );
    
  }

  doforgetpassword(String email) async {
      var action = 'forget_password';
      var fullurl = baseUrl + action + '/' + email;
      print(fullurl);
      return await http.get(
        fullurl,
      );
  }

  dochangepassword(data) async{
    var action = 'change_password';
    var fullurl = baseUrl + action;
    return await http.post(
      fullurl,
      headers: _setHeaders(),
      body: jsonEncode(data),
    );
  }

  dogetprofile(String custid) async {
    var fullurl = baseUrl + 'profile/' + custid;
      return await http.get(
        fullurl,
      );
  }





  // Client client = Client();

  // Future <LoginInfo> getLogin(String user,String password) async {
  //   final response = await http.get("$baseUrl/login/$user/$password");
  //   if (response.statusCode == 200){
  //     return LoginInfo.fromJson(json.decode(response.body));
  //   }
  //   else
  //   {
  //     throw Exception('Ada kesalahan');
  //   }
  // }



}