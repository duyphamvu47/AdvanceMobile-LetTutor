import 'package:flutter/material.dart';
import 'package:lettutor/constant.dart';

class CustomMyCoursesCard extends StatefulWidget {
  const CustomMyCoursesCard({
    Key? key,
    required this.image,
    required this.title,
    required this.onPress,
    this.specs = "",
  }) : super(key: key);

  final String image;
  final String title;
  final String specs;
  final VoidCallback onPress;

  @override
  _CustomMyCoursesCardState createState() => _CustomMyCoursesCardState();
}

class _CustomMyCoursesCardState extends State<CustomMyCoursesCard> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.width * 0.25,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: GestureDetector(
        onTap: widget.onPress,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: size.width * 0.2,
              child: Row(
                children: [
                  Container(
                    height: size.width * 0.22,
                    width: size.width * 0.22,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        widget.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: size.height * 0.01),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 17.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          widget.specs,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 13.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}