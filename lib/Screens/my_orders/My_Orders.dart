
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:law/Screens/drawer_screen.dart';

import '../../api/responses/casedetails_response.dart';
import '../../api/responses/errror_respom.dart';
import '../../api/responses/my_orders_response.dart';
import '../../api/services/api_service.dart';
import '../../utils/constant.dart';
import '../orderdetails.dart';

class My_order_screen extends StatefulWidget {
  @override
  _My_order_screenState createState() => _My_order_screenState();
}

class _My_order_screenState extends State<My_order_screen> {
  List<Open> openList = [];
  List<Open> closedlist = [];
  bool statuscodeq=false;
    late final MyOrdersResponse casedeOrders_response;
  bool isopendclick=true;
  bool iscloseclick=true;
  @override
  void initState() {
    // TODO: implement initState
    APIService.checkAndShowCircularDialog(context, true);
   // print(casedeOrders_response);

    get();
    isopendclick=true;
    iscloseclick=false;
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
            Align  (
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
        padding: const EdgeInsets.all(15.0),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Constant.my_order_txt,style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700,fontFamily: 'Times New Roman'),),
              SizedBox(height: 10,),
              Container(
                child:    Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                      color: AppColors.boxbackground,
                    ),
                    // ignore: avoid_unnecessary_containers
                    child:  Row(

                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                isopendclick=false;
                                iscloseclick=true;
                              });

                            },
                            child:  !isopendclick?Container(
                              height: MediaQuery.of(context).size.height,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  10.0,
                                ),
                                image:DecorationImage(
                                  image: AssetImage(
                                      'assets/images/Contrctdraft_title_BG.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(Constant.closed_txt+'(''${(closedlist.length)}'')',textAlign: TextAlign.center,style: TextStyle(fontFamily: 'Inter',fontSize: 15,color: Colors.white)),
                                ],
                              ),
                            ):
                            Container(
                              height: MediaQuery.of(context).size.height,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  10.0,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(Constant.closed_txt+'(''${(closedlist.length)}'')',textAlign: TextAlign.center,style: TextStyle(fontFamily: 'Inter',fontSize: 15,color: Colors.black)),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                iscloseclick=false;
                                isopendclick=true;
                              });
                            },
                            child: !iscloseclick? Container(
                              height: MediaQuery.of(context).size.height,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    10.0,
                                  ),
                                  image:const DecorationImage(
                                    image: AssetImage(
                                        'assets/images/Contrctdraft_title_BG.png'),
                                    fit: BoxFit.fill,
                                  )

                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(Constant.open_txt+'(''${(openList.length)}'')',textAlign: TextAlign.center,style: TextStyle(fontFamily: 'Inter',fontSize: 15,color: Colors.white)),
                                ],
                              ),
                            ): Container(
                              height: MediaQuery.of(context).size.height,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  10.0,
                                ),

                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(Constant.open_txt+'(''${(openList.length)}'')',textAlign: TextAlign.center,style: TextStyle(fontFamily: 'Inter',fontSize: 15,color: Colors.black)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                  ),
                ),
              ),
              Expanded(
                child: statuscodeq?ListView.builder(

                itemCount: isopendclick?openList.length:closedlist.length,
                    itemBuilder: (BuildContext context, int index){
                      return isopendclick?GestureDetector(
                        onTap: (){
                          Navigator.pushReplacement(context,
                            MaterialPageRoute(builder:
                                (context) =>
                                DrawerScreen(place: Orderdetails(Order_Id: openList[index].id,))),
                          );

                         // getcasedetails(openList[index].id);

                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                10.0,
                              ),
                              color: Colors.green,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(openList[index].orderNo,style: TextStyle(fontFamily: 'Inter',fontSize: 15,color: Colors.white),),
                                  Text(openList[index].service_name.toString(),style: TextStyle(fontFamily: 'Inter',fontSize: 15,color: Colors.white),),
                                  Text("Open",style: TextStyle(fontFamily: 'Inter',fontSize: 15,color: Colors.white),)
                                ],


                              ),
                            ),
                          ),
                        ),
                      ):GestureDetector(
                        onTap: (){
                          Navigator.pushReplacement(context,
                            MaterialPageRoute(builder:
                                (context) =>
                                DrawerScreen(place: Orderdetails(Order_Id: closedlist[index].id,))),
                          );
                        // getcasedetails(closedlist[index].id);

                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                10.0,
                              ),
                              color: Colors.red,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(closedlist[index].orderNo,style: TextStyle(fontFamily: 'Inter',fontSize: 15,color: Colors.white),),
                                  Text(closedlist[index].id.toString(),style: TextStyle(fontFamily: 'Inter',fontSize: 15,color: Colors.white),),
                                  Text("Closed",style: TextStyle(fontFamily: 'Inter',fontSize: 15,color: Colors.white),)
                                ],


                              ),
                            ),
                          ),
                        ),
                      );

                    }
                    ):Container(),
              ),
            ],
          ),
        ),
      ),

    );
  }
  Future get() async {
    String _responseBody = await APIService.getdataa( Route: ApiRoute.case_orders,
        context: context,
        show_CircularDialog: false, data: "");
    print(_responseBody);
    statuscode codeResponse =
    errorcodeFromJson(_responseBody);
    print(codeResponse.statusCode);
    if(codeResponse.statusCode==200){
      APIService.checkAndShowCircularDialog(context, true);

      setState(() {
        statuscodeq=true;
        casedeOrders_response = myOrdersResponseFromJson(_responseBody.toString());
      });
      print(casedeOrders_response.data.open);


      for (final item in  casedeOrders_response.data.open){
        openList.add(item);
        print( casedeOrders_response.data.open.length);


      }
      for (final item in  casedeOrders_response.data.closed){
        closedlist.add(item);
        print( casedeOrders_response.data.closed.length);


      }
    }


  }


}
