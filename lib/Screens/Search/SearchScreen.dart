import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lettutor/Screens/Search/components/search_result_cell.dart';
import 'package:lettutor/ViewModel/ExploreViewModel.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../components/custom_search_field.dart';
import '../../constant.dart';
import '../../data/category.dart';
import '../Home/components/custom_heading.dart';
import '../Home/components/custom_title.dart';
import 'components/recent_search_cell.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: ExploredViewModel.instance,
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
    return ScopedModelDescendant<ExploredViewModel>(
      builder: (BuildContext context, Widget? child, ExploredViewModel model){
        return SingleChildScrollView(
          padding: const EdgeInsets.all(appPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: smallSpacer),

              //header
              CustomHeading(
                title: 'Explore',
                subTitle: '',
                color: kPrimaryColor,
              ),
              SizedBox(height: smallSpacer),

              //search
              CustomSearchField(
                hintField: 'Search me',
                backgroundColor: Colors.white,
              ),
              SizedBox(height: size.height * 0.03),

              //title
              CustomTitle(title: 'Recent search', extend: false),
              SizedBox(height: size.height * 0.02),

              //suggestion
              Wrap(
                spacing: 10.0,
                runSpacing: 10.0,
                children: List.generate(CategoryJson.length, (index) {
                  return RecentSearchCell(
                    content: CategoryJson[index]['title'],
                    press: (){},
                  );
                }),
              ),

              SizedBox(height: smallSpacer),

              CustomTitle(title: 'Result', extend: false),

              SizedBox(height: smallSpacer),

              // Search result
              SearchResultCell(
                  name: "Nguyen Van A",
                  avatar: Image.asset("assets/images/user_profile.jpg"),
                  specialize: 'Mobile (Android)',
                  onPress: () {}
              ),
              SearchResultCell(
                  name: "Nguyen Van A",
                  avatar: Image.asset("assets/images/user_profile.jpg"),
                  specialize: 'Mobile (iOS)',
                  onPress: () {}
              ),
            ],
          ),
        );
      }
    );

  }
}

