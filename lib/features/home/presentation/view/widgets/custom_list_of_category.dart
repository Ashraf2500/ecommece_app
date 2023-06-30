import 'package:ecommece_app/core/utils/shimmar/custom_category_loading.dart';
import 'package:ecommece_app/features/home/presentation/manager/category/category_cubit.dart';
import 'package:ecommece_app/features/home/presentation/manager/more_category/more_category_cubit.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/custom_one_category.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/more_category_body.dart';
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
          var dataLenght = state.categoryModel;
          return SizedBox(
            width: widthScreen,
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: dataLenght.length,
              itemBuilder: (context, index) {
                var dataImage = dataLenght[index].image;
                var dataName = dataLenght[index].name;
         
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: InkWell(
                    onTap: (){
                      
                      MoreCategoryCubit.get(context).getData(category: dataName);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const MoreCategotyBody(),));
                    },
                    child: CustomOneCategory(
                     
                      title: dataName,
                      image: dataImage,
                      length: dataLenght.length,
                    ),
                  ),
                );
              },
            ),
          );
        }
        return const CustomCategoryLoading();
      },
    );
  }
}
