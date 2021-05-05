import 'package:flutter/material.dart';
import 'package:ttm/screens/LoginScreen.dart';
import 'package:ttm/screens/HomePage.dart';
import 'package:ttm/screens/MyInfo.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class VoterInfo extends StatefulWidget {
  static const routeName = '/voterinfo';

  @override
  _VoterInfoState createState() => _VoterInfoState();
}

class _VoterInfoState extends State<VoterInfo> {

  static final FacebookLogin facebookSignIn = new FacebookLogin();

  Future<Null> _logOut() async {
    await facebookSignIn.logOut();
    Navigator.of(context).pushNamed(LoginScreen.routeName);
  }

  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('VoterInfo'),
        ),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              Container(
                  height: 200,
                  child: Image.asset('./assets/images/logo50.png')),
              Text('user.customerName', style: TextStyle(
                fontSize: 14,
                color: Colors.redAccent,
                fontWeight: FontWeight.bold,
              ),
                textAlign: TextAlign.center,),
              Divider(),
              ListTile(
                leading: Icon(Icons.payment),
                title: Text('Нүүр хуудас '),
                onTap: () {
                  Navigator.of(context).pushNamed(HomePage.routeName);
                },
              ),
              Divider(),              ListTile(
                leading: Icon(Icons.payment),
                title: Text('Миний мэдээлэл '),
                onTap: () {
                  Navigator.of(context).pushNamed(MyInfo.routeName);
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
              new RaisedButton(
                onPressed:(){
                  Navigator.of(context).pushNamed(LoginScreen.routeName);
                },
                child: new Text('VoterInfo'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
