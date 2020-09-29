final String tableProfiles = 'profile';
final String columnid = 'id';
final String columnUserName = 'name';
final String columnEmail = 'email';
final String columnpassword = 'password';

class Profile {
  int id;
  String name;
  String email;
  String phone;
  String password;

  Profile();

  Profile.fromMap(Map<String, dynamic> map) {
    id = map[columnid];
    name = map[columnUserName];
    email = map[columnEmail];
    phone = map[columnpassword];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnUserName: name,
      columnEmail: email,
      columnpassword: password,
      columnid : 1
    };
    if (id != null) {
      map[columnid] = id;
    }
    return map;
  }
}