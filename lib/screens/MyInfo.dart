import 'package:flutter/material.dart';
import 'package:ttm/screens/LoginScreen.dart';
import 'package:ttm/screens/VoterInfo.dart';
import 'package:ttm/screens/HomePage.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:ttm/provider/uconnect.dart';
import 'package:provider/provider.dart';

class MyInfo extends StatefulWidget {
  static const routeName = '/myinfo';

  @override
  _MyInfoState createState() => _MyInfoState();
}

class _MyInfoState extends State<MyInfo> {

  String _message = '';
  static final FacebookLogin facebookSignIn = new FacebookLogin();

  Future<Null> _logOut() async {
    await facebookSignIn.logOut();
    Navigator.of(context).pushNamed(LoginScreen.routeName);
  }

  void _showMessage(String message) {
    setState(() {
      _message = message;
    });
  }

  Widget build(BuildContext context) {
    Login a= Provider.of<LoginData>(context).data;
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Миний мэдээлэл'),
        ),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              Container(
                  height: 200,
                  child: Image.asset('./assets/images/logo50.png')),
              Text('a.userInfo.customerName', style: TextStyle(
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
              new Text(_message),
              new RaisedButton(
                onPressed:(){
                  Future<String> Login =
                  Provider.of<LoginData>(context, listen: false)
                      .setMyInfo(
                      "10224637792509360",
                      "ovog",
                      "ner",
                      "registr",
                      "gender",
                      "ajilNer",
                      "ajilAlbantushaal",
                      "utas",
                      "editEmail"
                  );
                  _showMessage(a.userInfo.utas);
                },
                child: new Text('setMyInfo'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
