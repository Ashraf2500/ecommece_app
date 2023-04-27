import 'package:ecommece_app/features/home/presentation/manager/category/category_cubit.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/custom_one_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomListOfCategory extends StatelessWidget {
  const CustomListOfCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    return BlocConsumer<CategoryCubit, CategoryState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is CategoryFailure) {
          return Center(child: Text(state.errorMessage));
        }
        if (state is CategorySuccess) {
          var dataLenght = state.categoryModel.data.data.length;
          return Container(
            width: widthScreen,
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: dataLenght,
              itemBuilder: (context, index) {
                var dataImage = state.categoryModel.data.data[index].image;
                var dataName = state.categoryModel.data.data[index].name;
                return    
                   CustomOneCategory(
                    title: dataName,
                    image: dataImage,
                    length: dataLenght,

                  );
                
                
                
                
              
              },
            ),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
