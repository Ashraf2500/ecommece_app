import 'package:flutter/material.dart';

import '../../../../home/presentation/view/widgets/custom_grid_view_products_widget.dart';
import '../../../../home/presentation/view/widgets/custom_product_appbar_widget.dart';

class FavouriteBody extends StatelessWidget {
   FavouriteBody({Key? key}) : super(key: key);
final ScrollController _scroolController =ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Scrollbar(
            controller: _scroolController,
          radius: Radius.circular(8),
          scrollbarOrientation: ScrollbarOrientation.right,
          interactive: false,
          thickness: 5,
          thumbVisibility: true,
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
      ),
    );
  }
}
