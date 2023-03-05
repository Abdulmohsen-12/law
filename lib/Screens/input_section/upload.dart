import 'dart:io';

import 'package:flutter/material.dart';
import 'package:law/Screens/input_section/contract_drafting.dart';
import 'package:law/Screens/drawer_screen.dart';
import 'package:law/Screens/payment/payment.dart';

import '../../api/requests/contractdraft_request.dart';
import '../../api/responses/Cntrct_draft.dart';
import '../../api/services/api_service.dart';
import '../../utils/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import '../common/orderdetails.dart';

class Upload_dialog extends StatefulWidget {
  const Upload_dialog({
    Key? key,
  }) : super(key: key);

  @override
  State<Upload_dialog> createState() => _Upload_dialogState();
}

class _Upload_dialogState extends State<Upload_dialog> {
  late String filesname="";
    PlatformFile? file ;
  late List<String?> filePaths;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    final TextEditingController _docdescrip_editing_C = TextEditingController();
    final TextEditingController _date_editing_C = TextEditingController();
    return AlertDialog(

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      insetPadding: const EdgeInsets.only(top: 90,bottom: 90),
      contentPadding: EdgeInsets.zero,

      content:
      SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Container(
          width: width - 40,
          child: Column(
            children: [

              Container(
                width: width,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Stack(
                      children:[
                        Image.asset("assets/images/Contrctdraft_title_BG.png"),
                        const Positioned(
                          left:120 ,
                          top: 10,
                          child: const Text(Constant.upload,
                            style: const TextStyle(
                              color:Colors.white,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Times',
                              fontSize: 20,

                            ),
                          ),
                        )
                      ]),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: (){
                    // filepick();
                        selectFile();
                      },
                      child: filesname.isEmpty? Container(
                        width: width,
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
                        child: Column(
                          children:  [
                            SizedBox(height: 8,),
                            Text(Constant.add_doc_txt,
                              style: TextStyle(
                                color:AppColors.blue_light,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Avenir',
                                fontSize: 13,

                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8,top: 8),
                              child: Row(
                                children: [
                                  Text(Constant.PDF_txt,
                                    style: TextStyle(
                                      color:AppColors.blue_light,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Avenir',
                                      fontSize: 13,

                                    ),
                                  ),
                        SizedBox(width: 8,),
                        Image.asset("assets/icons/pdficon.png"),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8,top: 8),
                              child: Row(
                                children: [
                                  Text(Constant.Google_Drive_txt,
                                    style: TextStyle(
                                      color:AppColors.blue_light,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Avenir',
                                      fontSize: 13,

                                    ),
                                  ),
                                  SizedBox(width: 8,),
                        Image.asset("assets/icons/driveIcon.png"),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8,top: 8),
                              child: Row(
                                children: [
                                  Text(Constant.Photos_txt,
                                    style: TextStyle(
                                      color:AppColors.blue_light,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Avenir',
                                      fontSize: 13,

                                    ),
                                  ),
                                  SizedBox(width: 8,),
                                  Image.asset("assets/icons/photos.png"),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8,top: 8),
                              child: Row(
                                children: [
                                  Text(Constant.Camera_txt,
                                    style: TextStyle(
                                      color:AppColors.blue_light,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Avenir',
                                      fontSize: 13,

                                    ),
                                  ),
                                  SizedBox(width: 8,),
                                  Image.asset("assets/icons/imgicon.png"),
                                ],
                              ),
                            ),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8,top: 8,bottom: 8),
                                child: Text(Constant.Others_txt,
                                  style: TextStyle(
                                    color:AppColors.blue_light,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Avenir',
                                    fontSize: 13,

                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                      ):Container(
                        width: width,
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
                        child:     Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(filesname,
                              style: TextStyle(
                                color:AppColors.blue_light,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Avenir',
                                fontSize: 13,

                              ),
                            ),
                          ),
                        ),

                      ),
                    ),
                    const SizedBox(height: 8,),
                    TextFormField(
                      controller: _docdescrip_editing_C,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        filled: true,
                        hintText:Constant.docdesc_txt,
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
                      controller: _date_editing_C,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        filled: true,
                        hintText:Constant.Date_txt,
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

                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: (){
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
                          const SizedBox(width: 8),
                          Expanded(
                            child: GestureDetector(
                              onTap: (){
                              //  postFile(filePaths[0]!);
                                Navigator.pop(context, filePaths);
                             //   Navigator.push(context, new MaterialPageRoute(builder: (context) => new Contract_draft_Dialog(filePaths: filePaths[0]!,)));

                               // postdata(file??null);
                               // showDialog(context: context, builder:  (BuildContext context) => Thank_youDialog());
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
                                    child: Text(Constant.Save_txt,
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
    );

  }
  Future<void> selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: true
    );
    if (result != null) {

      setState(() {
        filesname= result.files[0].name;
        filePaths = result.paths;

      });

    }

  }

}

class Thank_youDialog extends StatelessWidget {
  const Thank_youDialog({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return AlertDialog(

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      insetPadding: const EdgeInsets.only(top: 90,bottom: 90),
      contentPadding: EdgeInsets.zero,

      content:
      SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Container(
          width: width - 40,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(Constant.thanku_txt,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color:Colors.black,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Avenir',
                    fontSize: 14,

                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8,),
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
                          const SizedBox(width: 8),
                          Expanded(
                            child: GestureDetector(
                              onTap: (){
                                Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder:
                                      (context) =>
                                      DrawerScreen(place: Payment_screen())),
                                );
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
                                    child: Text(Constant.Pay_txt,
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
    );
  }
}