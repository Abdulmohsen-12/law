import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:law/Screens/drawer_screen.dart';
import 'package:law/api/responses/price_list_response.dart';
import '../../api/responses/errror_respom.dart';
import '../../api/responses/my_orders_response.dart';
import '../../api/responses/casedetails_response.dart';
import '../../api/responses/errror_respom.dart';
import '../../api/responses/my_orders_response.dart';
import '../../api/services/api_service.dart';
import '../../utils/constant.dart';

class Price_list_screen extends StatefulWidget {

  @override
  _Price_list_screenState createState() => _Price_list_screenState();
}

class _Price_list_screenState extends State<Price_list_screen> {
  List<Datum> corporateList = [];
  List<Datum> individuallist = [];
  bool stscode=false;
  late final PriceListResponse _priceListResponse;
  bool iscorporatedclick=true;
  bool isindividualclick=true;
  @override
  void initState() {
    // TODO: implement initState
    APIService.checkAndShowCircularDialog(context, true);
    iscorporatedclick=true;
    isindividualclick=false;
    get();
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
        padding: const EdgeInsets.all(15.0),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Constant.pricelist_txt,style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700,fontFamily: 'Times New Roman'),),
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
                                iscorporatedclick=false;
                                isindividualclick=true;
                              });

                            },
                            child:  !iscorporatedclick?Container(
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
                                  Text(Constant.individual_Txt,textAlign: TextAlign.center,style: TextStyle(fontFamily: 'Inter',fontSize: 15,color: Colors.white)),
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
                                  Text(Constant.individual_Txt,textAlign: TextAlign.center,style: TextStyle(fontFamily: 'Inter',fontSize: 15,color: Colors.black)),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                isindividualclick=false;
                                iscorporatedclick=true;
                              });
                            },
                            child: !isindividualclick? Container(
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
                                  Text(Constant.corporate_Txt,textAlign: TextAlign.center,style: TextStyle(fontFamily: 'Inter',fontSize: 15,color: Colors.white)),
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
                                  Text(Constant.corporate_Txt,textAlign: TextAlign.center,style: TextStyle(fontFamily: 'Inter',fontSize: 15,color: Colors.black)),
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
                child: stscode?ListView.builder(

                    itemCount: iscorporatedclick?corporateList.length:individuallist.length,
                    itemBuilder: (BuildContext context, int index){
                      return iscorporatedclick?GestureDetector(
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
                                  Text(corporateList[index].name.toString(),style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: Colors.black,fontWeight: FontWeight.w400),),
                                  Text(corporateList[index].price.toString()+'KD',style: TextStyle(fontFamily: 'Inter',fontSize: 18,color: Colors.black,fontWeight: FontWeight.w700),)
                                ],


                              ),
                            ),
                          ),
                        ),
                      ):GestureDetector(
                        onTap: (){
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
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(individuallist[index].name.toString(),style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: Colors.black,fontWeight: FontWeight.w400),),
                                  Text(individuallist[index].price.toString()+'KD',style: TextStyle(fontFamily: 'Inter',fontSize: 18,color: Colors.black,fontWeight: FontWeight.w700),)
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
    String _responseBody = await APIService.getdataa( Route: ApiRoute.price_list,
        context: context,
        show_CircularDialog: false, data: "");
    print(_responseBody);
    statuscode codeResponse =
    errorcodeFromJson(_responseBody);
    print(codeResponse.statusCode);
    if(codeResponse.statusCode==200){
     // APIService.checkAndShowCircularDialog(context, true);

      setState(() {
        stscode=true;
        _priceListResponse = priceListResponseFromJson(_responseBody.toString());
      });
      print(_priceListResponse.data);


      for (final item in  _priceListResponse.data){
        corporateList.add(item);
        print( _priceListResponse.data.length);


      }
      // for (final item in  casedeOrders_response.data.closed){
      //   closedlist.add(item);
      //   print( casedeOrders_response.data.closed.length);
      //
      //
      // }
    }


  }
}

