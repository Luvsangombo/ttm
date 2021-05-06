class UserInfo{
  String customerName;
  String ovog;
  String ner;
  String registr;
  String gender;
  String memberType;
  String ajilNer;
  String ajilAlbantushaal;
  String utas;
  String editEmail;
  String facebookId;
  String img;

  UserInfo.fromJson(Map<String, dynamic> jsonMap) {
    this.customerName = jsonMap['customer_name'];
    this.ovog = jsonMap['ovog'];
    this.ner = jsonMap['ner'];
    this.registr = jsonMap['registr'];
    this.gender = jsonMap['gender'];
    this.memberType = jsonMap['member_type'];
    this.ajilNer = jsonMap['ajil_ner'];
    this.ajilAlbantushaal = jsonMap['ajil_albantushaal'];
    this.utas = jsonMap['utas'];
    this.editEmail = jsonMap['edit_email'];
    this.facebookId = jsonMap['facebook_id'];
    this.img=jsonMap['img'];
  }
}
