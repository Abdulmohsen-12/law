
import 'dart:async';
import 'dart:developer';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:law/Screens/authentication/resetpass.dart';
import 'package:law/api/services/api_service.dart';
import 'package:law/utils/Views.dart';
import 'package:law/utils/constant.dart';
import 'package:otp_text_field/otp_text_field.dart';

import '../../api/repositories/auth_repositories.dart';
import '../../api/responses/error_response.dart';
import '../../api/responses/errror_respom.dart';
import '../../utils/Utility.dart';
class Forgotpass_Screen extends StatefulWidget {
  static const SCREEN_ID = "/login_screen";
  const Forgotpass_Screen({Key? key}) : super(key: key);

  @override
  _Forgotpass_ScreenState createState() => _Forgotpass_ScreenState();
}

class _Forgotpass_ScreenState extends State<Forgotpass_Screen> {
  final TextEditingController _emailTextEditingController =
  TextEditingController();
  final TextEditingController _phoneNumberEditingController =
  TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isInternetConnection = true;
  bool _isLoading = false;
  bool  _passwordVisible=false;
  bool _isChecked_email=false;
  bool _isChecked_phone=false;
  bool _otpchange=false;
  bool _changetext=false;


  @override
  void dispose() {
    super.dispose();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordVisible = false;
    _isChecked_email=true;
    _changetext=false;

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
                            const Text(
                              "BACK",style: TextStyle( height:1  ,fontSize: 15,),)
                          ],),
                      )),

                ],
              ),
            ),
            body: Container(
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
                      const Text(
                        Constant.forgotpass_Txt,
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                      const Text(
                        Constant.forgotpassWorry_Txt,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),

                      ),
                      SizedBox(
                        height: mediaQuery.size.height * 0.03,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            child: _isChecked_email?IgnorePointer(
                              child: Checkbox(
                                  activeColor: Colors.black,
                                  shape: const CircleBorder(),
                                  value: _isChecked_email,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _isChecked_email = value!;
                                      _isChecked_phone=false;
                                      _changetext=false;
                                      _emailTextEditingController.clear();
                                    });
                                  }),
                            ): Checkbox(
                                activeColor: Colors.black,
                                shape: const CircleBorder(),
                                value: _isChecked_email,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _isChecked_email = value!;
                                    _isChecked_phone=false;
                                    _changetext=false;
                                    _emailTextEditingController.clear();
                                  });
                                }),
                            width: 30,
                            height: 30,
                          ),
                          const Text(
                            "Email",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,

                            ),
                          ),
                          SizedBox(
                            width: mediaQuery.size.width * 0.05,
                          ),
                          SizedBox(
                            child:_isChecked_phone? IgnorePointer(
                              child: Checkbox(
                                  activeColor: Colors.black,
                                  shape: const CircleBorder(),
                                  value: _isChecked_phone,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _isChecked_phone = value!;
                                      _isChecked_email=false;
                                      _changetext=false;
                                      _phoneNumberEditingController.clear();
                                    });
                                  }),
                            ): Checkbox(
                                activeColor: Colors.black,
                                shape: const CircleBorder(),
                                value: _isChecked_phone,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _isChecked_phone = value!;
                                    _isChecked_email=false;
                                    _changetext=false;
                                  });
                                }),
                            width: 30,
                            height: 30,
                          ),
                          const Text(
                            "Phone",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,

                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: mediaQuery.size.height * 0.02,
                      ),
                      Form(
                        key: _formKey,
                        // onChanged: () => setState(() => _isFormValidated = _formKey.currentState!.validate()),
                        child: Column(
                          children: <Widget>[
                            Visibility(
                              visible: _isChecked_email,
                              child: TextFormField(
                                enabled: !_isLoading,
                                controller: _emailTextEditingController,
                                keyboardType: TextInputType.emailAddress,
                                onChanged:(val) {
                                  if(_emailTextEditingController.text.length>0){
                                    setState(() {
                                      _changetext=true;
                                    });
                                  }else{
                                    setState(() {
                                      _changetext=false;
                                    });
                                  }

                                },
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: AppColors.boxbackground,
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Stack(
                                      children: [
                                        Image.asset("assets/icons/bg.png"),
                                        Positioned(
                                            top: 20,
                                            left: 20,
                                            child: Image.asset("assets/icons/mailIcon.png")),
                                      ],
                                    ),
                                  ),
                                  hintText:Constant.email_text,
                                  border:
                                  OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: const BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                    ),
                                  ),
                                  hintStyle: const TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.hintcolour,
                                  ),
                                ),

                                // validator: (value) {
                                //   if(value == null || value.isEmpty) {
                                //     return AppLocalizations.of(context)!.required;
                                //   } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                //       .hasMatch(value)) {
                                //     return AppLocalizations.of(context)!.enterValidEmail;
                                //   } else {
                                //     return null;
                                //   }
                                // },
                                // autovalidateMode: AutovalidateMode.always,
                              ),
                            ),
                            Visibility(
                              visible: _isChecked_phone,
                              child: TextFormField(
                                enabled: !_isLoading,
                                controller: _phoneNumberEditingController,
                                onChanged:(val) {
                                  if(_phoneNumberEditingController.text.length>0){
                                    setState(() {
                                      _changetext=true;
                                    });
                                  }else{
                                    setState(() {
                                      _changetext=false;
                                    });
                                  }
                                },
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: AppColors.boxbackground,
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Stack(
                                      children: [
                                        Image.asset("assets/icons/bg.png"),
                                        Positioned(
                                            top: 20,
                                            left: 20,
                                            child: Image.asset("assets/icons/call.png")),
                                      ],
                                    ),
                                  ),
                                  hintText:Constant.signuP_nUMBER,
                                  border:
                                  OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: const BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                    ),
                                  ),
                                  hintStyle: const TextStyle(
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
                            ),


                          ],
                        ),
                      ),
                      SizedBox(
                        height: mediaQuery.size.height * 0.03,
                      ),
                      _changetext? GestureDetector(
                          onTap: (){
                            reset_postData(_emailTextEditingController.text);
                        //    print(_emailTextEditingController.text);
                           // _otp_bottomsheet(context);
                          },

                          child:Container(
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
                                  Text("Next ",style: TextStyle(fontFamily: 'Inter',color: Colors.white),),
                                ],
                              ),
                            ),

                          )): Container(
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
                          padding: const EdgeInsets.all(20.0),
                          child: Align(
                              alignment: Alignment.center,
                              child: Text("Next")),
                        ),

                      ),

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
                child: const CircularProgressIndicator()))
            : Container()
      ],
    );
  }
  Future reset_postData(String email) async {
    var apiUrl = Uri.parse(APIService.AUTH_BASE_URL+ResetpassRepo.RESET_URL+email);
    var response = await http.get(apiUrl);
    _otp_bottomsheet(context);
    statuscode codeResponse =
    errorcodeFromJson(response.body);
    if (codeResponse.statusCode == 888) {

      _otp_bottomsheet(context);
    } else {
      Error succeededResponse =
      errorFromJson(response.body);
      Utility.show_Dialog(
          context, "failed", succeededResponse.error);
    }
  }

  void _otp_bottomsheet(context){
     String pincode="";
    bool _wrongTXT=false;
    showModalBottomSheet(context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: _otpchange,
        builder:(context)=> Column(
          children: [
            const SizedBox(height: 200,),
            Container(
              height: 211,
              width: 354,

              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24)
                ),

              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0,right: 12),
                child: Column(
                  children: [
                    OTPTextField(
                     //   controller: otpController,
                        length: 4,
                        width: MediaQuery.of(context).size.width,
                        fieldWidth: 45,
                        outlineBorderRadius: 15,
                        style: const TextStyle(fontSize: 17),
                        onChanged: (pin) {
                           _otpchange=true;
                          print("Changed: " + pin);
                        },
                        onCompleted: (pin) {
                          print("Completed: " + pin);
                          pincode=pin;
                          _wrongTXT==true;
                          if(pin.contains("0335")){
                            setState(() {
                              _wrongTXT==true;
                            });

                          }
                        }
                    ),
                    const Spacer(),

                    _wrongTXT==false?  const Text(
                      Constant.otp_Txt,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        fontSize: 15,

                      ),
                    ):const Text("asdfa"),
                    const Spacer(),
                    _otpchange? GestureDetector(
                        onTap: (){
                          otpController.clear();
                          _otp_bottomsheet(context);
                        },

                        child: GestureDetector(
                            onTap: (){
                             print("pincode"+pincode);
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  ResetPass_Screen(pincode: pincode)),
                              );
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
                                    Text("Next",style: TextStyle(fontFamily: 'Inter',color: Colors.white),),
                                  ],
                                ),
                              ),

                            ))): Image.asset('assets/images/nextBTNwhite.png',fit: BoxFit.cover),
                    const Spacer(),
                  ],
                ),
              ),

            ),

            Container(
            ),
          ],
        ));
  }

}