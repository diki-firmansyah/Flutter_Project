import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tekninkal_tes/models/checklis.dart';
import 'package:tekninkal_tes/services/checklist_item.dart';

class HomePage extends StatefulWidget {
  final Checklist ceklis;
  HomePage({this.ceklis});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Checklist> checkList = [];
  List<Checklist> selectedcheckList;
  bool sort;

  Future<List<Checklist>> _getcouponhistory() async {
    // final prefs = await SharedPreferences.getInstance();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var email = prefs.getString('email_login_key');
    var id = prefs.getInt('odooid_login_key');
    var res = await ChecklistItem().doListItem(id);
    // print(res.body);
    var jsondata = json.decode(res.body);
    List<Checklist> lisItem = [];
    for (var m in jsondata) {
      Checklist checklistItem = Checklist(
          name: m["name"],
          code: m["code"],);
      lisItem.add(checklistItem);
    }
    // await new Future.delayed(new Duration(seconds: 3));
    return lisItem;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff98D0D0),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          //onPressed: () {
          //  Navigator.pushReplacement(
          //      context,
          //      MaterialPageRoute(
          //        builder: (context) => Home(),
          //      )
          //    );
          //},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.home,
              color: Colors.white,
              size: MediaQuery.of(context).size.width / 20,
            ),
            onPressed: () {}),
        ],
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Riwayat Kupon",
          style: TextStyle(
            color: Colors.white,
            fontSize: MediaQuery.of(context).size.height / 35,
          ),
        ),
      ),
      body: Container(
        //color: Colors.red,
        child: FutureBuilder(
          future: _getcouponhistory(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
              case ConnectionState.done:
                if (snapshot.data == null) {
                  return Container(
                    child: Center(
                      child: Text('Loading'),
                    ),
                  );
                } else {
                  checkList = snapshot.data;
                  final width = MediaQuery.of(context).size.width;
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      width: width * 2,
                      child: ListView(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              TextField(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(15.0),
                                  hintText: 'Cari Berdasarkan Kode Kupon',
                                ),
                                onChanged: (string) {
                                  setState(
                                    () {
                                      selectedcheckList = checkList
                                          .where(
                                            (u) => (u.name
                                                    .toLowerCase()
                                                    .contains(
                                                      string.toLowerCase(),
                                                    ) ||
                                                u.code
                                                    .toLowerCase()
                                                    .contains(
                                                      string.toLowerCase(),
                                                    )),
                                          )
                                          .toList();
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                          Container(
                            //color: Colors.blue,
                            //height: MediaQuery.of(context).size.height / 1,
                            child: DataTable(
                              sortAscending: sort,
                              sortColumnIndex: 2,
                              columns: [
                                DataColumn(
                                  label: Text(
                                    "Kode Kupon",
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              50,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  numeric: false,
                                  tooltip: "Kode Kupon",
                                  onSort: (columnIndex, ascending) {
                                    setState(
                                      () {
                                        sort = !sort;
                                      },
                                    );
                                    onSortColum(columnIndex, ascending);
                                  },
                                ),
                                DataColumn(
                                  label: Text(
                                    "Tipe Login",
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              50,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  numeric: false,
                                  tooltip: "Tipe Login",
                                ),
                                DataColumn(
                                  label: Text(
                                    "Tanggal Kadaluarsa",
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              50,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  numeric: false,
                                  tooltip: "Tipe Login",
                                ),
                                DataColumn(
                                  label: Text(
                                    "Sudah Terpakai",
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              50,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  numeric: false,
                                  tooltip: "Sudah Terpakai",
                                ),
                              ],
                              rows: checkList
                                  .map(
                                    (Checklist checkList) => DataRow(
                                      //selected:
                                      //    selectedCoupons.contains(coupon),
                                      //onSelectChanged: (b) {
                                      //  print("Onselect");
                                      //  onSelectedRow(b, coupon);
                                      //},
                                      cells: [
                                        DataCell(
                                          Text(
                                            checkList.name,
                                            style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  50,
                                              color: Colors.grey[600],
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          onTap: () {
                                            print(
                                                'Selected ${checkList.code}');
                                          },
                                        ),
                                        DataCell(
                                          Text(
                                            checkList.code,
                                            style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  50,
                                              color: Colors.grey[600],
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                break;
              case ConnectionState.active:
                return Container(
                  child: Center(
                    child: Text('loading'),
                  ),
                );
                break;
            }
          },
        ),
      ),
    );
  }

  /////////////////////////////////////////////////
  @override
  void initState() {
    sort = false;
    checkList = [];
    Future<List<Checklist>> checklist = _getcouponhistory();
    super.initState();
  }

  onSortColum(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        checkList.sort((a, b) => a.code.compareTo(b.code));
      } else {
        checkList.sort((a, b) => b.code.compareTo(a.code));
      }
    }
  }

  onSelectedRow(bool selected, Checklist checklist) async {
    setState(() {
      if (selected) {
        selectedcheckList.add(checklist);
      } else {
        selectedcheckList.remove(checklist);
      }
    });
  }

  deleteSelected() async {
    setState(() {
      if (selectedcheckList.isNotEmpty) {
        List<Checklist> temp = [];
        temp.addAll(selectedcheckList);
        for (Checklist checklist in temp) {
          checkList.remove(checklist);
          selectedcheckList.remove(checklist);
        }
      }
    });
  }
}
