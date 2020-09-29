import 'dart:convert';

class LoginInfo{
  String name;
  bool isvalid;

  LoginInfo(String user,bool isvalid)
  {
    this.name = user;
    this.isvalid = isvalid;
  }

  // LoginInfo({
  //   this.name,
  //   this.isvalid
  //   });

  LoginInfo.fromJson(Map json)
    : name = json['name'],
      isvalid = json['isvalid'];

  Map toJson(){
    return {"name" : name,"isvalid" : isvalid};
  }

  @override
  String toString() {
    return 'login_info{name:$name,isvalid:$isvalid}';
  }

  
  String logininfoToJson(LoginInfo data){
    final jsonData =  data.toJson();
    return json.encode(jsonData);
  }

}