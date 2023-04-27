
import 'package:ecommece_app/features/home/presentation/manager/bannersandgridview/home_cubit.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/custom_info_one_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomGridViewProducts extends StatelessWidget {
  const CustomGridViewProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;

    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        if(state is HomeFailure){
          return Center(child: Text(state.errorMessage),);
        }
        if (state is HomeSuccess) {
          var dataLength = state.homeModel.data.products.length;
        
          return Container(
            width: widthScreen,
           
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
            
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: GridView.builder(scrollDirection: Axis.vertical,
              
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 13,
                childAspectRatio: 0.11/ 0.22,
                mainAxisSpacing: 12,
              ),
              itemCount: dataLength,
              itemBuilder: (BuildContext context, int index) {
                 var data = state.homeModel.data.products[index].image;
                   var dataName = state.homeModel.data.products[index].name;
                   var dataPrice =state.homeModel.data.products[index].price;
                   var dataOldPrice= state.homeModel.data.products[index].oldPrice;
                    var dataOffer= state.homeModel.data.products[index].discount;
                   
                return CustomInfoOneProduct(
                  image: data,
                  title: dataName,
                  newPrice: dataPrice,
                  oldPrice: dataOldPrice,
                  sale: dataOffer,
                  icon: Icon(Icons.favorite_border_outlined,size: 20),
                  onPressed: (){},
                );
              },
            ),
          );
        }return CircularProgressIndicator();
      },
    );
  }
}
