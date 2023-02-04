import 'package:flutter/material.dart';
import 'package:law/Screens/drawer_screen.dart';
import 'package:law/Screens/orderdetails.dart';
import 'package:law/Screens/price_list.dart';
import 'package:law/Screens/profile/myprofile.dart';
import 'package:law/utils/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Calander.dart';
import 'authentication/login.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.blue_light,

      body: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 190,),
              Container(

                child: GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                        MaterialPageRoute(builder:
                            (context) =>
                            DrawerScreen(place: Profile_screen())),
                      );
                    },
                    child: Text(Constant.Profile_txt,style:TextStyle(fontSize: 16,fontFamily: 'Inter',fontWeight:FontWeight.w400,color: Colors.white),)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0,bottom: 20),
                child: Container(height: 1,width: 150,color: Colors.white,),
              ),

              Container(

                child: GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                        MaterialPageRoute(builder:
                            (context) =>
                            DrawerScreen(place: chalander_screen())),
                      );
                    },
                    child: Text(Constant.Schedule_txt,style:TextStyle(fontSize: 16,fontFamily: 'Inter',fontWeight:FontWeight.w400,color: Colors.white),)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0,bottom: 20),
                child: Container(height: 1,width: 150,color: Colors.white,),
              ),
              Container(

                child: GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                        MaterialPageRoute(builder:
                            (context) =>
                            DrawerScreen(place: Profile_screen())),
                      );
                    },
                    child: Text(Constant.Orders_txt,style:TextStyle(fontSize: 16,fontFamily: 'Inter',fontWeight:FontWeight.w400,color: Colors.white),)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0,bottom: 20),
                child: Container(height: 1,width: 150,color: Colors.white,),
              ),
              Container(

                child: GestureDetector(
                    onTap: (){

                    },
                    child: Text(Constant.Customer_Support_txt,style:TextStyle(fontSize: 16,fontFamily: 'Inter',fontWeight:FontWeight.w400,color: Colors.white),)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0,bottom: 20),
                child: Container(height: 1,width: 150,color: Colors.white,),
              ),
              Container(

                child: GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                        MaterialPageRoute(builder:
                            (context) =>
                            DrawerScreen(place: Price_list_screen())),
                      );
                    },
                    child: Text(Constant.pricelist_txt,style:TextStyle(fontSize: 16,fontFamily: 'Inter',fontWeight:FontWeight.w400,color: Colors.white),)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0,bottom: 20),
                child: Container(height: 1,width: 150,color: Colors.white,),
              ),
              Container(

                child: GestureDetector(
                    onTap: (){

                    },
                    child: Text(Constant.FAQs_txt,style:TextStyle(fontSize: 16,fontFamily: 'Inter',fontWeight:FontWeight.w400,color: Colors.white),)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0,bottom: 20),
                child: Container(height: 1,width: 150,color: Colors.white,),
              ),
              Container(

                child: GestureDetector(
                    onTap: (){

                    },
                    child: Text(Constant.Language_txt,style:TextStyle(fontSize: 16,fontFamily: 'Inter',fontWeight:FontWeight.w400,color: Colors.white),)),
              ),
              SizedBox(height: 130,),
              Container(

                child: GestureDetector(
                    onTap: (){
                      removepreference("accesstoken");
                    },
                    child: Text(Constant.Sign_out_txt,style:TextStyle(fontSize: 16,fontFamily: 'Inter',fontWeight:FontWeight.w400,color: Colors.white),)),
              ),

            ],
          ),
        ),
      ),
    );
  }
  Future removepreference(String key) async {
    SharedPreferences prefrences = await SharedPreferences.getInstance();
    prefrences.remove(key);
    Navigator.push(context,
      MaterialPageRoute(builder:
          (context) =>

          LoginScreen()),
    );

  }
}