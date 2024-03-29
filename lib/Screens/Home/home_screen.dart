import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lettutor/Screens/CourseDetail/course_detail_screen.dart';
import 'package:lettutor/ViewModel/HomeViewModel.dart';
import 'package:scoped_model/scoped_model.dart';
import 'components/clipper.dart';
import 'components/custom_course_card.dart';
import 'components/custom_heading.dart';
import '../../components/custom_search_field.dart';
import 'components/custom_title.dart';
import '../../constant.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: HomeViewModel.HomeVM_instance,
      child: Scaffold(
        backgroundColor: background,
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(0.0),
          child: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            systemOverlayStyle: SystemUiOverlayStyle.light,
          ),
        ),
        body: getBody(),
      ),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    var userName = "Duy";
    return ScopedModelDescendant<HomeViewModel>(
      builder: (BuildContext context, Widget? child, HomeViewModel model){
        return SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: spacer),
          child: Column(
            children: [
              // Header
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  ClipPath(
                    clipper: BottomClipper(),
                    child: Container(
                        width: size.width,
                        height: 300.0,
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                        )),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.only(left: appPadding, right: appPadding),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: spacer + 24),

                        //heading
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomHeading(
                              title: 'Hi, ${model.user?.name ?? ""}!',
                              subTitle: 'Let\'s start learning.',
                              color: Colors.white,
                            ),
                            Container(
                              height: spacer,
                              width: spacer,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.asset(model.user?.avatar ?? "assets/images/user_profile.jpg",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: spacer),

                        //search
                        CustomSearchField(
                          hintField: 'Try "Something"',
                          backgroundColor: background,
                          onChanged: (value){},
                          onTap: (){},
                        ),
                        SizedBox(height: spacer - 30.0),

                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: spacer),
              //feature courses
              Padding(
                padding: const EdgeInsets.only(left: appPadding, right: appPadding),
                child: CustomTitle(
                  title: 'My courses',
                ),
              ),
              SizedBox(height: smallSpacer),
              // Course list
              Container(
                padding: EdgeInsets.symmetric(horizontal: appPadding - 15),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(
                    // left: appPadding - 10.0,
                    // right: appPadding - 10.0,
                  ),
                  child: Wrap(
                    children: List.generate(model.getMyCourse().length, (index) {
                      var data = model.myCourse[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 15.0, bottom: 20.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context){
                                    return CourseDetail(course: data,);
                                  }
                              ),
                            );
                          },
                          child: CustomCourseCardExpand(
                            thumbNail: data.imageUrl ?? "",
                            videoAmount: data.topics?.length.toString() ?? "0",
                            title: data.name ?? "",
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
              SizedBox(height: spacer - 20.0),
              //feature category
              Padding(
                padding: const EdgeInsets.only(left: appPadding, right: appPadding),
                child: CustomTitle(title: 'Related courses'),
              ),
              SizedBox(height: smallSpacer),
              Container(
                padding: EdgeInsets.symmetric(horizontal: appPadding - 15),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(
                    // left: appPadding - 10.0,
                    // right: appPadding - 10.0,
                  ),
                  child: Wrap(
                    children: List.generate(model.getRelatedCourse().length, (index) {
                      var data = model.relatedCourse[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 15.0, bottom: 20.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context){
                                    return CourseDetail(course: data,);
                                  }
                              ),
                            );
                          },
                          child: CustomCourseCardExpand(
                            thumbNail: data.imageUrl ?? "",
                            videoAmount: data.topics?.length.toString() ?? "0",
                            title: data.name ?? "",
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}