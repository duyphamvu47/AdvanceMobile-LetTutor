import 'package:lettutor/Service/Api.dart';
import 'package:lettutor/Service/Authentication.dart';
import 'package:lettutor/model/Course.dart';
import 'package:scoped_model/scoped_model.dart';

import '../data/courses_json.dart';
import '../model/Tutor.dart';


class ProfileViewModel extends Model {
  static final ProfileViewModel instance = ProfileViewModel._internal();

  String name = "";
  String phone = "";
  String birthday = "";

  factory ProfileViewModel() {
    return instance;
  }

  ProfileViewModel._internal() {
    name = Authentication.instance.userData?.name ?? "";
    phone = Authentication.instance.userData?.phone ?? "";
    birthday = Authentication.instance.userData?.birthday ?? "";
  }

  Future<bool> updateProfile() async{
    return await Authentication.instance.updateProfile(phone, name, birthday);
  }

}