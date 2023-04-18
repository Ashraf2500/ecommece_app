import 'package:flutter/material.dart';

import '../../../../home/presentation/view/widgets/custom_grid_view_products_widget.dart';
import '../../../../home/presentation/view/widgets/custom_product_appbar_widget.dart';

class FavouriteBody extends StatelessWidget {
  const FavouriteBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              //---------ProductAppBar ----------------------------------------
              SizedBox(height: 5),
              ProductAppBar(
                icon: Icon(Icons.arrow_back_ios_new_rounded),
                onPressed: () {
                  Navigator.pop(context);
                },
                text: "Favorite Product",

              ),

              //---------Divider -----------------------------------------------
              SizedBox(height: 5),
              Divider(
                thickness: 0.4,
              ),

              //----------Grid View---------------------------------------------
              SizedBox(height: 15),
              CustomGridViewProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
