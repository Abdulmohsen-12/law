
import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:law/Screens/authentication/login.dart';
import 'package:law/Screens/authentication/termsCondition.dart';
import 'package:law/api/responses/registrationsccss_response.dart';
import 'package:law/utils/Views.dart';
import 'package:law/utils/constant.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../api/repositories/auth_repositories.dart';
import '../../api/responses/auth_responses.dart';
import '../../api/responses/error_response.dart';
import '../../api/responses/errror_respom.dart';
import '../../api/services/api_service.dart';
import '../../utils/Utility.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({Key? key}) : super(key: key);

  @override
  _SignupscreenState createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  final TextEditingController _emailTextEditingController =
  TextEditingController();
  final TextEditingController _usernameEditingController =
  TextEditingController();
  final TextEditingController _numberEditingController =
  TextEditingController();
  final TextEditingController _passwordTextEditingController =
  TextEditingController();
  final TextEditingController _C_passwordTextEditingController =
  TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isInternetConnection = true;
  bool _isLoading = false;
  bool  _passwordVisible=false;
  bool _isChecked =false;
  late StreamSubscription<InternetConnectionStatus>_subscriptionConnectionStatus;



  @override
  void dispose() {
    super.dispose();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordVisible = false;
    _subscriptionConnectionStatus = InternetConnectionChecker().onStatusChange.listen((status) {
      if (status == InternetConnectionStatus.connected) {
        log('Internet connection is available.');
        setState(() {
          _isInternetConnection = true;
        });
      } else {
        log('You are disconnected from the internet.');
        setState(() {
          _isInternetConnection = false;
        });
      }
    });
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

                        Constant.signUp_text,
                        style: TextStyle(
                            fontSize: 34,
                            color: Colors.black,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                      Text(
                        Constant.signUP_welcome,
                        style: TextStyle(
                          fontSize: 16,
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
                          children: <Widget>[
                            TextFormField(
                              enabled: !_isLoading,
                              controller: _emailTextEditingController,
                              keyboardType: TextInputType.emailAddress,
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
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                hintStyle: TextStyle(
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
                            SizedBox(
                              height: mediaQuery.size.height * 0.01,
                            ),
                            TextFormField(
                              enabled: !_isLoading,
                              controller: _usernameEditingController,
                              keyboardType: TextInputType.name,
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
                                          child: Image.asset("assets/icons/User_logo.png")),
                                    ],
                                  ),
                                ),
                                hintText:Constant.signuP_USERNAME,
                                border:
                                OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                hintStyle: TextStyle(
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
                            SizedBox(
                              height: mediaQuery.size.height * 0.01,
                            ),
                            TextFormField(
                              enabled: !_isLoading,
                              controller: _numberEditingController,
                              keyboardType: TextInputType.number,
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
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                hintStyle: TextStyle(
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
                            SizedBox(
                              height: mediaQuery.size.height * 0.01,
                            ),
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
                            SizedBox(
                              height: mediaQuery.size.height * 0.01,
                            ),
                            TextFormField(
                              enabled: !_isLoading,
                              controller: _C_passwordTextEditingController,
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
                                hintText: Constant.signuP_CONFIRM,
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


                          ],
                        ),
                      ),
                      SizedBox(
                        height: mediaQuery.size.height * 0.010,
                      ),
                      Row(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            child: Checkbox(
                                activeColor: Colors.black,
                                shape: CircleBorder(),
                                value: _isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _isChecked = value!;
                                  });
                                }),
                            width: 30,
                            height: 30,
                          ),
                          Expanded(
                            child: Wrap(
                              children:  [
                                Text(
                                  "By clicking, you agree to the",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                    overflow: TextOverflow.ellipsis,

                                  ),
                                ),
                                SizedBox(width: 5,),
                                InkWell(
                                  onTap:(){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) =>TermsCondition_Screen()),
                                    );
                                  },
                                  child: const Text(
                                    "terms and conditions",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13,
                                      decoration: TextDecoration.underline,

                                    ),
                                  ),
                                ),
                                SizedBox(width: 5,),
                                Text(
                                  "of the application",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),



                        ],
                      ),
                      SizedBox(
                        height: mediaQuery.size.height * 0.03,
                      ),
                      GestureDetector(
                          onTap: (){

    if(_usernameEditingController.text!="" || _emailTextEditingController.text !="" ||
        _passwordTextEditingController.text != "" || _numberEditingController.text !="" ){
      if(_isChecked){
        postData(context,_usernameEditingController.text,_emailTextEditingController.text,_passwordTextEditingController.text,_numberEditingController.text);
      }
    }

                          },
                          child: Container(
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
                                  Text("Sign Up ",style: TextStyle(fontFamily: 'Inter',color: Colors.white),),
                                ],
                              ),
                            ),

                          )),
                      SizedBox(
                        height: mediaQuery.size.height * 0.010,
                      ),
                      Row(
                        children: [
                          Text(

                            Constant.signuP_ACCOUNT1.toUpperCase(),
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 11,

                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.pushReplacement(context,
                                MaterialPageRoute(builder:
                                    (context) =>
                                    LoginScreen()),
                              );
                            },
                            child: Text(
                              Constant.signuP_ACCOUNT2.toUpperCase(),
                              style: const TextStyle(
                                color:AppColors.blue_light,
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.underline,
                                fontSize: 11,
                              ),
                            ),
                          ),

                        ],
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
                child: CircularProgressIndicator()))
            : Container()
      ],
    );
  }
  Future postData(BuildContext context,String name,String email,String password,String number) async {
    print("clicked"+name);
    print("clicked"+email);
    print("clicked"+password);
    print("clicked"+number);
    APIService.checkAndShowCircularDialog(context, true);
    var apiUrl = Uri.parse(APIService.AUTH_BASE_URL+LoginRepo.ROUTE_AUTHORIZE_URL);
    print("clicked"+apiUrl.toString());
    var response = await http.post(apiUrl,
        body: {
          "name":name,
          "email":email,
          "password":password,
          "confirm_password":password,
          "phone_no":"+88"+number

        });
    print("response to"+jsonDecode(response.body).toString());
print("response"+response.statusCode.toString());
    statuscode codeResponse =
    errorcodeFromJson(response.body);
    print(codeResponse.statusCode);
    if (codeResponse.statusCode == 200) {
      APIService.checkAndShowCircularDialog(context, true);
      print("failed"+response.statusCode.toString());
      Login succeededResponse =
      lognFromJson(response.body);
      Utility.show_Dialog(
          context, "success", succeededResponse.data.toString());
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>LoginScreen()),
      );


    }
    else {
      Error succeededResponse =
      errorFromJson(response.body);
      APIService.checkAndShowCircularDialog(context, true);
      Utility.show_Dialog(context, "failed", succeededResponse.error);
    }
  }



}
