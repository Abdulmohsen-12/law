
import 'package:flutter/material.dart';
import 'package:law/Screens/Contract_draft/upload.dart';
import 'package:law/Screens/orderdetails.dart';

import '../../../api/requests/contractdraft_request.dart';
import '../../../api/responses/Cntrct_draft.dart';
import '../../../api/responses/casedetails_response.dart';
import '../../../api/responses/errror_respom.dart';
import '../../../api/services/api_service.dart';
import '../../../utils/constant.dart';
import 'package:http/http.dart' as http;
import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:convert';
import 'dart:developer';

import '../drawer_screen.dart';


class Consultion_Dialog extends StatefulWidget {
  const Consultion_Dialog({
    Key? key,
  }) : super(key: key);

  @override
  State<Consultion_Dialog> createState() => _Consultion_DialogState();
}

class _Consultion_DialogState extends State<Consultion_Dialog> {

  final TextEditingController _Clientname_editing_C = TextEditingController();
  final TextEditingController _subject_editing_C = TextEditingController();
  final TextEditingController _todays_date_editing_C = TextEditingController();
  final TextEditingController _Deadline_editing_C = TextEditingController();
  final TextEditingController _details_editing_C = TextEditingController();
  RecorderController recordcontroller = RecorderController();
  void _initialiseController() {
    recordcontroller = RecorderController()
      ..androidEncoder = AndroidEncoder.aac
      ..androidOutputFormat = AndroidOutputFormat.mpeg4
      ..iosEncoder = IosEncoder.kAudioFormatMPEG4AAC
      ..sampleRate = 16000;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initialiseController();
  }

  void startrecord() async {
    recordcontroller.record();
    print(recordcontroller.recorderState.isRecording);
    if(recordcontroller.recorderState.isRecording){

      final path = await  recordcontroller.stop();
      recordcontroller.pause();
      //allfile.add();
      print(path);
      // completePath = await _completePath(directoryPath);
      // getdataas(path);
    }
    // recordcontroller.recorderState == recorderState.playing
    //     ? await playerController.pausePlayer()
    //     : await playerController.startPlayer(finishMode: FinishMode.loop);
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () {return Future.value(false);},
      child: AlertDialog(

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        insetPadding: const EdgeInsets.only(top: 90,bottom: 90),
        contentPadding: EdgeInsets.zero,

        content:
        SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Container(
            height: height - 100,
            width: width - 40,
            child: Column(
              children: [
                Container(
                  width: width,
                  decoration:const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/Contrctdraft_title_BG.png'),
                      fit: BoxFit.fill,
                    ),
                    borderRadius:  BorderRadius.only(topLeft: Radius.circular(10),topRight:  Radius.circular(10)
                      //Radius.circular(10),
                    ),

                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text(Constant.consultation_Txt,style: TextStyle(fontFamily: 'Times',color: Colors.white,fontWeight: FontWeight.w600,fontSize: 22),)),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: _Clientname_editing_C,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          filled: true,
                          hintText:Constant.CD_clientname_hint,
                          contentPadding: const EdgeInsets.all(15),
                          border:
                          OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none
                          ),
                          hintStyle: const TextStyle(
                            fontSize: 13.0,
                            fontFamily: 'Avenir',
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
                      const SizedBox(height: 8,),
                      TextFormField(
                        controller: _subject_editing_C,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          filled: true,
                          hintText:Constant.Subject_txt,
                          contentPadding: const EdgeInsets.all(15),
                          border:
                          OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none
                          ),
                          hintStyle: const TextStyle(
                            fontSize: 13.0,
                            fontFamily: 'Avenir',
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
                      const SizedBox(height: 8,),
                      TextFormField(
                        controller: _todays_date_editing_C,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          filled: true,
                          hintText:Constant.Today_sdate_txt,
                          contentPadding: const EdgeInsets.all(15),
                          border:
                          OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none
                          ),
                          hintStyle: const TextStyle(
                            fontSize: 13.0,
                            fontFamily: 'Avenir',
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
                      const SizedBox(height: 8,),
                      TextFormField(
                        controller: _Deadline_editing_C,
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                          filled: true,
                          hintText:Constant.CD_Deadline_hint,
                          contentPadding: const EdgeInsets.all(15),
                          border:
                          OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none
                          ),
                          hintStyle: const TextStyle(
                            fontSize: 13.0,
                            fontFamily: 'Avenir',
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
                      const SizedBox(height: 8,),
                      Container(
                        padding: const EdgeInsets.only(left: 18,top: 8,bottom: 8),
                        decoration: const BoxDecoration(
                          color: AppColors.boxbackground,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Column(
                          children: [
                            const Align(
                                alignment: Alignment.topLeft,
                                child: Text(Constant.CD_Details_hint,  style: TextStyle(
                                    fontFamily: 'Avenir',
                                    fontSize: 13,
                                    color: AppColors.hintcolour,
                                    fontWeight: FontWeight.w700
                                ),)),
                            Container(

                              decoration: const BoxDecoration(
                                  border: Border(
                                      top: BorderSide(color:AppColors.hintcolour)
                                  )
                              ),
                              child: TextFormField(
                                controller: _details_editing_C,
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: AppColors.boxbackground,
                                  hintText:Constant.CD_Details_hint,
                                  contentPadding: EdgeInsets.only(top: 2,bottom: 70),
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                    fontSize: 13.0,
                                    fontFamily:'Avenir',
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.hintcolour,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 18,),
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
                                      startrecord();
                                    },
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Image.asset("assets/images/CDmic.png",scale: .9,)),
                                  ),
                                  Container(


                                    child: AudioWaveforms(
                                      size: Size((width*1.18)/2, 50.0),
                                      recorderController: recordcontroller,

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
                      SizedBox(height: 18,),
                      GestureDetector(
                        onTap: (){
                          showDialog(context: context, builder:  (BuildContext context) => Upload_dialog());

                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height*.07,
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
                          child: Align(

                              alignment: Alignment.center,
                              child: Text(Constant.upload_Txt)),

                        ),
                      ),
                      SizedBox(height: 8,),
                      Container(

                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.of(context).pop();
                                },
                                child: Container(
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
                                      Text("Cancel",
                                        style: const TextStyle(
                                          color:Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Avenir',
                                          fontSize: 14,

                                        ),
                                      )),

                                ),
                              ),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: GestureDetector(
                                onTap: (){
                                  postdata(_Clientname_editing_C.text,_subject_editing_C.text,_todays_date_editing_C.text,_Deadline_editing_C.text,_details_editing_C.text);
                                  //get(18);


                                },
                                child: Container(
                                  height: MediaQuery.of(context).size.height*.05,
                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/Contrctdraft_title_BG.png'),
                                      fit: BoxFit.fill,
                                    ),
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
                                      child: Text("Send",
                                        style: const TextStyle(
                                          color:Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Inter',
                                          fontSize: 14,

                                        ),
                                      )),

                                ),
                              ),
                            ),

                          ],

                        ),
                      )



                    ],),
                )
              ],
            ),

          ),
        ),

        // actionsOverflowButtonSpacing: 8.0
      ),
    );
  }

  Future<void> postdata(String ServiceName,String Purpose,String Ammount,String Details,StringDeadline ) async {
    print("servicenamee"+ServiceName);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString("accesstoken"));
    String? token=prefs.getString("accesstoken");
    var apiUrl = Uri.parse(APIService.BASE_URL2+ ApiRoute.createcase);
    var response = await http.post(apiUrl,
        body: {
          'ServiceName': "consultation",
          'ClientName': ServiceName,
          'Purpose': Purpose,
          'Details': Details,
          'Deadline': StringDeadline,
          'ContractTerm': StringDeadline,
        },
        headers: {
          'Authorization': 'Bearer $token',
        }


    );

    print("this is response"+response.body);


    // String _responseBody = await APIService.postApi(
    //      data:postdraft.toJson(),
    //      Route: ApiRoute.createcase,
    //      context: context,
    //      show_CircularDialog: false);

    Contractdraft codeResponse = contractdraftFromJson(response.body);
    print(codeResponse.data.caseId);
    if(codeResponse.statusCode==200){
      // Contractdraft succeededResponse =
      // contractdraftFromJson(_responseBody);
      // print(succeededResponse.data.caseId);
      Navigator.pushReplacement(context,
        MaterialPageRoute(builder:
            (context) =>
            DrawerScreen(place: Orderdetails(Order_Id: codeResponse.data.caseId))),
      );
    }else{

    }

  }
  Future<void> get(int caseID ) async {
    String _responseBody = await APIService.getdataa(data: caseID,   Route: ApiRoute.case_details,
        context: context,
        show_CircularDialog: true);
    print(_responseBody);
    CaseDetailsResponse casedetials_response = caseDetailsResponseFromJson(_responseBody.toString());
  }
}