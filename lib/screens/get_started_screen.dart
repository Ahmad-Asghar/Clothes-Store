import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:travel_app/screens/home_screen.dart';
import '../provider/animated_route_provider.dart';
import '../widgets/app_text.dart';



class GetStartedScreen extends StatelessWidget {
   GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {

    GlobalKey gKey= GlobalKey();
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/m2.png'), fit: BoxFit.cover),
        ),
        height: double.maxFinite,
        width: double.maxFinite,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:  EdgeInsets.only(top: 7.h),
                child: CustomTextWidget(title: "LYX.I",fontWeight: FontWeight.bold,fontSize: 7.5.w,color: Colors.white,),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomTextWidget(
                    textAlign: TextAlign.center,
                    title: 'Stylish clothing and \nfashion curators',fontSize: 6.7.w,color: Colors.white,),
                  SizedBox(height: 2.h,),
                  Row(
                    children: [
                      Expanded(
                          key: gKey,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 10,
                              shadowColor: Colors.transparent,
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              minimumSize: Size(double.infinity, 7.h),
                            ),
                            onPressed: () {
                              final RenderBox renderBox = gKey.currentContext!.findRenderObject() as RenderBox;
                              final size = renderBox.size;
                              final offset = renderBox.localToGlobal(Offset.zero);
                              Navigator.of(context).push(createRoute(
                                HomeScreen(
                                  startSize: size,
                                  startPosition: offset,
                                ),
                              ));
                            },
                            child: CustomTextWidget(
                              title: 'Get Start',
                              fontSize: 5.w,
                              color: Colors.white,
                            ),
                          )
                      ),
                      SizedBox(width: 2.w),
                      MaterialButton(

                        elevation: 0,
                        height: 7.h,
                        minWidth: 7.h,

                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: const BorderSide(
                             color: Colors.white
                            )
                        ),
                        color: Colors.white.withOpacity(0.1),
                        onPressed: (){},
                        child: Image(
                            image: const AssetImage('assets/images/apple.png'),
                          height: 3.2.h,
                          color: Colors.white,
                        )

                      ),
                      SizedBox(width: 2.w),
                      MaterialButton(
                        elevation: 0,
                        height: 7.h,
                        minWidth: 7.h,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: const BorderSide(
                                color: Colors.white
                            )
                        ),
                        color:Colors.white.withOpacity(0.1),
                        onPressed: (){},
                        child: Image(
                          image: const AssetImage('assets/images/google.png'),
                          height: 3.2.h,

                          color: Colors.white,
                        )

                      ),

                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
