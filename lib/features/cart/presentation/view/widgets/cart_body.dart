import 'package:ecommece_app/features/cart/presentation/view/widgets/custom_one_product_cart.dart';
import 'package:flutter/material.dart';


class CartBody extends StatefulWidget {
  @override
  State<CartBody> createState() => _CarBody();
}

class _CarBody extends State<CartBody> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Your Cart",
        ),
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              child: Column(
                children: [
                
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return CustomOneProductCart();
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


//                   SizedBox(
//                     height: 32,
//                   ),
//                   TextFormField(
//                     decoration: InputDecoration(
//                       hintText: "Enter Cupon Code",
//                       hintStyle:
//                           TextStyle(fontSize: 12, color: mycolor.blackColor),
//                       border: OutlineInputBorder(),
//                       suffixIcon: Container(
//                         height: 56,
//                         width: 87,
//                         child: ElevatedButton(
//                             onPressed: () {},
//                             child: Text(
//                               "Apply",
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             )),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 16,
//                   ),
//                   BlocBuilder<CartCubit, CartState>(
//                     builder: (context, state) {
//                       if (state is CartSuccess) {
//                         var cart = state.Cart;
//                         return Container(
//                           height: 230,
//                           width: 360,
//                           decoration: BoxDecoration(
//                             border: Border.all(color: mycolor.graycolor),
//                             borderRadius: BorderRadius.circular(6),
//                           ),
//                           child: Column(
//                             children: [
//                               Container(
//                                 margin: EdgeInsets.all(16),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       "${cart.totalProducts}",
//                                       style: TextStyle(
//                                         color: Colors.grey,
//                                         fontSize: 12,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                     Text(
//                                       "\$598.86",
//                                       style: TextStyle(
//                                         color: Colors.grey,
//                                         fontSize: 12,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                               Container(
//                                 margin: EdgeInsets.all(16),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       "Shipping",
//                                       style: TextStyle(
//                                         color: Colors.grey,
//                                         fontSize: 12,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                     Text(
//                                       "\$40.00",
//                                       style: TextStyle(
//                                         color: Colors.grey,
//                                         fontSize: 12,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                               Container(
//                                 margin: EdgeInsets.all(16),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       "Import charges",
//                                       style: TextStyle(
//                                         color: Colors.grey,
//                                         fontSize: 12,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                     Text(
//                                       "\$128.00",
//                                       style: TextStyle(
//                                         color: Colors.grey,
//                                         fontSize: 12,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 12,
//                               ),
//                               Image.asset(
//                                 "images/Line 39.png",
//                                 color: Colors.grey,
//                               ),
//                               SizedBox(
//                                 height: 12,
//                               ),
//                               Container(
//                                 margin: EdgeInsets.all(16),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       "Total Price",
//                                       style: TextStyle(
//                                         color: mycolor.blackColor,
//                                         fontSize: 12,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                     Text(
//                                       "${cart.total}",
//                                       style: TextStyle(
//                                         color: mycolor.primaryColor,
//                                         fontSize: 12,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         );
//                       }
//                       return Text("data");
//                     },
//                   ),
//                   SizedBox(
//                     height: 16,
//                   ),
//                   Container(
//                     height: 70,
//                     width: double.infinity,
//                     child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                             primary: Color(0xff40BFFF)),
//                         onPressed: () {},
//                         child: Container(
//                           child: Text(
//                             'Check Out',
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 20),
//                           ),
//                         )),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ));
//   }
// }
