import 'package:flutter/material.dart';

import '../../../components/circle_image.dart';
import '../../../constant.dart';
import '../../Home/components/clipper.dart';
import '../../Home/components/custom_heading.dart';


class Header extends StatelessWidget {
  final String name;
  final Image avatar;
  const Header({
    Key? key,
    required this.name,
    required this.avatar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        ClipPath(
          clipper: BottomClipper(),
          child: Container(
              width: size.width,
              height: 200,
              decoration: BoxDecoration(
                color: kPrimaryColor,
              )),
        ),
        Padding(
          padding:
          const EdgeInsets.only(left: appPadding, right: appPadding),
          child: Column(
            children: <Widget>[
              SizedBox(height: size.height * 0.05),
              //heading
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomHeading(
                    title: 'Manage',
                    subTitle: '',
                    color: Colors.white,
                  ),
                ],
              ),
              SizedBox(height: spacer),
            ],
          ),
        ),
        Column(
          children: [
            SizedBox(height: size.height * 0.1),
            CircleImage(
              avatar: avatar,
            ),
            SizedBox(height: 10,),
            Text(
              name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}