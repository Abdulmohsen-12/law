
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expandable_text/expandable_text.dart';

import '../../utils/constant.dart';

class TermsCondition_Screen extends StatefulWidget {

  const TermsCondition_Screen({Key? key}) : super(key: key);

  @override
  _TermsCondition_ScreenState createState() => _TermsCondition_ScreenState();
}

class _TermsCondition_ScreenState extends State<TermsCondition_Screen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Image.asset(
                "assets/icons/hamburger.png"
            ),
            onPressed: () {
              // do something
            },
          )
        ],
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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                Constant.Terms_conditionTxt,style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700,fontFamily: 'Times New Roman'),),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
              ExpandableText("tezdfdzdfdfdsfdasxt", expandText: "expandText",
                collapseText: 'show less',
                maxLines: 1,
                linkColor: Colors.blue,),
              Text(
                Constant.Terms_conditionTxt_desc,style: TextStyle( height:1  ,fontSize: 15,fontWeight: FontWeight.w400,fontFamily: 'Inter'),),

              SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
              Text(
                Constant.definations_Txt,style: TextStyle( height:1  ,fontSize: 18,fontWeight: FontWeight.w500,fontFamily: 'Inter'),),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
              Text(
                Constant.definations_descTxt,style: TextStyle( height:1  ,fontSize: 15,fontWeight: FontWeight.w400,fontFamily: 'Inter'),),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
              Text(
                Constant.service_Txt,style: TextStyle( height:1  ,fontSize: 18,fontWeight: FontWeight.w500,fontFamily: 'Inter'),),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
              Text(
                Constant.service_Desc_Txt,style: TextStyle( height:1  ,fontSize: 15,fontWeight: FontWeight.w400,fontFamily: 'Inter'),),



            ],
          ),
        ),
      ),
    );
  }



}