import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:law/Screens/drawer_screen.dart';

import '../../utils/constant.dart';

class profile_screen extends StatefulWidget {
  @override
  _profile_screenState createState() => _profile_screenState();
}

class _profile_screenState extends State<profile_screen> {
  final List<String> prefixname = <String>[Constant.Name_txt, Constant.Email_txt, Constant.Phone_txt,Constant.Gender_txt,Constant.DOB_txt];
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
      body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Constant.My_profile_txt,style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700,fontFamily: 'Times New Roman'),),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Container(
                      color: AppColors.blue_light,
                      height: 100,
                      child: Image.asset(
                        "assets/icons/User_logo.png" ,
                        height: 120.0,
                        width: 100.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(Constant.Balance_txt),
                    Text("323"),
                  ],
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height*.07,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(color:Colors.grey),
                          bottom: BorderSide(color:Colors.grey),
                          left: BorderSide(color:Colors.grey),
                          right: BorderSide(color:Colors.grey),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Row(

                        children: [
                          Expanded(
                            flex :1,
                            child: Text(
                              prefixname[index],style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,fontFamily: 'Inter',color: AppColors.profile_pref_nameclr),),
                          ),

                          Container(width:2,color: AppColors.hintcolour,margin: EdgeInsets.all(5),),
                          Expanded(
                            flex: 3,
                            child: Text(
                              Constant.Name_txt,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,fontFamily: 'Inter',color: Colors.black),),
                          ),
                        ],
                      ),

                    ),
                  );
                },

              ),
            ),

            Container(
              height: MediaQuery.of(context).size.height*.06,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color:Colors.black),
                  bottom: BorderSide(color:Colors.black),
                  left: BorderSide(color:Colors.black),
                  right: BorderSide(color:Colors.black),
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: const Align(
                  alignment: Alignment.center,
                  child:
                  Text(Constant.Edit_Profile_txt,
                    style: const TextStyle(
                      color:Colors.black,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Avenir',
                      fontSize: 14,

                    ),
                  )),

            ),

          ],
        ),
      ),
    );
  }
}
