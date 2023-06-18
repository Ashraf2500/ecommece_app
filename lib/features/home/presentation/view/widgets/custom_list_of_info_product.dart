import 'package:ecommece_app/features/home/presentation/manager/sale/sale_cubit.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/custom_one_product_for_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/shimmar/custom_flash_loading.dart';

class CustomListOfInfoProduct extends StatelessWidget {
   CustomListOfInfoProduct({
    Key? key,
  }) : super(key: key);
  
  
  
  @override
Widget build(BuildContext context) {
  double widthScreen = MediaQuery.of(context).size.width;
  return BlocConsumer<SaleCubit, SaleState>(
    listener: (context, state) {},
    builder: (context, state) {
      if (state is SaleFailure) {
        return Center(
          child: Text(state.errorMessage),
        );
      }
      if (state is SaleSuccess) {
        final length = state.saleModel.length; // Get the length of the saleModel list
        return Container(
          width: widthScreen,
          height: 220,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: length,
            itemBuilder: (context, index) {
              var dataImage = state.saleModel[index].image;
              var dataName = state.saleModel[index].title;
              var dataPrice = state.saleModel[index].price;
              var dataOldPrice = state.saleModel[index].rating.count;
              var dataSale = state.saleModel[index].rating.rate;

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: OneProductForListView(
                  image: dataImage,
                  title: dataName,
                  dataOldPrice: dataOldPrice,
                  dataPrice: dataPrice,
                  dataSale: dataSale,
                ),
              );
            },
          ),
        );
      }
      return Customflashloading();
    },
  );
}
}