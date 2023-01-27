import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expandable_text/expandable_text.dart';

import '../../utils/constant.dart';
bool _isclicked = false;
int checkedIndex = 0;

class Home_Other_Screen extends StatefulWidget {

  const Home_Other_Screen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _Home_Other_ScreenState createState() => _Home_Other_ScreenState();
}

class _Home_Other_ScreenState extends State<Home_Other_Screen> {

  @override
  void initState() {
    checkedIndex = 0;
    super.initState();
    _isclicked=false;
  }
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
          ),

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
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              widget.title,style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700,fontFamily: 'Times New Roman'),),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
            Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                        leading: const Icon(Icons.list),
                        trailing: const Text(
                          "GFG",
                          style: TextStyle(color: Colors.green, fontSize: 15),
                        ),
                        title: Text("List item $index"));
                  }),
            ),
          ],
        ),
      ),

    );
  }




}