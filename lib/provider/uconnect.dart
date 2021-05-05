import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'user.dart';

class Login{
  String msg;
  int success;
  int errorCode;
  String versionCode;
  UserInfo userInfo;
  String token;

  List<String> banner;
  Login.fromJson(String jsonStr){

    final _map = jsonDecode(jsonStr)  as Map<String, dynamic>;

    this.msg = _map['mgs'];
    this.success = _map['sucess'];
    this.errorCode = _map['errorcode'];


    if( errorCode == 100){

      final user = _map['user_info'];
      this.userInfo = new UserInfo.fromJson(user);
      this.token=_map['token'];
      this.versionCode =_map['versioncode'] ;

    }

  }
}


class LoginData with ChangeNotifier{
  Login data;
  Future<bool> getMyInfo(String fb_id, String fb_email, String fb_name, String fb_first_name, String fb_last_name) async {
    String digest=fb_email;
    String a=fb_id+':'+digest+':'+fb_name+':'+fb_first_name+':'+fb_last_name;
    var base=utf8.encode(a);
    var base64Str = base64.encode(base);

    String url = 'http://uconnect.smarterp.mn/uconnect?name='+base64Str+'&versioncode=9';
    print(url);
    final response = await http.post(url);

    this.data = new Login.fromJson(response.body);

    notifyListeners();
    if(data.errorCode==100){
      return true;
    }
    else {
      return false;
    }
  }

  Future<String> setMyInfo(String fb_id, String ovog, String ner, String registr, String gender, String ajilNer, String ajilAlbantushaal, String utas, String editEmail) async {
    debugPrint('movieTitle2');
    Map para = {
      'fb_id': fb_id,
      'ovog': ovog,
      'ner': ner,
      'registr': registr,
      'gender': gender,
      'ajilNer':  ajilNer,
      'ajilAlbantushaal':  ajilAlbantushaal,
      'utas':  utas,
      'editEmail':  editEmail
    };

    String body = jsonEncode(para);

    String url = 'http://uconnect.smarterp.mn/uconnectsetmyinfo';
    final response =  await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: body,
    );
    //Амжилттай хадгалсан үед success гэж ирнэ. success -ээс өөр утга ирвэл алдааны мэдээлэл байна.
    if(response.body=="success"){
       data.userInfo.ovog=ovog;
       data.userInfo.ner=ner;
       data.userInfo.registr=registr;
       data.userInfo.gender=gender;
       data.userInfo.ajilNer=ajilNer;
       data.userInfo.ajilAlbantushaal=ajilAlbantushaal;
       data.userInfo.utas=utas;
       data.userInfo.editEmail=editEmail;
    }
    return response.body;
  }

}

