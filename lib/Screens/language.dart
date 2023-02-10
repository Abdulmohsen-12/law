import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../utils/constant.dart';

class Language_screen extends StatefulWidget {
  @override
  _Language_screenState createState() => _Language_screenState();
}

class _Language_screenState extends State<Language_screen> {
  List<String> language_list = ["English","Arabic"];
  List<bool> isradiolick = [false,false];
  @override
  void initState() {
    // TODO: implement initState
    //isradiolick=false;
    super.initState();
  }
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
              Text(Constant.Language_txt,style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700,fontFamily: 'Times New Roman'),),
               SizedBox(height: 10,),
              // Text(details,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,fontFamily: 'Inter',color: Colors.black),)
              Expanded(
                child: ListView.builder(


                    itemCount: language_list.length,
                    itemBuilder: (BuildContext context, int index){
                      return
                        GestureDetector(

                          onTap: (){
                            setState(() {
                              if(isradiolick[0]==true){
                                isradiolick[0]=false;
                              }else{
                                isradiolick[0]=true;
                              }

                            });

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
                                    Text(language_list[index].toString(),style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: Colors.black,fontWeight: FontWeight.w400),),
                                    isradiolick[index]? Container(
                                      height: 20,
                                      width: 20,
                                      decoration:  BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.red,
                                        border:Border.all(
                                            color:Colors.black,
                                            width:1
                                        ),
                                        image: DecorationImage(
                                          image: AssetImage("assets/images/Contrctdraft_title_BG.png"),
                                          fit: BoxFit.cover,
                                        ),

                                      ),
                                      child: Image.asset("assets/icons/checktik.png"),

                                    ):
                                    Container(
                                      height: 20,
                                      width: 20,
                                      decoration:  BoxDecoration(
                                        shape: BoxShape.circle,
                                        border:Border.all(
                                            color:Colors.black,
                                            width:1
                                        ),

                                      ),
                                    ),
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
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image:DecorationImage(
                image: AssetImage(
                    'assets/images/Contrctdraft_title_BG.png'),
                fit: BoxFit.fill,
              ),

              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Save",style: TextStyle(fontFamily: 'Inter',color: Colors.white),),
                ],
              ),
            ),

          )
            ],

          ),
        ),
      ),

    );
  }
}
