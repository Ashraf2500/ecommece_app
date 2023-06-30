import 'package:ecommece_app/core/utils/constans.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/custom_product_appbar_widget.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/custom_review_section.dart';
import 'package:ecommece_app/features/regis/presentation/views/widgets/custom_Button_widget.dart';
import 'package:flutter/material.dart';

class ReviewProductBody extends StatelessWidget {
   ReviewProductBody({super.key});
final ScrollController _scrollController =ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
          controller: _scrollController,
          radius: const Radius.circular(8),
          scrollbarOrientation: ScrollbarOrientation.right,
          interactive: false,
          thickness: 5,
          thumbVisibility: true,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    ProductAppBar(
                      icon: const Icon(Icons.arrow_back_ios_new_rounded),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      text: "Review",
                    ),
                    const SizedBox(
                    height: 15,
                  ),
                    const Divider(
                      thickness: 0.7,
                      color: kDescriptionText,
                    ),
                    const ReviewSection(),
                    const SizedBox(height: 20,),
                    const ReviewSection(),
                    const SizedBox(height: 20,),
                    const ReviewSection(),
                    const SizedBox(height: 20,),
                    const ReviewSection(),
                    const SizedBox(height: 30,),
                    CustomButton(onPressed: (){},text: "Write Review",),
                    const SizedBox(height: 50,)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
