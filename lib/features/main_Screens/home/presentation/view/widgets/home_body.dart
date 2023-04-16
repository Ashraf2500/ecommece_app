import 'package:ecommece_app/constans.dart';
import 'package:ecommece_app/features/regis/presentation/views/widgets/custom_text_form_faild_widget.dart';
import 'package:flutter/material.dart';
import 'custom_main_title_row.dart';
import 'custom_search_appbar.dart';
import 'custom_slide.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10),
            CustomSearchAppBar(
              key: key,
              customTextFormField: CustomTextFormField(
                  hintText: "Search Product",
                  obscureText: false,
                  prefixIcon:Icon (Icons.search),
                  validator: (text){},
              ),

              iconOne: IconButton(
                icon:Icon (Icons.favorite_border_outlined),
                color: kBorderColor,
                onPressed: (){},

              ),

              iconTwo: IconButton(
                icon: Icon(Icons.notifications_none_outlined),
                color: kBorderColor,
                onPressed: (){},
              ),
            ),

            SizedBox(height: 15),
            Divider(thickness: 0.5,),
            SizedBox(height: 20),

            CustomSlider(),

            SizedBox(height: 20),
            CustomMainTitleRow(
              key: key,
              textOne: "Category",
              textTwo: "More Category",
              onPressed: (){},
            ),

          ],


          //CustomMainTitle();

        ),
      ),
    );
  }
}
