import 'package:ecommece_app/constans.dart';
import 'package:ecommece_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CustomOneProductCart extends StatelessWidget {
  const CustomOneProductCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 104,
      width: 343,
      decoration: BoxDecoration(
        border: Border.all(color: kBorderColor),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: Row(children: [
        SizedBox(
          width: 16,
        ),
        Container(
          child: Image.asset(
            "assets/images/image 47.png",
            width: 72,
            height: 72,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          width: 7,
        ),
        Container(
          width: 262,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Container(
                    width: 166,
                    child: Text(
                      "sds",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite_border,
                        color: kDescriptionText,
                      )),
                  IconButton(
                      onPressed: () {}, icon: Image.asset(Images.rubbish)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$ 1",
                    style: TextStyle(
                      color: kPrimaryColor,
                    ),
                  ),
                  Container(
                    width: 104,
                    height: 24,
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: Color.fromARGB(255, 215, 221, 237)),
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 31,
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            icon: Icon(
                              Icons.remove,
                            ),
                          ),
                        ),
                        Container(
                          width: 40,
                          color: kBorderColor,
                          child: Center(
                            child: Text(
                              "1",
                            ),
                          ),
                        ),
                        Container(
                          width: 31,
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            icon: Icon(
                              Icons.add,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
