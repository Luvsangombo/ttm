import 'package:flutter/material.dart';
import 'package:ttm/screens/LoginScreen.dart';
import 'package:ttm/screens/VoterInfo.dart';
import 'package:ttm/screens/HomePage.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:ttm/provider/uconnect.dart';
import 'package:provider/provider.dart';
import 'package:ttm/screens/formDesign.dart';

class MyInfo extends StatefulWidget {
  static const routeName = '/myinfo';

  @override
  _MyInfoState createState() => _MyInfoState();
}

enum Gender { male, female }

class _MyInfoState extends State<MyInfo> {
  Gender kh = Gender.male;
  String ovog, ner, registr, ajilNer, ajilAlbantushaal, utas, editEmail;
  String gender = 'Эр';

  // Group Value for Radio Button.
  int id = 1;
  //TextController to read text entered in text field
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static final FacebookLogin facebookSignIn = new FacebookLogin();

  Future<Null> _logOut() async {
    await facebookSignIn.logOut();
    Navigator.of(context).pushNamed(LoginScreen.routeName);
  }


  Widget build(BuildContext context) {
    Login a = Provider.of<LoginData>(context).data;
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.teal,
          title: new Text('Миний мэдээлэл'),
        ),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
//              Container(
//                  height: 200,
//                  child: Image.asset('./assets/images/logo50.png')),
              Text(
                'a.userInfo.customerName',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
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
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: buildInputDecoration(Icons.person, "Овог"),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Овог оруулнна уу ';
                        }
                        return null;
                      },
                      onChanged: (String value) {
                        ovog = value;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: buildInputDecoration(Icons.person, "Нэр"),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Нэр оруулна уу ';
                        }
                        return null;
                      },
                      onChanged: (String value) {
                        ner = value;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: buildInputDecoration(
                          Icons.person, "Регистэрийн дугаар"),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Регистерийн дугаар оруулна уу ';
                        }
                        return null;
                      },
                      onChanged: (String value) {
                        registr = value;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration:
                          buildInputDecoration(Icons.person, "Ажлын нэр"),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please Enter Name';
                        }
                        return null;
                      },
                      onChanged: (String value) {
                        ajilNer = value;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration:
                          buildInputDecoration(Icons.person, "Албан тушаал"),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please Enter Name';
                        }
                        return null;
                      },
                      onChanged: (String value) {
                        ajilAlbantushaal = value;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: buildInputDecoration(Icons.person, "Утас"),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please Enter Name';
                        }
                        return null;
                      },
                      onChanged: (String value) {
                        utas = value;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration:
                          buildInputDecoration(Icons.person, "Е-майл хаяг"),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please Enter Name';
                        }
                        return null;
                      },
                      onChanged: (String value) {
                        editEmail = value;
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio(
                        value: 1,
                        groupValue: id,
                        onChanged: (val) {
                          setState(() {
                            gender = 'Эр';
                            id = 1;
                          });
                        },
                      ),
                      Text(
                        'Эр',
                        style: new TextStyle(fontSize: 17.0),
                      ),
                      Radio(
                        value: 2,
                        groupValue: id,
                        onChanged: (val) {
                          setState(() {
                            gender = 'Эм';
                            id = 2;
                          });
                        },
                      ),
                      Text(
                        'Эм',
                        style: new TextStyle(
                          fontSize: 17.0,
                        ),
                      ),
                    ],
                  ),
                  new RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        print(gender);
                        Future<String> Login =
                            Provider.of<LoginData>(context, listen: false)
                                .setMyInfo(
                          a.userInfo.facebookId,
                          ovog,
                          ner,
                          registr,
                          gender,
                          ajilNer,
                          ajilAlbantushaal,
                          utas,
                          editEmail,
                          // ignore: missing_return
                        ).then((value) {
                          if (value == 'success')
                            Navigator.of(context).pushNamed(HomePage.routeName);
                        });
                      }
                    },
                    child: new Text('setMyInfo'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
