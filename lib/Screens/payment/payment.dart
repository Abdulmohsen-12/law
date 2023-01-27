import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:law/utils/Views.dart';


class Payment_screen extends StatefulWidget {
  const Payment_screen({Key? key}) : super(key: key);

  @override
  State<Payment_screen> createState() => _Payment_screenState();
}

class _Payment_screenState extends State<Payment_screen> {
  final List<String> entries = <String>['Visa Card', 'Master Card', 'Knet'];
  final List<bool> clicked = <bool>[true,false,true];
  final List<String> images = <String>['assets/images/mastercard.png', 'assets/images/mastercard.png', 'assets/images/mastercard.png'];
  bool isradiolick=false;
  @override
  void initState() {
    // TODO: implement initState
    isradiolick=false;
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
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Payment method",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700,fontFamily: 'Times New Roman'),),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,

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
              child: Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          itemCount: entries.length,
                          itemBuilder: (BuildContext context, int index){
                            return Container(

                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          isradiolick=clicked[index];

                                          print(isradiolick);
                                        });
                                        // if(isradiolick){
                                        //   isradiolick=false;
                                        // }
                                      },
                                      child: isradiolick?Container(
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
                                    ),
                                    SizedBox(width: 5,),
                                    Image.asset(images[index],scale: 2,),
                                    SizedBox(width: 5,),
                                    Text(entries[index],style: TextStyle(fontFamily: 'Inter',fontSize: 15),)
                                  ],


                                ),
                              ),
                            );

                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0,right: 140,bottom: 8),
                      child: Whitebutton(btntext: "+ Add new method"),
                    )

                  ],
                ),
              ),

            )
          ],
        ),
      ),

    );
  }
}
