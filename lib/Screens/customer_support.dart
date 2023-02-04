import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../utils/constant.dart';

class Customer_support_Screen extends StatefulWidget {
  @override
  _Customer_support_ScreenState createState() => _Customer_support_ScreenState();
}

class _Customer_support_ScreenState extends State<Customer_support_Screen> {
  List<String> CS_list = ["Telegram","Chat"];
  List<String> imge_list = ["assets/icons/telegram.png","assets/icons/black_chat.png"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:    AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0.0,
        title: Stack(
          alignment: Alignment.center,
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: (){
                    Navigator.pop(context);

                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:   [
                      Image.asset("assets/icons/arrows.png"),
                      const Text(
                        "BACK",style: const TextStyle( height:1  ,fontSize: 15,),)
                    ],),
                )),
            Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: (){

                    if (ZoomDrawer.of(context)!.isOpen()) {
                      ZoomDrawer.of(context)!.close();
                    } else {
                      ZoomDrawer.of(context)!.open();
                    }
                  },
                  child:   Image.asset("assets/icons/hamburger.png"),
                )),

          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Text(Constant.Customer_Support_txt,style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700,fontFamily: 'Times New Roman'),),
             Text(Constant.helpingtxt,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,fontFamily: 'Inter'),),
             // Text(details,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,fontFamily: 'Inter',color: Colors.black),)
              Expanded(
                child: ListView.builder(


                    itemCount: CS_list.length,
                    itemBuilder: (BuildContext context, int index){
                      return
                      GestureDetector(

                        onTap: (){

                          // getcasedetails(openList[index].id);

                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            height: 60,
                            // decoration: BoxDecoration(
                            //   borderRadius: BorderRadius.circular(
                            //     10.0,
                            //   ),
                            //   //border: BoxDecoration(color: Colors.black)
                            // ),
                            decoration: const BoxDecoration(
                              border: Border(
                                top: BorderSide(color:AppColors.whitecolour),
                                bottom: BorderSide(color:AppColors.whitecolour),
                                left: BorderSide(color:AppColors.whitecolour),
                                right: BorderSide(color:AppColors.whitecolour),
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(imge_list[index],scale: 1.5,),
                                      Text(CS_list[index].toString(),style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: Colors.black,fontWeight: FontWeight.w400),),

                                    ],
                                  ),
                                 Image.asset("assets/icons/arrow_right.png",scale: 1.5,)
                                 // Text(corporateList[index].price.toString()+'KD',style: TextStyle(fontFamily: 'Inter',fontSize: 18,color: Colors.black,fontWeight: FontWeight.w700),)
                                ],


                              ),
                            ),
                          ),
                        ),
                      );
                    }
                ),
              ),
             ],

          ),
        ),
      ),

    );
  }
}
