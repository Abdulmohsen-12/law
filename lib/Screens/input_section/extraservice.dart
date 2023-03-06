import 'dart:io';

import 'package:flutter/material.dart';
import 'package:law/Screens/input_section/upload.dart';

import '../../utils/constant.dart';
import 'package:file_picker/file_picker.dart';

class extra_dialog extends StatefulWidget {
  final TextEditingController docdescrip_editing_C;
  final TextEditingController date_editing_C;
  final String label1;
  final String label2;
  final String titletext;
  const extra_dialog({
    Key? key,
    required this.docdescrip_editing_C,
    required this.date_editing_C,
    required this.label1,
    required this.label2, required this.titletext,
  }) : super(key: key);

  @override
  State<extra_dialog> createState() => _extra_dialogState();
}

class _extra_dialogState extends State<extra_dialog> {
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
                  child: Center(child: Text(widget.titletext,style: TextStyle(fontFamily: 'Times',color: Colors.white,fontWeight: FontWeight.w600,fontSize: 27),)),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    TextFormField(
                      controller: widget.docdescrip_editing_C,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        filled: true,
                        hintText:widget.label1,
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
                      controller: widget.date_editing_C,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        filled: true,
                        hintText:widget.label2,
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
                                Navigator.of(context).pop();
                                showDialog(context: context, builder:  (BuildContext context) => Thank_youDialog());
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

}
