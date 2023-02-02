import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:law/Screens/drawer_screen.dart';
import 'package:law/utils/Views.dart';

import '../../api/services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../utils/constant.dart';

class Edit_profile_screen extends StatefulWidget {
  final List<String> profile_values;
  Edit_profile_screen({ Key? key, required this.profile_values});
  @override
  _Edit_profile_screenState createState() => _Edit_profile_screenState();
}

class _Edit_profile_screenState extends State<Edit_profile_screen> {
  bool edit_profile_clicked =false ;
  bool  _passwordVisible=false;
  final TextEditingController _tcontrollerName =
  TextEditingController();
  final TextEditingController _tcontrolleremail =
  TextEditingController();
  final TextEditingController _tcontrollerphone =
  TextEditingController();
  final TextEditingController _tcontrollergender =
  TextEditingController();
  final TextEditingController _tcontrollerdob =
  TextEditingController();
  final TextEditingController _tcontrollercurrentpass =
  TextEditingController();
  final TextEditingController _tcontrollernewpass =
  TextEditingController();
  final TextEditingController _tcontrollerconfirms =
  TextEditingController();
  final List<String> prefixname = <String>[Constant.Name_txt, Constant.Email_txt, Constant.Phone_txt,Constant.Gender_txt,Constant.DOB_txt];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    edit_profile_clicked=false;
    _passwordVisible=false;
    _tcontrollerName.text=widget.profile_values[0];
    _tcontrolleremail.text=widget.profile_values[1];
    _tcontrollerphone.text=widget.profile_values[2];
    _tcontrollergender.text=widget.profile_values[3];
    _tcontrollerdob.text=widget.profile_values[4];




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

          ],
        ),
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Constant.My_profile_txt,style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700,fontFamily: 'Times New Roman'),),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Container(
                      color: AppColors.boxbackground,
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
                  Container(
                    height: MediaQuery.of(context).size.height*.05,
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
                        Text(Constant.profile_upload_txt,
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
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height*.07,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: const BoxDecoration(
                    color: AppColors.boxbackground,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Row(

                    children: [
                      Expanded(
                        flex :1,
                        child: Text(
                          prefixname[0],style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,fontFamily: 'Inter',color: AppColors.profile_pref_nameclr),),
                      ),

                      Container(width:2,color: AppColors.hintcolour,margin: EdgeInsets.all(5),),
                      Expanded(
                        flex: 3,
                        child: TextFormField(

                          controller: _tcontrollerName,
                          decoration:   InputDecoration(
                            border:
                            OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                            hintStyle: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),

                          ),
                        ),
                      ),
                      // Expanded(
                      //   flex: 3,
                      //   child: Text(
                      //     Constant.Name_txt,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,fontFamily: 'Inter',color: Colors.black),),
                      // ),
                    ],
                  ),

                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height*.07,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: const BoxDecoration(
                    color: AppColors.boxbackground,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Row(

                    children: [
                      Expanded(
                        flex :1,
                        child: Text(
                          prefixname[1],style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,fontFamily: 'Inter',color: AppColors.profile_pref_nameclr),),
                      ),

                      Container(width:2,color: AppColors.hintcolour,margin: EdgeInsets.all(5),),
                      Expanded(
                        flex: 3,
                        child: TextFormField(
                          controller: _tcontrolleremail,
                          decoration:   InputDecoration(
                            border:
                            OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                            hintStyle: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),

                          ),
                        ),
                      ),
                      // Expanded(
                      //   flex: 3,
                      //   child: Text(
                      //     Constant.Name_txt,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,fontFamily: 'Inter',color: Colors.black),),
                      // ),
                    ],
                  ),

                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height*.07,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: const BoxDecoration(
                    color: AppColors.boxbackground,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Row(

                    children: [
                      Expanded(
                        flex :1,
                        child: Text(
                          prefixname[2],style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,fontFamily: 'Inter',color: AppColors.profile_pref_nameclr),),
                      ),

                      Container(width:2,color: AppColors.hintcolour,margin: EdgeInsets.all(5),),
                      Expanded(
                        flex: 3,
                        child: TextFormField(
                          controller: _tcontrollerphone,
                          decoration:   InputDecoration(
                            border:
                            OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                            hintStyle: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),

                          ),
                        ),
                      ),
                      // Expanded(
                      //   flex: 3,
                      //   child: Text(
                      //     Constant.Name_txt,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,fontFamily: 'Inter',color: Colors.black),),
                      // ),
                    ],
                  ),

                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height*.07,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: const BoxDecoration(
                    color: AppColors.boxbackground,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Row(

                    children: [
                      Expanded(
                        flex :1,
                        child: Text(
                          prefixname[3],style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,fontFamily: 'Inter',color: AppColors.profile_pref_nameclr),),
                      ),

                      Container(width:2,color: AppColors.hintcolour,margin: EdgeInsets.all(5),),
                      Expanded(
                        flex: 3,
                        child: TextFormField(
                          controller: _tcontrollergender,

                          decoration:   InputDecoration(
                            suffixIcon:
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
                            border:
                            OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                            hintStyle: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),

                          ),
                        ),
                      ),
                      // Expanded(
                      //   flex: 3,
                      //   child: Text(
                      //     Constant.Name_txt,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,fontFamily: 'Inter',color: Colors.black),),
                      // ),
                    ],
                  ),

                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height*.07,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: const BoxDecoration(
                    color: AppColors.boxbackground,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Row(

                    children: [
                      Expanded(
                        flex :1,
                        child: Text(
                          prefixname[4],style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,fontFamily: 'Inter',color: AppColors.profile_pref_nameclr),),
                      ),

                      Container(width:2,color: AppColors.hintcolour,margin: EdgeInsets.all(5),),
                      Expanded(
                        flex: 3,
                        child: TextFormField(

                          controller: _tcontrollerdob,
                          decoration:   InputDecoration(
                            border:
                            OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                            hintStyle: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),

                          ),
                        ),
                      ),
                      // Expanded(
                      //   flex: 3,
                      //   child: Text(
                      //     Constant.Name_txt,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,fontFamily: 'Inter',color: Colors.black),),
                      // ),
                    ],
                  ),

                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0,bottom: 8),
                child: Text(
                  Constant.Changepass_txt,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,fontFamily: 'Times New Roman'),),
              ),
              TextFormField(
                controller: _tcontrollercurrentpass,
                obscureText: !_passwordVisible,
                decoration:  InputDecoration(
                  filled: true,
                  fillColor: AppColors.boxbackground,
                  border:
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Stack(
                      children: [
                        Image.asset("assets/icons/bg.png"),
                        Positioned(
                          top: 20,
                          left: 20,
                          child: Image.asset("assets/icons/lockicon.png"
                          ),),
                      ],
                    ),
                  ),
                  suffixIcon:
                  IconButton(
                    icon:!_passwordVisible?Image.asset("assets/icons/passwor_close_eye.png"):Image.asset("assets/icons/passwork_eye.png"), onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                  ),
                  hintText: Constant.password_text,
                  hintStyle: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400,
                    color: AppColors.hintcolour,
                  ),
                ),
                // validator: (value) {
                //   if(value == null || value.isEmpty) {
                //     return AppLocalizations.of(context)!.required;
                //   } else {
                //     return null;
                //   }
                // },
                // autovalidateMode: AutovalidateMode.always,
              ),
              SizedBox(height: 8,),
              TextFormField(
                controller: _tcontrollernewpass,
                obscureText: !_passwordVisible,
                decoration:  InputDecoration(
                  filled: true,
                  fillColor: AppColors.boxbackground,
                  border:
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Stack(
                      children: [
                        Image.asset("assets/icons/bg.png"),
                        Positioned(
                          top: 20,
                          left: 20,
                          child: Image.asset("assets/icons/lockicon.png"
                          ),),
                      ],
                    ),
                  ),
                  suffixIcon:
                  IconButton(
                    icon:!_passwordVisible?Image.asset("assets/icons/passwor_close_eye.png"):Image.asset("assets/icons/passwork_eye.png"), onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                  ),
                  hintText: Constant.password_text,
                  hintStyle: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400,
                    color: AppColors.hintcolour,
                  ),
                ),
                // validator: (value) {
                //   if(value == null || value.isEmpty) {
                //     return AppLocalizations.of(context)!.required;
                //   } else {
                //     return null;
                //   }
                // },
                // autovalidateMode: AutovalidateMode.always,
              ),
              SizedBox(height: 8,),
              TextFormField(
                controller: _tcontrollerconfirms,
                obscureText: !_passwordVisible,
                decoration:  InputDecoration(
                  filled: true,
                  fillColor: AppColors.boxbackground,
                  border:
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Stack(
                      children: [
                        Image.asset("assets/icons/bg.png"),
                        Positioned(
                          top: 20,
                          left: 20,
                          child: Image.asset("assets/icons/lockicon.png"
                          ),),
                      ],
                    ),
                  ),
                  suffixIcon:
                  IconButton(
                    icon:!_passwordVisible?Image.asset("assets/icons/passwor_close_eye.png"):Image.asset("assets/icons/passwork_eye.png"), onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                  ),
                  hintText: Constant.password_text,
                  hintStyle: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400,
                    color: AppColors.hintcolour,
                  ),
                ),
                // validator: (value) {
                //   if(value == null || value.isEmpty) {
                //     return AppLocalizations.of(context)!.required;
                //   } else {
                //     return null;
                //   }
                // },
                // autovalidateMode: AutovalidateMode.always,
              ),
              SizedBox(height: 8,),
              GestureDetector(
                onTap:(){
                  updateprofiles(_tcontrollerName.text,_tcontrollergender.text,_tcontrollerdob.text);
                  setState(() {
                    edit_profile_clicked=true;
                  });
                },
                child: imgtxtbutton(btntext: "Save"),
              ),


            ],
          ),
        ),
      ),
    );
  }
  void actionPopUpItemSelected(String value, String name) {
    String message;
    if (value == 'edit') {
      message = 'You selected edit for $name';
    } else if (value == 'delete') {
      message = 'You selected delete for $name';
    } else {
      message = 'Not implemented';
    }
    final snackBar = SnackBar(content: Text(message));
  }
  Future<void> updateprofiles(String name,String gender,String DOB) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString("accesstoken"));
    String? token=prefs.getString("accesstoken");
    var apiUrl = Uri.parse(APIService.BASE_URL+ ApiRoute.update_profile);
    print(apiUrl);
    var response = await http.post(apiUrl,
        body: {
          'name': name,
          'gender': gender,
          'DOB': DOB,
        },
        headers: {
          'Authorization': 'Bearer $token',
        }


    );

    print("this is response"+response.body);


  }
}
