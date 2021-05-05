import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:ttm/screens/HomePage.dart';
import 'package:provider/provider.dart';
import 'package:ttm/provider/uconnect.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {

  static final FacebookLogin facebookSignIn = new FacebookLogin();

  String _message = '';

  Future<Null> _login() async {
    final FacebookLoginResult result =
    await facebookSignIn.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;
        final token = accessToken.token;
        final graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${token}');
        final fromjson = graphResponse.body;
        final profile = jsonDecode(fromjson);

        Future<bool> login =
        Provider.of<LoginData>(context, listen: false)
            .getMyInfo(
            profile['id'],
            profile['email'],
            profile['name'],
            profile['first_name'],
            profile['last_name']
        );
        Navigator.of(context).pushNamed(HomePage.routeName);
        break;

      case FacebookLoginStatus.cancelledByUser:
        _showMessage('Хэрэглэгч фэйсбүүкээр нэвтрэхийг цуцалсан.');
        break;
      case FacebookLoginStatus.error:
        _showMessage('Нэвтрэх үйл явцад алдаа гарсан.\n'
            'Фэйсбүүкээс өгсөн алдаа: ${result.errorMessage}');
        break;
    }
  }

  void _showMessage(String message) {
    setState(() {
      _message = message;
    });
  }

  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('LoginPage'),
        ),
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(_message),
              new RaisedButton(
                onPressed: _login,
                child: new Text('Facebook-ээр нэвтрэх'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
