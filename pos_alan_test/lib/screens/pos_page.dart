import 'package:flutter/material.dart';
import 'package:pos_alan_test/model/menu_model.dart';

class PosPage extends StatefulWidget {
  final Menu menu;
  PosPage({this.menu});
  @override
  _PosPageState createState() => _PosPageState();
}

class _PosPageState extends State<PosPage> {
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Menu'),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  Container(
                    //color: Colors.blue,
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width / 1,
                    height: MediaQuery.of(context).size.height / 1.2,
                    child: GridView.builder(
                      //scrollDirection: Axis.horizontal,
                      itemCount: menu.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: MediaQuery.of(context).size.width /(MediaQuery.of(context).size.height / 1.2),
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        Menu menus = menu[index];
                        //return Text(someplace[index].name);
                        return Container(
                          //color: Colors.grey[200],
                          height: MediaQuery.of(context).size.height / 4,
                          margin: EdgeInsets.all( MediaQuery.of(context).size.width / 50),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5.0,
                                spreadRadius: 2.0,
                              ),
                            ]
                          ),
                          child: GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    elevation: 0.0,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
                                    child: Container(
                                      height: MediaQuery.of(context).size.height / 1.7,
                                      width: MediaQuery.of(context).size.width / 1.2,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            //color: Colors.red,
                                            alignment: Alignment.centerRight,
                                            width: MediaQuery.of(context).size.width / 2,
                                            child: Text(menus.name == null? ' ': menus.name,
                                              style: TextStyle(
                                                fontSize: MediaQuery.of(context).size.height / 45,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          //new SizedBox(height: MediaQuery.of(context).size.height /
                                          Container(
                                            decoration: BoxDecoration(
                                              //borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height / 10 ),
                                              //boxShadow: [
                                              //  BoxShadow(
                                              //    color: Colors.black26,
                                              //    offset: Offset(0.0, 2.0),
                                              //    blurRadius: 6.0,
                                              //  )
                                              //],
                                            ),
                                            child: ClipRRect(
                                              child: Image(
                                                height: MediaQuery.of(context).size.height / 3.5,
                                                width: MediaQuery.of(context).size.height / 3.5,
                                                image: AssetImage(menus.imageUrl== null? ' ': menus.imageUrl
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          new SizedBox(height: MediaQuery.of(context).size.height / 50),
                                          Container(
                                            //color: Colors.red,
                                            alignment: Alignment.centerLeft,
                                            width: MediaQuery.of(context).size.width / 2,
                                            child: Column(
                                              children: <Widget>[
                                                Container(
                                                  //color: Colors.red,
                                                  alignment: Alignment.centerLeft,
                                                  width: MediaQuery.of( context).size.height / 5.5,
                                                  child: Column(
                                                    children: <Widget>[
                                                      Text(menus.name == null? ' ': menus.name,
                                                        style: TextStyle(
                                                          fontSize: MediaQuery.of(context).size.height / 50,
                                                          fontWeight: FontWeight.bold,
                                                          letterSpacing: 1.0,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  //color: Colors.red,
                                                  alignment: Alignment.centerLeft,
                                                  width: MediaQuery.of(context).size.height / 5.5,
                                                  child: Column(
                                                    children: <Widget>[
                                                      Text(menus.price.toString() == null? ' ': 'Rp.' + menus.price.toString() +' /porsi' ,
                                                        style:TextStyle(
                                                          fontSize:MediaQuery.of(context).size.height / 60,
                                                          fontWeight: FontWeight.w600,
                                                          letterSpacing:1.0,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.topCenter,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height / 10 ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        offset: Offset(0.0, 5.0),
                                        blurRadius: 1.0,
                                      )
                                    ],
                                  ),
                                  child: ClipRRect(
                                    child: Image(
                                      height: MediaQuery.of(context).size.height / 3.8,
                                      width: MediaQuery.of(context).size.height / 4,
                                      image: AssetImage(menus.imageUrl == null? ' ': menus.imageUrl),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                new SizedBox(height: MediaQuery.of(context).size.height / 200),
                                Padding(
                                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 80),
                                  child: Container(
                                    //color: Colors.red,
                                    alignment: Alignment.centerLeft,
                                    width: MediaQuery.of(context).size.height / 5.5,
                                    child: Column(
                                      children: <Widget>[
                                        Text(menus.name == null? ' ': menus.name,
                                          style: TextStyle(
                                            fontSize: MediaQuery.of(context).size.width / 33,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                new SizedBox(height: MediaQuery.of(context).size.height / 50),
                                Padding(
                                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 80),
                                  child: Container(
                                    //color: Colors.red,
                                    alignment: Alignment.centerLeft,
                                    width: MediaQuery.of(context).size.height / 5.5,
                                    child: Column(
                                      children: <Widget>[
                                        Text( menus.price.toString() == null? ' ': 'Rp. ' + menus.price.toString() +' /porsi' ,
                                          style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: MediaQuery.of(context).size.width / 40,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                new SizedBox(height: MediaQuery.of(context).size.height / 100),
                                Container(
                                  alignment: Alignment.center,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                          new MaterialPageRoute(builder: (context) => PosPage()));
                                    },
                                    child: new Container(
                                      alignment: Alignment.center,
                                      height: MediaQuery.of(context).size.height / 20,
                                      width: MediaQuery.of(context).size.width / 2.5,
                                      decoration: new BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: new BorderRadius.circular(
                                          MediaQuery.of(context).size.height / 100,
                                        ),
                                      ),
                                      child: Text(
                                        "Order",
                                        style: new TextStyle(
                                            fontSize: MediaQuery.of(context).size.height / 40,
                                            //fontFamily: 'Open Sans',
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.blue,
              blurRadius: 1.0,
              spreadRadius: 2.0,
            ),
          ]
        ),
        child: Row(
          children: <Widget>[
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1,
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      new SizedBox(width: MediaQuery.of(context).size.width / 20),
                      Icon(
                        Icons.add_shopping_cart,
                        color: Colors.grey[850],
                        size: MediaQuery.of(context).size.height / 30,
                      ),
                      new SizedBox(width: MediaQuery.of(context).size.width / 50),
                      Container(
                        alignment: Alignment.bottomLeft,
                        height: MediaQuery.of(context).size.height / 30,
                        child: Text( 'Rp. 0.0 ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: MediaQuery.of(context).size.width / 25,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1,
                  //color: Colors.blue,
                  alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: MediaQuery.of(context).size.width / 20,),
                      child: GestureDetector(
                        onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                  elevation: 0.0,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height / 1.7,
                                    width: MediaQuery.of(context).size.width / 1.2,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          //color: Colors.red,
                                          alignment: Alignment.centerRight,
                                          width: MediaQuery.of(context).size.width / 2,
                                          child: Text('Sop Daging',
                                            //menus.name == null? ' ': menus.name,
                                            style: TextStyle(
                                              fontSize: MediaQuery.of(context).size.height / 45,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        //new SizedBox(height: MediaQuery.of(context).size.height /
                                        Container(
                                          decoration: BoxDecoration(
                                            //borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height / 10 ),
                                            //boxShadow: [
                                            //  BoxShadow(
                                            //    color: Colors.black26,
                                            //    offset: Offset(0.0, 2.0),
                                            //    blurRadius: 6.0,
                                            //  )
                                            //],
                                          ),
                                          child: ClipRRect(
                                            child: Image(
                                              height: MediaQuery.of(context).size.height / 3.5,
                                              width: MediaQuery.of(context).size.height / 3.5,
                                              image: AssetImage(
                                                'image/sop_daging.jpg',
                                                //menus.imageUrl== null? ' ': menus.imageUrl
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        new SizedBox(height: MediaQuery.of(context).size.height / 50),
                                        Container(
                                          //color: Colors.red,
                                          alignment: Alignment.centerLeft,
                                          width: MediaQuery.of(context).size.width / 2,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                //color: Colors.red,
                                                alignment: Alignment.centerLeft,
                                                width: MediaQuery.of( context).size.height / 5.5,
                                                child: Column(
                                                  children: <Widget>[
                                                    Text('Sop Daging',
                                                      //menus.name == null? ' ': menus.name,
                                                      style: TextStyle(
                                                        fontSize: MediaQuery.of(context).size.height / 50,
                                                        fontWeight: FontWeight.bold,
                                                        letterSpacing: 1.0,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                //color: Colors.red,
                                                alignment: Alignment.centerLeft,
                                                width: MediaQuery.of(context).size.height / 5.5,
                                                child: Column(
                                                  children: <Widget>[
                                                    Text('Rp. 20.000',
                                                      //menus.price.toString() == null? ' ': 'Rp.' + menus.price.toString() +' /porsi' ,
                                                      style:TextStyle(
                                                        fontSize:MediaQuery.of(context).size.height / 60,
                                                        fontWeight: FontWeight.w600,
                                                        letterSpacing:1.0,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width / 3.5,
                          height: MediaQuery.of(context).size.height / 18,
                          decoration: new BoxDecoration(
                            color: Colors.blue,
                            borderRadius: new BorderRadius.circular(
                              MediaQuery.of(context).size.height / 150,
                            ),
                          ),
                          child: Text(
                            "Charger",
                            style: new TextStyle(
                                fontSize: MediaQuery.of(context).size.height / 45,
                                //fontFamily: 'Open Sans',
                                color: Colors.white),
                          ),
                        ),
                      ),
                  ),
                ),
              ],
            ),
          ]
        ),
      ),
    );
  }
}
