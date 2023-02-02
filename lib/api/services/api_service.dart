
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:law/api/repositories/auth_repositories.dart';
import 'package:law/api/responses/error_response.dart';
import 'package:law/utils/Utility.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../responses/auth_responses.dart';

import 'package:flutter/scheduler.dart';
import 'package:http/http.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class APIService {
  static const String AUTH_BASE_URL = "https://istesheer.com/api/auth/";
  static const String BASE_URL = "istesheer.com";
  static const String BASE_URL2 = "https://istesheer.com";
  static bool showDialogue = false;

  static Future<String> postApi(
      {required Map<String, dynamic> data,
        required String Route,
        required BuildContext context,
        required bool show_CircularDialog}) async {
    Uri url = Uri.https(BASE_URL, Route);
    print("url"+url.toString());



    String requestBody = jsonEncode(data);

    String _responseBody = "";
    print("request body"+requestBody);
    try {
      checkAndShowCircularDialog(context, show_CircularDialog);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      print(prefs.getString("accesstoken"));
     String? token=prefs.getString("accesstoken");
        Response response = await post(
          url,body:requestBody,
        headers: {
          'Authorization': 'Bearer $token',
        },
        );

      _responseBody =
      await checkResponse(response, context, show_CircularDialog);
      print(response.body);

    } on SocketException {
      checkAndShowCircularDialog(context, show_CircularDialog);
      print("SocketException SocketException");
      // Utility.show_Dialog(
      //     context, "", AppLocalizations.of(context)!.noInternet);
    } on HttpException {
      checkAndShowCircularDialog(context, show_CircularDialog);
      print("No service found!");
    } on FormatException {
      checkAndShowCircularDialog(context, show_CircularDialog);
      print("The response format is invalid!");
    } on TimeoutException {
      checkAndShowCircularDialog(context, show_CircularDialog);
    //   Utility.show_Dialog(context, AppLocalizations.of(context)!.error,
    //       AppLocalizations.of(context)!.communicationTimedOut);
    } catch (e) {
      checkAndShowCircularDialog(context, show_CircularDialog);
//Utility.show_Dialog(context, AppLocalizations.of(context)!.error, AppLocalizations.of(context)!.authorizationFailed);
    }

    return _responseBody;
  }
  static Future<String> checkResponse(
      Response response, BuildContext context, bool show_CircularDialog) async {
     checkAndShowCircularDialog(context, false);
    // log("AAAANNBresponse: $response");
     print("order");
    String _response = "";
    try {
      final prefs = await SharedPreferences.getInstance();
      // Check the user login data is exists or not
        // If a success response
        if (response.statusCode == 200) {
          print("order suceess");
          checkAndShowCircularDialog(context, true);
          String responseBody;
          // Check whether the response is cipher or not

            responseBody = response.body.toString();


          _response = responseBody;

          var responseBodyMap =
          jsonDecode(responseBody) as Map<String, dynamic>;


          if (responseBodyMap.containsKey("ErrorMessage.TAG")) {
            print("Response with error status");
            // var errorMessage = errorMessageFromJson(
            //     json.encode(responseBodyMap[ErrorMessage.TAG]));
            // Show error message dialog
            // Utility.show_Dialog(context, AppLocalizations.of(context)!.error,
            //     errorMessage.message);
          } else {
            print("Response with success status");
            _response = responseBody;
          }
        } else {
          var errorMsg = response.body;
          checkAndShowCircularDialog(context, show_CircularDialog);
          // Utility.show_Dialog(context, AppLocalizations.of(context)!.error,
          //     AppLocalizations.of(context)!.communicationTimedOut);
          // log("The error message is: $errorMsg");
        }

    } catch (e) {
      //checkAndShowCircularDialog(context, show_CircularDialog);
      print("Response with catch status");
    }

    return _response;
  }

  static Future<String> getAPI(
      { Map<String, dynamic>? data,
        required String Route,
        required BuildContext context,
        required bool show_CircularDialog}) async {
    Uri url = Uri.https(BASE_URL, Route);
    print("url"+url.toString());



    String requestBody = jsonEncode(data);

    //if (APIService.CIPHER) requestBody = Encryption.encryption(requestBody);

    String _responseBody = "";
    try {
      checkAndShowCircularDialog(context, true);
      //checkAndShowCircularDialog(context, show_CircularDialog);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      print(prefs.getString("accesstoken"));
      String? token=prefs.getString("accesstoken");
      Response response = await get(
        url,

        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      _responseBody =
      await checkResponse(response, context, show_CircularDialog);
      print(response.body);


    } on SocketException {
      //checkAndShowCircularDialog(context, show_CircularDialog);
      print("SocketException SocketException");
      // Utility.show_Dialog(
      //     context, "", AppLocalizations.of(context)!.noInternet);
    } on HttpException {
      //checkAndShowCircularDialog(context, show_CircularDialog);
      print("No service found!");
    } on FormatException {
      // checkAndShowCircularDialog(context, show_CircularDialog);
      print("The response format is invalid!");
    } on TimeoutException {
      //  checkAndShowCircularDialog(context, show_CircularDialog);
      //   Utility.show_Dialog(context, AppLocalizations.of(context)!.error,
      //       AppLocalizations.of(context)!.communicationTimedOut);
    } catch (e) {
      //  checkAndShowCircularDialog(context, show_CircularDialog);
//Utility.show_Dialog(context, AppLocalizations.of(context)!.error, AppLocalizations.of(context)!.authorizationFailed);
    }

    return _responseBody;
  }
  static  Future<String> getdataa(  {required var data,
    required String Route,
    required BuildContext context,
    required bool show_CircularDialog}) async{
    var apiUrl = Uri.parse(APIService.BASE_URL2+Route+data.toString());
    String _responseBody = "";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString("accesstoken"));
    String? token=prefs.getString("accesstoken");
    print(apiUrl);
    var response = await http.get(apiUrl,   headers: {
      'Authorization': 'Bearer $token',
    },);
    _responseBody =
    await checkResponse(response, context, show_CircularDialog);
    return _responseBody;

  }
  static checkAndShowCircularDialog(
      BuildContext context, bool show_CircularDialog) async {
    if (show_CircularDialog) {
      if (!showDialogue) {
        showDialogue = true;
        SchedulerBinding.instance!.addPostFrameCallback((_) {
          Utility.showLoadingDialog(context);
        });
      } else {
        showDialogue = false;
        Navigator.of(context).pop();
      }
    }
  }


}

Future loginpostData(String email,String password) async {
  print("clicked"+email);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  print("clicked"+password);
  var apiUrl = Uri.parse(APIService.AUTH_BASE_URL+LoginRepo.ROUTE_LOGIN_URL);
  print("clicked"+apiUrl.toString());
  var response = await http.post(apiUrl,
      body: {
        "email":email,
        "password":password
      });

  if (response.statusCode == 200) {

    Login succeededResponse =
    loginFromJson(response.body);
    print("successfull"+succeededResponse.data.user.name);
    prefs.setString("accesstoken",succeededResponse.data.accessToken);

  } else {
    print("failed"+response.body);
    print('error');
  }
}



