import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:travel_app/repos/products_repo.dart';
import '../provider/animated_route_provider.dart';
import '../provider/animation_builder.dart';
import '../widgets/app_text.dart';
import 'details_screen.dart';

class HomeScreen extends StatefulWidget {
  final Size startSize;
  final Offset startPosition;

  const HomeScreen({
    Key? key,
    required this.startSize,
    required this.startPosition,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey posterKey = GlobalKey();

  bool carouselDisplayed =false;
  int carouselDelayDuration = 1400;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomAnimatedContainer(
        startSize: widget.startSize,
        startPosition: widget.startPosition,
        endSize: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height),
        builder: (context, size, position, animationCompleted,onReturn) {
          return Stack(
            children: [
              Positioned(
                left: position.dx,
                top: position.dy,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular( animationCompleted?0: 15),
                    color: Colors.black,
                  ),
                  width: size.width,
                  height: size.height,
                ),
              ),
              if (animationCompleted)
                Column(
                  children: [
                    SizedBox(height:4.5.h,),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 4.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ZoomIn(child: Image.asset('assets/images/more.png',color: Colors.white,height: 25,width: 25,)),
                          ZoomIn(child: CustomTextWidget(title: "LYX.I",fontWeight: FontWeight.bold,fontSize: 7.w,color: Colors.white,)),
                          ZoomIn(child: Image.asset('assets/images/cart.png',color: Colors.white,height: 25,width: 25,)),
                        ],
                      ),
                    ),
                    SizedBox(height: 3.h,),
                    FadeIn(
                      delay: const Duration(milliseconds: 600),
                      child: SizedBox(
                        height: 7.h,
                      child: ListView.builder(
                        padding: EdgeInsets.only(left: 4.w),
                        scrollDirection: Axis.horizontal,
                        itemCount: ProductsRepoModel.bannersList.length,
                          itemBuilder: (BuildContext context,int index){
                            return Padding(
                              padding: const EdgeInsets.only(right: 6),
                              child: SlideInRight(
                                delay: const Duration(milliseconds: 600),
                                from: double.parse("${index+1}50"),
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(ProductsRepoModel.bannersList[index].displayImage.toString()),
                                      fit: BoxFit.cover
                                    ),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  height: 7.h,
                                  width: 42.w,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding:  EdgeInsets.only(left: 5.w),
                                      child: CustomTextWidget(
                                          title: ProductsRepoModel.bannersList[index].brandName.replaceAll(' ','\n'),
                                          fontSize: 3.6.w,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }
                          ),
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        CarouselSlider.builder(
                          itemCount: ProductsRepoModel.sliderList.length,
                          itemBuilder: (BuildContext context, int index, int realIndex) {

                            GlobalKey key = GlobalKey();
                            return ZoomIn(
                              onFinish: (direction) {
                                if (!carouselDisplayed) {
                                  setState(() {
                                    carouselDelayDuration = 100;
                                    carouselDisplayed = true;
                                  });
                                }
                              },
                              delay: Duration(milliseconds: carouselDelayDuration),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap:(){
                                        final RenderBox renderBox = key.currentContext!.findRenderObject() as RenderBox;
                                        final size = renderBox.size;
                                        final offset = renderBox.localToGlobal(Offset.zero);
                                        Navigator.of(context).push(createRoute(
                                          DetailsScreen(
                                            itemModel: ProductsRepoModel.sliderList[index],
                                            startSize: size,
                                            startPosition: offset,
                                          ),
                                        ));
                                      },
                                      child: Container(
                                        key:key,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(25),
                                          image:  DecorationImage(
                                              image: AssetImage(ProductsRepoModel.sliderList[index].image),
                                              fit: BoxFit.cover
                                          )
                                        ),
                                        height: 27.h,
                                        width: 50.w,
                                      ),
                                    ),
                                    SizedBox(height: 0.6.h),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            CustomTextWidget(
                                              title: ProductsRepoModel.sliderList[index].name,
                                              color: Colors.white,
                                              fontSize: 5.w,
                                            ),
                                            CustomTextWidget(
                                              title: ProductsRepoModel.sliderList[index].brandName,
                                              color: Colors.blueGrey,
                                              fontSize: 3.6.w,
                                            ),
                                          ],
                                        ),
                                        CustomTextWidget(
                                          title: '\$${ProductsRepoModel.sliderList[index].price.toString()}',
                                          color: const Color(0xffdf5130),
                                          fontSize: 7.w,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          options: CarouselOptions(
                            enlargeFactor: 0.4,
                            height: 42.h,
                            viewportFraction: 0.5,
                            scrollDirection: Axis.horizontal,
                            enlargeCenterPage: true,
                            enableInfiniteScroll: true,
                            enlargeStrategy: CenterPageEnlargeStrategy.scale,
                          ),
                        ),
                        FadeIn(
                          delay: const Duration(milliseconds: 2000),
                          child: Padding(
                            padding:  EdgeInsets.only(left: 4.w,top: 1.h),
                            child: CustomTextWidget(
                              title: 'Match Incongrous Styles',
                              color:  Colors.white,
                              fontSize: 6.w,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ],
                    ),
                    FadeIn(
                      delay: const Duration(milliseconds: 2300),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(vertical: 1.h,horizontal: 4.w),
                        child: ZoomIn(
                          delay:const Duration(milliseconds: 2300),
                          child: InkWell(
                            onTap: (){
                              final RenderBox renderBox = posterKey.currentContext!.findRenderObject() as RenderBox;
                              final size = renderBox.size;
                              final offset = renderBox.localToGlobal(Offset.zero);
                              Navigator.of(context).push(createRoute(
                                DetailsScreen(
                               itemModel:
                               ProductsRepoModel(
                                 name: "Chambray Shirt",
                                 image: "assets/images/poster.jpg",
                                 price: 45,
                                 brandName: "Denim Luxe",
                                 selectedSize: "L",
                                 description: "This chambray shirt offers a denim look with a lighter feel. Versatile and stylish, ideal for casual occasions.",
                               ),
                                  startSize: size,
                                  startPosition: offset,
                                ),
                              ));
                            },
                            child: Container(
                              key: posterKey,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: AssetImage('assets/images/poster.jpg'),
                                    fit: BoxFit.cover
                                ),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              height: 27.h,
                            ),
                          ),
                        ),
                      ),
                    ),
                    FadeIn(
                      delay: const Duration(milliseconds: 2600),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(vertical: 0.2.h,horizontal: 4.w),
                        child: ZoomIn(
                          delay:const Duration(milliseconds: 2600),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomTextWidget(title: 'By Emily Curtis',color: Colors.white,fontSize: 3.7.w,),
                              CustomTextWidget(title: 'View more',color: const Color(0xffdf5130),fontSize: 3.7.w,),


                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )

            ],
          );
        },
      ),
    );
  }
}
