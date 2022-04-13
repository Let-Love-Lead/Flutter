import 'package:flutter/material.dart';
import 'package:my_project/OnboardScreens/Firstpage.dart';
import 'package:my_project/OnboardScreens/Secondpage.dart';
import 'package:my_project/OnboardScreens/Fourthpage.dart';
import 'package:my_project/OnboardScreens/Fifthpage.dart';
import 'package:my_project/OnboardScreens/Thirdpage.dart';
import 'package:my_project/screens/Register.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Pages extends StatefulWidget {
  const Pages({ Key? key }) : super(key: key);

  @override
  State<Pages> createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  // Keep track of pages
  PageController _controller = PageController();
  //Check whether on last page
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
  final double height = MediaQuery.of(context).size.height;
  

    return Scaffold(
      body: Stack(
        children: [
          // Pageview
          PageView(
          controller: _controller,
          onPageChanged: (index){
           setState(() {
             onLastPage = (index == 4);
           });
          },
          children: [
            Firstpage(),
            Secondpage(),
            Thirdpage(),
            Fourthpage(),
            Fifthpage()
          ],
        ),
        //Sliders
        Container(
          // Alignments of dots
          child: Column(
            children: [

              //Skip
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                                 onTap: () {
                                   _controller.jumpToPage(4);
                                  },
                                 child: Text('Skip',
                                style: TextStyle(color: Colors.white, fontSize: 18),
                                 ),
                                ),
                      ],
                    ),
            
                  // dot slider
                SizedBox(height: height * 0.78),
                SmoothPageIndicator(
                  controller: _controller, 
                  count: 5,
                  effect: SlideEffect(
                    dotColor: Colors.white,
                    activeDotColor: Colors.orange,
                    spacing: 15.0,
                    dotWidth: 10,
                    dotHeight: 10,
                     
                    ),
                  ),
               
              //Next and Join
              SizedBox(height: height * 0.05),
              onLastPage
                 ? GestureDetector(
                   onTap: () {
                     Navigator.push(context, 
                       MaterialPageRoute(builder: (context) {
                         return Register();
                       }));
                    },
                   child: Container(
                     decoration: BoxDecoration(
                       color: Colors.orange,
                           borderRadius: BorderRadius.circular(10), 
                     ),
                          width: 327,
                          height: 50,
                     child: Center(
                       child: Text(
                              'Register',
                              style: TextStyle(color: Colors.white, fontSize: 18),
                            ),
                     ),
                   )
                   )
                  : GestureDetector(
                   onTap: () {
                     _controller.nextPage(
                       duration: Duration(milliseconds: 500), curve: Curves.easeIn
                       );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: 327,
                          height: 50,
                      child: Center(
                        child: Text('Next',
                        style: TextStyle(color: Colors.white, fontSize: 18),),
                      ),
                    )
                  ) 
            ],
          ),
        ),
        ],
      )
    );
  }
}
