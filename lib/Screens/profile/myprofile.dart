import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:law/Screens/drawer_screen.dart';
import 'package:law/Screens/home.dart';
import 'package:law/Screens/profile/edit_profile.dart';
import 'package:law/api/responses/profile_response.dart';
import 'package:law/api/services/api_service.dart';

import '../../utils/constant.dart';

class Profile_screen extends StatefulWidget {
  @override
  _Profile_screenState createState() => _Profile_screenState();
}

class _Profile_screenState extends State<Profile_screen> {
  int balance= 0;
  static var profile_name = "";
  static var  profile_email ="";
  static var profile_phone="";
  static var profile_gender="";
  static var profile_dob="";
  final TextEditingController _tcController =
  TextEditingController();
  final List<String> prefixname = <String>[Constant.Name_txt, Constant.Email_txt, Constant.Phone_txt,Constant.Gender_txt,Constant.DOB_txt];
  // ignore: non_constant_identifier_names
   List<String> p_response_list = <String>[];
  @override
  void initState() {
    // TODO: implement initState
    getprofiles();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    _tcController.text="adf";
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
                    //Navigator.pop(context);
                    Navigator.pushReplacement(context,
                      MaterialPageRoute(builder:
                          (context) =>
                          DrawerScreen(place:Home_Screen())),
                    );

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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ClipRRect(
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
                  SizedBox(width: 5,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Constant.Balance_txt,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,fontFamily: 'Inter',color: Colors.black,),),
                      Text(
                        balance.toString(),style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w400,fontFamily: 'Inter',color: Colors.black,),),
                    ],
                  )
                ],
              ),
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
                          // Expanded(
                          //   flex: 3,
                          //   child: TextFormField(
                          //     enabled: false,
                          //     controller: _tcController,
                          //     decoration:   InputDecoration(
                          //       border:
                          //       OutlineInputBorder(
                          //         borderSide: BorderSide(
                          //           width: 0,
                          //           style: BorderStyle.none,
                          //         ),
                          //       ),
                          //       hintStyle: TextStyle(
                          //         fontSize: 15.0,
                          //         fontWeight: FontWeight.w400,
                          //         color: Colors.black,
                          //       ),
                          //
                          //     ),
                          //   ),
                          // ),
                         p_response_list.length>0? Expanded(
                            flex: 3,
                            child: Text(
                              p_response_list[index],style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,fontFamily: 'Inter',color: Colors.black),),
                          ):Expanded(
                           flex: 3,
                           child: Text(
                             "",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,fontFamily: 'Inter',color: Colors.black),),
                         ),
                        ],
                      ),

                    ),
                  );
                },

              ),
            ),

            GestureDetector(
              onTap:(){
                setState(() {
                  Navigator.push(context,
                    MaterialPageRoute(builder:
                        (context) =>
                        DrawerScreen(place: Edit_profile_screen(profile_values: p_response_list,))),
                  );
                });
              },
              child: Container(
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
            ),

          ],
        ),
      ),
    );
  }
  Future<void> getprofiles() async {
    String _responseBody = await APIService.getAPI(Route: ApiRoute.profile , context: context, show_CircularDialog: false);
    ProfileResponse profileResponse = profileResponseFromJson(_responseBody);
    print(_responseBody);
    if(profileResponse.statusCode==200){
      setState(() {
        profile_name=profileResponse.data.userInfo.name;
        profile_email=profileResponse.data.userInfo.email;
        profile_gender=profileResponse.data.userInfo.gender;
        profile_phone=profileResponse.data.userInfo.phoneNo;
        DateTime p = DateTime.parse(profileResponse.data.userInfo.dob.toString());
        profile_dob=profileResponse.data.userInfo.dob.toString();
        p_response_list = <String>[profile_name,profile_email,profile_phone,profile_gender,profile_dob];
      });


    }

  }
}
