import 'package:lettutor/Service/Api.dart';
import 'package:lettutor/model/Course.dart';
import 'package:scoped_model/scoped_model.dart';

import '../data/courses_json.dart';
import '../model/Tutor.dart';


class ExploredViewModel extends Model {
  static final ExploredViewModel instance = ExploredViewModel._internal();

  List<Tutor> searchResult = [];

  factory ExploredViewModel() {
    return instance;
  }

  ExploredViewModel._internal() {
    fetchTutor();
  }

  void fetchTutor() async {
    await API.instance.fetchTutor();
  }


  void searchCourse(String keyword){
    if (keyword.isEmpty){
      searchResult = [];
      notifyListeners();
      return;
    }
    List<Tutor> tutorList = API.tutorList;
    List<Tutor> result = tutorList.where((element) {
      var name = element.name;
      var specialties = element.specialties;
      var profession = element.profession;
      var education = element.education;
      var des = element.bio;

      if (name != null){
        if (name.contains(keyword)) return true;
      }
      if (specialties != null){
        if (specialties.contains(keyword)) return true;
      }
      if (profession != null){
        if (profession.contains(keyword)) return true;
      }
      if (education != null){
        if (education.contains(keyword)) return true;
      }
      if (des != null){
        if (des.contains(keyword)) return true;
      }
      return false;
    }).toList();
    searchResult = result;
    notifyListeners();
  }



}