import 'package:flutter/material.dart';
import 'package:ttm/screens/LoginScreen.dart';
import 'package:ttm/screens/MyInfo.dart';
import 'package:ttm/screens/VoterInfo.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:ttm/provider/uconnect.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/homepage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static final FacebookLogin facebookSignIn = new FacebookLogin();
  @override
  void initState() {
    super.initState();

  }
  Future<Null> _logOut() async {
    await facebookSignIn.logOut();
    Navigator.of(context).pushNamed(LoginScreen.routeName);
  }

  Widget build(BuildContext context) {
    Login a = Provider.of<LoginData>(context).data;
    return new MaterialApp(

      home: new Scaffold(
        backgroundColor: Colors.teal,
        appBar: new AppBar(
          backgroundColor: Colors.teal,
          title: new Text('HomePage'),
        ),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
//              Container(
//                  height: 200,
//                  child: Image.asset('/assets/images/logo50.png')),
              Text(a.userInfo.facebookId, style: TextStyle(
                fontSize: 14,
                color: Colors.redAccent,
                fontWeight: FontWeight.bold,
              ),
                textAlign: TextAlign.center,),
              Divider(),
              ListTile(
                leading: Icon(Icons.payment),
                title: Text('Миний мэдээлэл '),
                onTap: () {
                  Navigator.of(context).pushNamed(MyInfo.routeName);
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.payment),
                title: Text('Дэмжигчийн бүртгэл '),
                onTap: () {
                  Navigator.of(context).pushNamed(VoterInfo.routeName);
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Гарах'),
                onTap: () async {
                  _logOut();
                },
              ),
            ],
          ),
        ),
        body:SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          CircleAvatar(
                backgroundImage: NetworkImage('http://uconnect.smarterp.mn/uploads/customers/'+a.userInfo.img),
                radius: 75,
              ),
              Text(a.userInfo.ner,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40.0,
                    fontFamily: 'Pacifico',
                  )),
              Text(a.userInfo.ovog,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontFamily: 'SourceSansPro',
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(height: 20,
                width: 150.0,
                child: Divider(color: Colors.teal.shade100),),
              Card(
                  color:Colors.white,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0,),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.phone,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          a.userInfo.utas,
                          style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 20.0,
                          ),
                        )
                      ],
                    ),
                  )),
              Card(
                  color:Colors.white,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0,),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.recent_actors,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          a.userInfo.registr,
                          style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 20.0,
                          ),
                        )
                      ],
                    ),
                  )),
              if(a.userInfo.ajilNer!=null)
              Card(
                  color:Colors.white,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0,),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.work,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          a.userInfo.ajilNer,
                          style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 20.0,
                          ),
                        )
                      ],
                    ),
                  )),
                            QrImage(
                data: a.userInfo.facebookId,
                version: QrVersions.auto,
                size: 150.0,
              ),
            ],
          ),
        ),
//        new Center(
//          child: new Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//              CircleAvatar(
//                backgroundImage: NetworkImage('http://uconnect.smarterp.mn/uploads/customers/'+a.userInfo.img),
//                radius: 75,
//              ),
//
//              Text(a.userInfo.customerName),
//              if(a.userInfo.utas!=null)
//              Text(a.userInfo.utas),
//              if(a.userInfo.ajilAlbantushaal!=null)
//              Text(a.userInfo.ajilAlbantushaal),
//              QrImage(
//                data: a.userInfo.facebookId,
//                version: QrVersions.auto,
//                size: 150.0,
//              ),
//              new RaisedButton(
//                onPressed:(){
//                  Navigator.of(context).pushNamed(LoginScreen.routeName);
//                },
//                child: new Text('HomePage'),
//              ),
//            ],
//          ),
//        ),
      ),
    );
  }
}
