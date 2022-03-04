import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lettutor/Screens/Search/SearchScreen.dart';
import 'package:lettutor/constant.dart';

import '../Screens/Manage/account_screen.dart';
import '../Screens/Home/home_screen.dart';
import '../Screens/MyCourse/my_courses.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getBody() {
    List<Widget> pages = [
      HomePage(),
      MyCoursesPage(),
      ExplorePage(),
      ManagementPage(),
    ];
    return IndexedStack(
      index: pageIndex,
      children: pages,
    );
  }

  Widget getFooter() {
    Size size = MediaQuery.of(context).size;
    List bottomItems = [
      "assets/icons/home_icon.svg",
      "assets/icons/play_icon.svg",
      "assets/icons/rocket_icon.svg",
      "assets/icons/user_icon.svg",
    ];
    return Container(
      width: size.width,
      height: size.height * 0.08,
      decoration: BoxDecoration(
        color: Colors.white,

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 30.0,
            offset: Offset(0, -10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: Padding(
          padding:
          const EdgeInsets.only(left: 40, right: 40, bottom: 10, top: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(bottomItems.length, (index) {
              return InkWell(
                  onTap: () {
                    selectedTab(index);
                  },
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        bottomItems[index],
                        height: size.height * 0.025,
                        color: pageIndex == index ? kPrimaryColor : kSecondaryColor,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      (pageIndex == index)
                          ? AnimatedContainer(
                        duration: Duration(milliseconds: 1000),
                        curve: Curves.easeIn,
                        child: Container(
                          height: 5.0,
                          width: 20.0,
                          decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(100)),
                        ),
                      )
                          : Container(
                        height: 5.0,
                        width: 20.0,
                      ),
                    ],
                  ));
            }),
          ),
        ),
      ),
    );
  }
  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
  }
}