

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:law/utils/Views.dart';
import 'package:law/utils/constant.dart';
import 'package:audio_waveforms/audio_waveforms.dart';

import '../api/responses/casedetails_response.dart';
import '../api/services/api_service.dart';
import 'Contract_draft/contract_drafting.dart';
import 'Contract_draft/extraservice.dart';
import 'drawer_screen.dart';
import 'home.dart';

class Orderdetails extends StatefulWidget {
  final int Order_Id;
  const Orderdetails({Key? key, required this.Order_Id}) : super(key: key);

  @override
  State<Orderdetails> createState() => _OrderdetailsState();
}

class _OrderdetailsState extends State<Orderdetails> {
  bool isinfoclick=true;
  bool isindoclick=true;
  bool isradiolick=false;
  bool isdeletelick=false;
  RecorderController recordcontroller = RecorderController();

  String clientsname="";
  String court_location="";
  int case_status=0;
  String Service_name="";
  String contract_term="";
  String purpouse="";
  String details="";
  String Order="";
  String ammount="";
  String deadline="";
  String chamber="";
  String case_no="";
  String against="";
  String capacity="";
  String capacity2nd="";
  String floor_room="";
  String automated="";


  @override
  void initState() {
    // TODO: implement initState
    APIService.checkAndShowCircularDialog(context, true);
    isinfoclick=false;
    isindoclick=true;
    isradiolick=false;
    isdeletelick=false;
    getcasedetails();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final TextEditingController _servicetype_editing_C = TextEditingController();
    final TextEditingController _amount_editing_C = TextEditingController();

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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(

              children: [
                Container(
                  child: Column(
                    children: [
                      ///order information
                      Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:  Service_name.contains("case-lawsuit")?Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    top: BorderSide(color:AppColors.hintcolour),
                                    bottom: BorderSide(color:AppColors.hintcolour),
                                    left: BorderSide(color:AppColors.hintcolour),
                                    right: BorderSide(color:AppColors.hintcolour),
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child:Column(

                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(clientsname,style: TextStyle(fontFamily:'Inter',color: Colors.black,fontWeight:FontWeight.w500 ),),
                                          Text(court_location,style: TextStyle(fontFamily:'Inter',color: Colors.black,fontWeight:FontWeight.w500 ),),
                                          case_status==0?Container(
                                            decoration: const BoxDecoration(
                                              color: Colors.green,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 8.0,right: 8,top: 2,bottom: 2),
                                              child: Text("Open",style: TextStyle(color: Colors.white),),
                                            ),
                                          ):Container(
                                            decoration: const BoxDecoration(
                                              color: Colors.red,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 8.0,right: 8,top: 2,bottom: 2),
                                              child: Text("Close",style: TextStyle(color: Colors.white),),
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                                      child: Container(height: 1,
                                        color: AppColors.hintcolour,),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text("10/09/2022 ",style: TextStyle(fontFamily:'Inter',color: Colors.black,fontWeight:FontWeight.w500 ),),

                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                                      child: Container(height: 1,
                                        color: AppColors.hintcolour,),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(chamber,style: TextStyle(fontFamily:'Inter',color: Colors.black,fontWeight:FontWeight.w500 ),),
                                          Text(case_no,style: TextStyle(fontFamily:'Inter',color: Colors.black,fontWeight:FontWeight.w500 ),),

                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                                      child: Container(height: 1,
                                        color: AppColors.hintcolour,),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(against,style: TextStyle(fontFamily:'Inter',color: Colors.black,fontWeight:FontWeight.w500 ),),
                                          Text(capacity2nd,style: TextStyle(fontFamily:'Inter',color: Colors.black,fontWeight:FontWeight.w500 ),),

                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                                      child: Container(height: 1,
                                        color: AppColors.hintcolour,),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(floor_room,style: TextStyle(fontFamily:'Inter',color: Colors.black,fontWeight:FontWeight.w500 ),),
                                          Text(automated,style: TextStyle(fontFamily:'Inter',color: Colors.black,fontWeight:FontWeight.w500 ),),

                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                                      child: Container(height: 1,
                                        color: AppColors.hintcolour,),
                                    ),
                                    // ignore: prefer_const_constructors
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("",style: TextStyle(fontFamily:'Inter',color: Colors.black,fontWeight:FontWeight.w500 ),),
                                        Text(Order,style: TextStyle(fontFamily:'Inter',color: Colors.black,fontWeight:FontWeight.w500 ),),
                                        PopupMenuButton(
                                          icon: Icon(Icons.more_vert),
                                          itemBuilder: (context) {
                                            return [
                                              PopupMenuItem(
                                                value: 'edit',
                                                child: Text('Edit'),
                                              ),
                                              PopupMenuItem(
                                                value: 'delete',
                                                child: Text('Delete'),
                                              )
                                            ];
                                          },
                                          onSelected: (String value) => actionPopUpItemSelected(value, "name"),
                                        ),
                                      ],
                                    )

                                  ],
                                ),

                              ):Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    top: BorderSide(color:AppColors.hintcolour),
                                    bottom: BorderSide(color:AppColors.hintcolour),
                                    left: BorderSide(color:AppColors.hintcolour),
                                    right: BorderSide(color:AppColors.hintcolour),
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child:Column(

                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(clientsname,style: TextStyle(fontFamily:'Inter',color: Colors.black,fontWeight:FontWeight.w500 ),),
                                          case_status==0?Container(
                                            decoration: const BoxDecoration(
                                              color: Colors.green,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 8.0,right: 8,top: 2,bottom: 2),
                                              child: Text("Open",style: TextStyle(color: Colors.white),),
                                            ),
                                          ):Container(
                                            decoration: const BoxDecoration(
                                              color: Colors.red,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 8.0,right: 8,top: 2,bottom: 2),
                                              child: Text("Close",style: TextStyle(color: Colors.white),),
                                            ),
                                          ),
                                          PopupMenuButton(
                                            icon: Icon(Icons.more_vert),
                                            itemBuilder: (context) {
                                              return [
                                                PopupMenuItem(
                                                  value: 'edit',
                                                  child: Text('Edit'),
                                                ),
                                                PopupMenuItem(
                                                  value: 'delete',
                                                  child: Text('Delete'),
                                                )
                                              ];
                                            },
                                            onSelected: (String value) => actionPopUpItemSelected(value, "name"),
                                          ),
                                          //Image.asset("assets/icons/threedot.png",scale: 2,)
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                                      child: Container(height: 1,
                                      color: AppColors.hintcolour,),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(Service_name,style: TextStyle(fontFamily:'Inter',color: Colors.black,fontWeight:FontWeight.w500 ),),
                                          Text("10/09/2022 ",style: TextStyle(fontFamily:'Inter',color: Colors.black,fontWeight:FontWeight.w500 ),),

                                        ],
                                      ),
                                    ),
                                    !contract_term.isEmpty || !ammount.isEmpty  ? Padding(
                                      padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                                      child: Container(height: 1,
                                        color: AppColors.hintcolour,),
                                    ):Container(),
                                    !contract_term.isEmpty || !ammount.isEmpty  ?Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          !contract_term.isEmpty?Text(contract_term,style: TextStyle(fontFamily:'Inter',color: Colors.black,fontWeight:FontWeight.w500 ),):Container(),
                                          !ammount.isEmpty?Text(ammount,style: TextStyle(fontFamily:'Inter',color: Colors.black,fontWeight:FontWeight.w500 ),):Container(),

                                        ],
                                      ),
                                    ):Container(),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                                      child: Container(height: 1,
                                        color: AppColors.hintcolour,),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("10/09/2022 ",style: TextStyle(fontFamily:'Inter',color: Colors.black,fontWeight:FontWeight.w500 ),),
                                          Text(purpouse,style: TextStyle(fontFamily:'Inter',color: Colors.black,fontWeight:FontWeight.w500 ),),

                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                                      child: Container(height: 1,
                                        color: AppColors.hintcolour,),
                                    ),
                                    // ignore: prefer_const_constructors
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Align(
                                          alignment: Alignment.centerRight,
                                          child:   Text(Order,style: TextStyle(fontFamily:'Inter',color: Colors.black,fontWeight:FontWeight.w500 ),)
                                    ))

                                  ],
                                ),
                              ),
                            )

                          ],
                        ),
                      ),
                      ///order attachment
                      isindoclick?  Container (
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0,right: 10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(Constant.attachment_txt,style: TextStyle(fontFamily:'Inter',color: Colors.black,fontWeight:FontWeight.w500 ),),
                                  PopupMenuButton(
                                    icon: Icon(Icons.more_vert),
                                    itemBuilder: (context) {
                                      return [
                                        PopupMenuItem(
                                          value: 'edit',
                                          child: Text('Edit'),
                                        ),
                                        PopupMenuItem(
                                          value: 'delete',
                                          child: Text('Delete'),
                                        )
                                      ];
                                    },
                                    onSelected: (String value) => actionPopUpItemSelected(value, "name"),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5,),
                              Column(
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width,
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
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Visibility(
                                                visible: false,
                                                child: GestureDetector(
                                                  onTap: (){
                                                    setState(() {
                                                      isradiolick=true;
                                                      print(isradiolick);
                                                    });

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

                                                  ):Container(
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
                                              ),
                                              Text("Maps"),
                                              isradiolick?GestureDetector(
                                                  onTap: (){
                                                    setState(() {
                                                      isdeletelick=true;
                                                    });
                                                  },
                                                  child: Image.asset("assets/icons/delete.png",fit: BoxFit.fill,scale: 1.5,)):Container()


                                            ],
                                          ),
                                        ),

                                      ),
                                      SizedBox(height: 5,),
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(Constant.service_provide_txt,textAlign:TextAlign.left,style: TextStyle(fontFamily:'Inter',color: Colors.black,fontWeight:FontWeight.w500, ),)),
                                      Container(
                                        width: MediaQuery.of(context).size.width,
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
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Visibility(
                                                visible: false,
                                                child: GestureDetector(
                                                  onTap: (){
                                                    setState(() {
                                                      isradiolick=true;
                                                      print(isradiolick);
                                                    });

                                                  },
                                                  child:
                                                  isradiolick?Container(
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

                                                  ):Container(
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
                                              ),
                                              Text("Maps"),
                                              isradiolick?GestureDetector(
                                                  onTap: (){
                                                    setState(() {
                                                      isdeletelick=true;
                                                    });
                                                  },
                                                  child: Image.asset("assets/icons/delete.png",fit: BoxFit.fill,scale: 1.5,)):Container()


                                            ],
                                          ),
                                        ),

                                      ),
                                      SizedBox(height: 5,),
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(Constant.service_provide_txt,textAlign:TextAlign.left,style: TextStyle(fontFamily:'Inter',color: Colors.black,fontWeight:FontWeight.w500, ),)),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: const BoxDecoration(
                                  color: AppColors.boxbackground,
                                border: Border(
                                  top: BorderSide(color:AppColors.hintcolour),
                                  bottom: BorderSide(color:AppColors.hintcolour),
                                  left: BorderSide(color:AppColors.hintcolour),
                                  right: BorderSide(color:AppColors.hintcolour),
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: Column(
                                children:  [
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Align(

                                        alignment: Alignment.centerLeft,
                                        child: Text("Details",style: TextStyle(fontFamily:'Inter',color: AppColors.blue_light,fontWeight:FontWeight.w500 ),)),

                                  ),
                                  Padding(
                                    padding:  EdgeInsets.only(left: 8.0,right: 8.0),
                                    child: Container(height: 1,
                                      color: AppColors.hintcolour,),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8.0,right: 8,top: 10,bottom: 30),
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(details,style: TextStyle(fontFamily:'Inter',color:Colors.black,fontWeight:FontWeight.w500 ),)),

                                  ),
                                ],
                              ),

                              ),
                              SizedBox(height: 10,),
                              Container(
                                padding: EdgeInsets.only(left: 3,right: 3),
                                child: Row(
                                  children: [
                                    Text("Voice",
                                      style: const TextStyle(
                                        color:Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Avenir',
                                        fontSize: 14,

                                      ),
                                    ),


                                    Container(
                                      decoration: const BoxDecoration(

                                        color: AppColors.boxbackground,
                                        borderRadius: BorderRadius.all(

                                          Radius.circular(10),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                            onTap: (){
                                            //  startrecord();
                                            },
                                            child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Image.asset("assets/images/CDmic.png",scale: .9,)),
                                          ),
                                          Container(


                                            child: AudioWaveforms(
                                              size: Size((width*1.18)/2, 50.0),
                                              recorderController: recordcontroller  ,

                                              waveStyle: WaveStyle(
                                                waveColor: Colors.black,
                                                showDurationLabel: false,
                                                spacing: 8.0,
                                                showBottom: true ,
                                                extendWaveform: true,
                                                showMiddleLine: false,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ):Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: const BoxDecoration(
                                  border: Border(
                                    top: BorderSide(color:AppColors.hintcolour),
                                    bottom: BorderSide(color:AppColors.hintcolour),
                                    left: BorderSide(color:AppColors.hintcolour),
                                    right: BorderSide(color:AppColors.hintcolour),
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: Column(
                                  children:  [
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Align(
                                          alignment: Alignment.center,
                                          child: Text("Documents",style: TextStyle(fontFamily:'Inter',color: Colors.black,fontWeight:FontWeight.w700 ),)),
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.only(left: 8.0,right: 8.0),
                                      child: Container(height: 1,
                                        color: AppColors.hintcolour,),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Whitebutton(btntext: 'Construction Agreement.Pdf',),
                                    ),
                                    SizedBox(height: 5,),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0,right: 8,bottom: 8),
                                      child: Align(
                alignment: Alignment.centerLeft,
                child: Text(Constant.service_provide_txt,style: TextStyle(fontFamily:'Inter',color: Colors.black,fontWeight:FontWeight.w500 ),)),
                                    )

                                  ],
                                ),

                              ),

                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                ///botominfo
                ///
                // SizedBox(height: 10,),

              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,

              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 8,bottom: 8),
                  child: const imgtxtbutton(btntext: Constant.chat_provide_txt),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 8,bottom: 8),
                  child: GestureDetector(

                      onTap: (){
                        showDialog(context: context, builder:  (BuildContext context) =>   extra_dialog(docdescrip_editing_C: _servicetype_editing_C, date_editing_C: _amount_editing_C, label1: Constant.servicetype_txt, label2: Constant.amount_txt, titletext: Constant.extra_serv_txt,));

                      },
                      child: const Whitebutton(btntext: Constant.extra_serv_txt)),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0,right: 8,bottom: 8),
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
                                  isinfoclick=false;
                                  isindoclick=true;
                                });

                              },
                              child:  !isinfoclick?Container(
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
                                    Image.asset("assets/icons/informationICOn.png",color: Colors.white,scale: 1.3,),
                                    SizedBox(width: 5,),
                                    Text(Constant.information,textAlign: TextAlign.center,style: TextStyle(fontFamily: 'Inter',fontSize: 15,color: Colors.white)),
                                  ],
                                ),
                              ):Container(
                                height: MediaQuery.of(context).size.height,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    10.0,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/icons/informationICOn.png",color: Colors.black,scale: 1.3,),
                                    SizedBox(width: 5),
                                    Text(Constant.information,textAlign: TextAlign.center,style: TextStyle(fontFamily: 'Inter',fontSize: 15,color: Colors.black)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  isindoclick=false;
                                  isinfoclick=true;
                                });
                              },
                              child: !isindoclick? Container(

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
                                    Image.asset("assets/icons/documents.png",color: Colors.white,scale: 1.3,),
                                    SizedBox(width: 5),
                                    Text(Constant.Documents,textAlign: TextAlign.center,style: TextStyle(fontFamily: 'Inter',fontSize: 15,color: Colors.white)),
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
                                    Image.asset("assets/icons/documents.png",color: Colors.black,scale: 1.3,),
                                    SizedBox(width: 5),
                                    Text(Constant.Documents,textAlign: TextAlign.center,style: TextStyle(fontFamily: 'Inter',fontSize: 15,color: Colors.black)),
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
              ],
            ),
          ],
        ),
      ),
    );
  }
  Future<void> getcasedetails() async {
    String _responseBody = await APIService.getdataa(data: widget.Order_Id,   Route: ApiRoute.case_details,
        context: context,
        show_CircularDialog: false);
    print(_responseBody);
    CaseDetailsResponse casedetials_response = caseDetailsResponseFromJson(_responseBody);
    if(casedetials_response.statusCode==200) {
      APIService.checkAndShowCircularDialog(context, true);

      setState(() {
        // print("responses"+casedetials_response.data.clientName);
        clientsname = casedetials_response.data.clientName!;
        Service_name = casedetials_response.data.serviceName;
        if (casedetials_response.data.contractTerm != null) {
          contract_term = casedetials_response.data.contractTerm!;
        }
        if (casedetials_response.data.purpouse != null) {
          purpouse = casedetials_response.data.purpouse!;
        }
        if (casedetials_response.data.contractAmmount != null) {
          ammount = casedetials_response.data.contractAmmount!;
        }
        if (casedetials_response.data.details != null) {
          details = casedetials_response.data.details!;
        }
        if (casedetials_response.data.deadline != null) {
          deadline = casedetials_response.data.deadline.toString();
        }
        if (casedetials_response.data.courtLocation != null) {
          court_location = casedetials_response.data.courtLocation;
        }
        if (casedetials_response.data.chamber != null) {
          chamber = casedetials_response.data.chamber;
        }
        if (casedetials_response.data.courtCaseNo != null) {
          case_no = casedetials_response.data.courtCaseNo;
        }
        if (casedetials_response.data.against != null) {
          against = casedetials_response.data.against;
        }
        if (casedetials_response.data.capacity2 != null) {
          capacity2nd = casedetials_response.data.capacity2;
        }

        case_status = casedetials_response.data.caseStatus;
        Order = casedetials_response.data.orderNo;
      });
    }

    print("responses"+clientsname);

  }
  void actionPopUpItemSelected(String value, String name) {
    String message;
    if (value == 'edit') {
      showDialog(context: context, builder:  (BuildContext context) => Contract_draft_Dialog(update: true,caseID: widget.Order_Id,));
      message = 'You selected edit for $name';
    } else if (value == 'delete') {
      message = 'You selected delete for $name';
    } else {
      message = 'Not implemented';
    }
    final snackBar = SnackBar(content: Text(message));
  }
}
