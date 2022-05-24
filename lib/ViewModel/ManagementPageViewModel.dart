import 'package:scoped_model/scoped_model.dart';

import '../Service/Authentication.dart';
import '../model/User.dart';


class ManagementPageViewModel extends Model {
  static final ManagementPageViewModel instance = ManagementPageViewModel._internal();
  User? user;


  factory ManagementPageViewModel() {
    return instance;
  }

  ManagementPageViewModel._internal() {
    reloadData();
  }

  void reloadData(){
    user = Authentication.instance.userData;
    notifyListeners();
  }
}