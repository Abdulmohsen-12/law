
import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:law/Screens/authentication/forgotpass.dart';
import 'package:law/Screens/authentication/signup.dart';
import 'package:law/api/responses/error_response.dart';
import 'package:law/api/responses/errror_respom.dart';
import 'package:law/api/services/api_service.dart';
import 'package:law/utils/Utility.dart';
import 'package:law/utils/constant.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../api/repositories/auth_repositories.dart';
import '../../api/responses/auth_responses.dart';
import '../drawer_screen.dart';
import '../home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Stack(
      children: [
        IgnorePointer(
          ignoring: _isLoading,
          child: Scaffold(
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
                      const Text(

                        Constant.signIn_text,
                        style: TextStyle(
                            fontSize: 34,
                            color: Colors.black,
                          fontWeight: FontWeight.w700
                        ),
                      ),
                      const Text(
                        Constant.signIn_welcome,
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


                          ],
                        ),
                      ),
                      SizedBox(
                        height: mediaQuery.size.height * 0.03,
                      ),
                      GestureDetector(
                          onTap: (){
                            if(_emailTextEditingController.text !="" ||
                                _passwordTextEditingController.text != "" ){
                              loginpostData(_emailTextEditingController.text,_passwordTextEditingController.text);

                            }



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
                                  Text("Sign In ",style: TextStyle(fontFamily: 'Inter',color: Colors.white),),
                                ],
                              ),
                            ),

                          )),
                      SizedBox(
                        height: mediaQuery.size.height * 0.02,
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  Forgotpass_Screen()),
                          );
                        },
                        child: Text(
                          Constant.signIn_forget.toUpperCase(),
                          style: TextStyle(
                            color:AppColors.blue_light,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.underline,
                            fontSize: 11,

                          ),
                        ),
                      ),
                      SizedBox(
                        height: mediaQuery.size.height * 0.010,
                      ),
                      Row(
                        children: [
                          Text(

                            Constant.signIn_account1.toUpperCase(),
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 11,

                            ),
                          ),
                          GestureDetector(
                            onTap: (){

                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  Signupscreen()),
                              );
                            },
                            child: Text(
                              Constant.signIn_account2.toUpperCase(),
                              style: TextStyle(
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

  Future loginpostData(String email,String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var apiUrl = Uri.parse(APIService.AUTH_BASE_URL+LoginRepo.ROUTE_LOGIN_URL);

    var response = await http.post(apiUrl,
        body: {
          "email":email,
          "password":password
        },


        );
    statuscode codeResponse =
    errorcodeFromJson(response.body);
    print(codeResponse.statusCode);
    APIService.checkAndShowCircularDialog(context, true);

    if (codeResponse.statusCode == 200) {
      APIService.checkAndShowCircularDialog(context, true);
      Login succeededResponse =
      lognFromJson(response.body);
      print("successfull"+succeededResponse.data.user.name);
      prefs.setString("accesstoken",succeededResponse.data.accessToken);
      Navigator.pushReplacement(context,
        MaterialPageRoute(builder:
            (context) =>
            DrawerScreen(place: Home_Screen(),)),
      );

    } else {
      Error succeededResponse =
      errorFromJson(response.body);
      APIService.checkAndShowCircularDialog(context, true);
      Utility.show_Dialog(context, "failed",succeededResponse.error );
      print("failed"+response.body);
      print('error');
    }
  }


}