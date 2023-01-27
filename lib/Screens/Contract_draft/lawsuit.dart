
import 'package:flutter/material.dart';
import 'package:law/Screens/Contract_draft/upload.dart';
import 'package:law/Screens/orderdetails.dart';

import '../../../api/requests/contractdraft_request.dart';
import '../../../api/responses/Cntrct_draft.dart';
import '../../../api/responses/casedetails_response.dart';
import '../../../api/responses/errror_respom.dart';
import '../../../api/services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/constant.dart';
import 'package:http/http.dart' as http;
import 'package:audio_waveforms/audio_waveforms.dart';

import 'dart:convert';
import 'dart:developer';

import '../../utils/Views.dart';
import '../drawer_screen.dart';


class Lawsuit_Dialog extends StatefulWidget {
  const Lawsuit_Dialog({
    Key? key,
  }) : super(key: key);

  @override
  State<Lawsuit_Dialog> createState() => _Lawsuit_DialogState();
}

class _Lawsuit_DialogState extends State<Lawsuit_Dialog> {

  final TextEditingController _Clientname_editing_C = TextEditingController();
  final TextEditingController _Capacity_editing_C = TextEditingController();
  final TextEditingController _2ndCapacity_editing_C = TextEditingController();
  final TextEditingController _Agaist_editing_C = TextEditingController();
  final TextEditingController _Courtlocation_editing_C = TextEditingController();
  final TextEditingController _Chamber_editing_C = TextEditingController();
  final TextEditingController _Floor_Room_editing_C = TextEditingController();
  final TextEditingController _Automated_editing_C = TextEditingController();
  final TextEditingController _Expert_editing_C = TextEditingController();
  final TextEditingController _CaseNo_editing_C = TextEditingController();
  final TextEditingController _WriteDetails_editing_C = TextEditingController();
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
        insetPadding: const EdgeInsets.only(top: 20,bottom: 20),
        contentPadding: EdgeInsets.zero,

        content:
        SingleChildScrollView(
          child: Container(
            height: height - 0,
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
                    child: Center(child: Text(Constant.lawsuit_Txt,style: TextStyle(fontFamily: 'Times',color: Colors.white,fontWeight: FontWeight.w600,fontSize: 22),)),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      alltextfield(textEditingControllers: _Clientname_editing_C, label: Constant.CD_clientname_hint,),
                      const SizedBox(height: 8,),
                      alltextfield(textEditingControllers: _Capacity_editing_C, label: Constant.Capacity_txt,),
                      const SizedBox(height: 8,),
                      alltextfield(textEditingControllers: _Agaist_editing_C, label: Constant.Agaist_txt,),
                      const SizedBox(height: 8,),
                      alltextfield(textEditingControllers: _2ndCapacity_editing_C, label: Constant.Capacity_txt,),
                      const SizedBox(height: 8,),
                      alltextfield(textEditingControllers: _Courtlocation_editing_C, label: Constant.CourtLocationtxt,),
                      const SizedBox(height: 8,),

                      alltextfield(textEditingControllers: _Chamber_editing_C, label: Constant.Court_Chambertxt,),
                      const SizedBox(height: 8,),
                      alltextfield(textEditingControllers: _Floor_Room_editing_C, label: Constant.Floor_Roomtxt,),
                      const SizedBox(height: 8,),

                      alltextfield(textEditingControllers: _Automated_editing_C, label: Constant.Automated_Notxt,),
                      const SizedBox(height: 8,),
                      alltextfield(textEditingControllers: _Expert_editing_C, label: Constant.Expert_Notxt,),
                      const SizedBox(height: 8,),

                      alltextfield(textEditingControllers: _WriteDetails_editing_C, label: Constant.Write_Detailstxt,),
                      const SizedBox(height: 8,),
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
                      SizedBox(height: 8,),
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
                                  postdata(_Clientname_editing_C.text,_Agaist_editing_C.text,_Capacity_editing_C.text,_2ndCapacity_editing_C.text,_details_editing_C.text,_Courtlocation_editing_C.text,"",_Floor_Room_editing_C.text,_Chamber_editing_C.text
                                  ,_Automated_editing_C.text,_Expert_editing_C.text,_CaseNo_editing_C.text);
                                  // Navigator.pushReplacement(context,
                                  //   MaterialPageRoute(builder:
                                  //       (context) =>
                                  //       DrawerScreen(place: Orderdetails(Order_Id: 12,))),
                                  // );
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
  Future<void> postdata(String ServiceName,String Against,String Capacity,String CapacitSecond,String Details,String Location,String DocumentDetails,String Room, String Chamber,String AutomatedNumber,String ExpertLocation,String CaseNumber ) async {
    print("servicenamee"+ServiceName);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString("accesstoken"));
    String? token=prefs.getString("accesstoken");
    var apiUrl = Uri.parse(APIService.BASE_URL2+ ApiRoute.createcase);
    var response = await http.post(apiUrl,
        body: {
          'ServiceName': "case-lawsuit",
          'ClientName': ServiceName,
          'against': Against,
          'Capacity': Capacity,
          'CapacitSecond': CapacitSecond,
          'Details': Details,
          'Location': Location,
          'DocumentDetails': DocumentDetails,
          'Room': Room,
          'Chamber': Chamber,
          'AutomatedNumber': AutomatedNumber,
          'ExpertLocation': ExpertLocation,
          'CaseNumber': CaseNumber,

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