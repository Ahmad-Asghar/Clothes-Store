

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:travel_app/repos/products_repo.dart';

import '../provider/animation_builder.dart';
import '../widgets/app_text.dart';
import '../widgets/size_selector.dart';

class DetailsScreen extends StatefulWidget {
  final ProductsRepoModel itemModel;
  final Size startSize;
  final Offset startPosition;

  const DetailsScreen({super.key, required this.startSize, required this.startPosition, required this.itemModel});

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:  CustomAnimatedContainer(
        startSize: widget.startSize,
        startPosition: widget.startPosition,
        endSize: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height*0.7),
        builder: (context, size, position, animationCompleted,onReturn) {
          return Stack(
            children: [
              Positioned(
                left: position.dx,
                top: position.dy,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      image:  DecorationImage(
                          image: AssetImage(widget.itemModel.image),
                          fit: BoxFit.cover
                      )
                  ),
                  width: size.width,
                  height: size.height,
                ),
              ),
              Column(
                children: [
                  SizedBox(
                      height: MediaQuery.of(context).size.height*0.65,
                    child:Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 3.w,vertical: 4.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           ZoomIn(
                             animate:animationCompleted,
                             child: IconButton(
                                 onPressed: onReturn,
                                 icon: CircleAvatar(
                                   radius: 19,
                                   backgroundColor: Colors.white.withOpacity(0.2),
                                   child: const Icon(Icons.chevron_left_rounded,size: 35,color: Colors.black,),
                             )),
                           ),
                           ZoomIn(
                             animate:animationCompleted,
                             child: IconButton(
                                 onPressed: (){},
                                 icon: CircleAvatar(
                                   radius: 19,
                                   backgroundColor: Colors.white.withOpacity(0.2),
                                   child:  const Icon(Icons.favorite,size: 27,color: Colors.red),
                             )),
                           ),
                        ],
                      ),
                    ),
                  ),
                  FadeInUp(
                    animate: animationCompleted,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25)
                        )
                      ),
                        width: double.maxFinite,
                        height: MediaQuery.of(context).size.height*0.35,
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 4.w),
                        child: Column(
                          children: [
                            SizedBox(height: 2.h),
                            ZoomIn(
                              animate: animationCompleted,
                              delay: const Duration(milliseconds: 500),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomTextWidget(
                                        title: widget.itemModel.name,
                                        fontSize: 6.w,
                                      ),
                                      CustomTextWidget(
                                        title: widget.itemModel.brandName,
                                        color: Colors.blueGrey,
                                        fontSize: 5.w,
                                      ),
                                    ],
                                  ),
                                  CustomTextWidget(
                                    title: '\$${widget.itemModel.price.toString()}',
                                    color: const Color(0xffdf5130),
                                    fontSize: 10.w,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 1.h),
                            ZoomIn(
                                animate: animationCompleted,
                                delay: const Duration(milliseconds: 800),
                                child: SizeSelection()),
                            SizedBox(height: 0.8.h),
                            ZoomIn(
                              animate: animationCompleted,
                              delay: const Duration(milliseconds: 1100),
                              child: CustomTextWidget(
                                color: Colors.blueGrey,
                                  title: widget.itemModel.description
                              ),
                            ),
                            SizedBox(height: 1.h),
                            ZoomIn(
                              animate: animationCompleted,
                              delay: const Duration(milliseconds: 1400),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          elevation: 10,
                                          shadowColor: Colors.transparent,
                                          backgroundColor: const Color(0xffdf5130),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                          minimumSize: Size(double.infinity, 7.h),
                                        ),
                                        onPressed: () {},
                                        child: CustomTextWidget(
                                          title: 'Add to Cart',
                                          fontSize: 5.w,
                                          color: Colors.white,
                                        ),
                                      )
                                  ),

                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  
                ],
              )

            ],
          );
        },
      ),
    );
  }
}





