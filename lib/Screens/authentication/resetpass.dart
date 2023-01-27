
import 'dart:async';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:law/Screens/authentication/login.dart';
import 'package:law/utils/constant.dart';

import '../../api/responses/error_response.dart';
import '../../api/responses/errror_respom.dart';
import '../../api/services/api_service.dart';
import '../../utils/Utility.dart';

class ResetPass_Screen extends StatefulWidget {
  String pincode;
   ResetPass_Screen({Key? key,required this.pincode}) : super(key: key);

  @override
  _ResetPass_ScreenState createState() => _ResetPass_ScreenState();
}

class _ResetPass_ScreenState extends State<ResetPass_Screen> {
  final TextEditingController _emailTextEditingController =
  TextEditingController();
  final TextEditingController _passwordTextEditingController =
  TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isInternetConnection = true;
  bool _isLoading = false;
  bool  _passwordVisible=false;


  @override
  void dispose() {
    super.dispose();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordVisible = false;
    print("resetpin"+widget.pincode);
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Stack(
      children: [
        IgnorePointer(
          ignoring: _isLoading,
          child: Scaffold(
            appBar: AppBar(
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
                            Text(
                              "BACK",style: TextStyle( height:1  ,fontSize: 15,),)
                          ],),
                      )),

                ],
              ),
            ),
            body: Container(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: mediaQuery.size.width * 0.05,
                    vertical: mediaQuery.size.height * 0.05,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Constant.resetpass_Txt,
                        style: TextStyle(
                          fontFamily: 'Times New Roman',
                            fontSize: 23,
                            color: Colors.black,
                          fontWeight: FontWeight.w700
                        ),
                      ),
                      Text(
                        Constant.resetpassdesc_Txt,
                        style: TextStyle(
                          fontFamily:'Inter',
                            fontSize: 14,
                            color: Colors.black,
                          ),

                      ),
                      SizedBox(
                        height: mediaQuery.size.height * 0.03,
                      ),
                      Form(
                        key: _formKey,
                        // onChanged: () => setState(() => _isFormValidated = _formKey.currentState!.validate()),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            TextFormField(
                              enabled: !_isLoading,
                              controller: _passwordTextEditingController,
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
                            Text(
                              "Must be at least 8 characters",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                              ),

                            ),
                            SizedBox(
                              height: mediaQuery.size.height * 0.01,
                            ),
                            TextFormField(
                              enabled: !_isLoading,
                              controller: _emailTextEditingController,
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
                                hintText: "Confirm password",
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
                            Text(
                             "Both password must match",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                              ),

                            ),


                          ],
                        ),
                      ),
                      SizedBox(
                        height: mediaQuery.size.height * 0.03,
                      ),
                      GestureDetector(
                          onTap: (){
                            reset_postData(_emailTextEditingController.text,_emailTextEditingController.text);
                          },
                          child:  Container(
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
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Reset Password ",style: TextStyle(fontFamily: 'Inter',color: Colors.white),),
                                ],
                              ),
                            ),

                          )),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        _isLoading
            ? Opacity(
            opacity: 0.5,
            child: Container(
                color: Colors.black,
                alignment: Alignment.center,
                child: CircularProgressIndicator()))
            : Container()
      ],
    );
  }

  Future reset_postData(String password,Confirmpassword) async {
    var apiUrl = Uri.parse(APIService.AUTH_BASE_URL+widget.pincode+"?"+"/"+password+"/"+Confirmpassword);
    var response = await http.get(apiUrl);
    //_otp_bottomsheet(context);
    statuscode codeResponse =
    errorcodeFromJson(response.body);
    if (codeResponse.statusCode == 200) {
      Navigator.pushReplacement(context,
        MaterialPageRoute(builder:
            (context) =>
            LoginScreen()),
      );
    } else {
      Error succeededResponse =
      errorFromJson(response.body);
      Utility.show_Dialog(
          context, "failed", succeededResponse.error);
    }
  }


}