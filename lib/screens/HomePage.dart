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
        appBar: new AppBar(
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
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage('http://uconnect.smarterp.mn/uploads/customers/'+a.userInfo.img),
                radius: 75,
              ),
              Text(a.userInfo.customerName),
              if(a.userInfo.utas!=null)
              Text(a.userInfo.utas),
              if(a.userInfo.ajilAlbantushaal!=null)
              Text(a.userInfo.ajilAlbantushaal),
              QrImage(
                data: a.userInfo.facebookId,
                version: QrVersions.auto,
                size: 150.0,
              ),
              new RaisedButton(
                onPressed:(){
                  Navigator.of(context).pushNamed(LoginScreen.routeName);
                },
                child: new Text('HomePage'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
