
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:law/Screens/Contract_draft/lawsuit.dart';
import 'package:law/Screens/my_orders/My_Orders.dart';
import '../../utils/constant.dart';
import 'Contract_draft/consultion.dart';
import 'Contract_draft/contract_drafting.dart';
import 'drawer_screen.dart';
import 'other.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
bool _isclicked = false;
bool _ispagechng = false;
int checkedIndex = -1;

class Home_Screen extends StatefulWidget {

  const Home_Screen({Key? key}) : super(key: key);


  @override
  _Home_ScreenState createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
@override
  void initState() {
  checkedIndex = -1;
    super.initState();
    _isclicked=true;
  _ispagechng=false;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: scaffoldKey,
      appBar:
     !_ispagechng? AppBar(
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
              // print();

              if (ZoomDrawer.of(context)!.isOpen()) {
                ZoomDrawer.of(context)!.close();
              } else {
                ZoomDrawer.of(context)!.open();
              }
              // do something
            },
          )
        ],
      ):    AppBar(
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
                setState(() {
                  _ispagechng = false;
                });

                 },
                 child: Row(
                   mainAxisSize: MainAxisSize.min,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children:   [
                     Image.asset("assets/icons/arrows.png"),
                     const Text(
                       "BACK",style: const TextStyle( height:1  ,fontSize: 15,),)
                   ],),
               )),
           Align(
               alignment: Alignment.centerRight,
               child: InkWell(
                 onTap: (){

                   if (ZoomDrawer.of(context)!.isOpen()) {
                     ZoomDrawer.of(context)!.close();
                   } else {
                     ZoomDrawer.of(context)!.open();
                   }
                 },
                 child:   Image.asset("assets/icons/hamburger.png"),
               )),

         ],
       ),
     ),
      body:
      !_ispagechng?Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              Constant.home_title_Txt,style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700,fontFamily: 'Times New Roman'),),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
            Expanded(
              child: Container(
                child: ListView(
                  padding: const EdgeInsets.all(8),
                  children: <Widget>[
                    GestureDetector(
                                  onTap: (){
                                    print("clicked");
                                    setState(() {
                                      checkedIndex = -1;
                                      _ispagechng = true;
                                    });

                                  },
                      child: Container(

                          decoration:   const BoxDecoration(
                              color: AppColors.blue_light_grid,
                              borderRadius: BorderRadius.only(
                                  bottomRight: const Radius.circular(15),
                                  bottomLeft: const Radius.circular(15),
                                  topLeft: const Radius.circular(15),
                                  topRight: const Radius.circular(15)
                              )),

                          child: Center(child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                const SizedBox(height: 40,),
                                Stack(
                                  children: [
                                    Image.asset("assets/icons/Ellipse.png"),
                                    const Positioned(
                                        left: 15,
                                        top: 15,
                                        child: const ImageIcon(
                                            const AssetImage("assets/icons/createorder.png"),
                                            size:50.0, color:Colors.white)),

                                  ],
                                ),
                                const SizedBox(height: 12,),
                                const Text("Create order",style: TextStyle(color: Colors.white,fontFamily: 'Inter',fontWeight: FontWeight.w500,fontSize: 16),),
                                const SizedBox(height: 12,),
                              ]
                          ),
                          )

                      ),
                    ),
                    const SizedBox(height: 8,),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  My_order_screen()),
                        );
                        // Navigator.pushReplacement(context,
                        //   MaterialPageRoute(builder:
                        //       (context) =>
                        //       DrawerScreen(place: My_order_screen())),
                        // );
                      },
                      child: Container(
                              decoration:   const BoxDecoration(
                              color: AppColors.blue_light_grid,
                              borderRadius: BorderRadius.only(
                                  bottomRight: const Radius.circular(15),
                                  bottomLeft: Radius.circular(15),
                                  topLeft: const Radius.circular(15),
                                  topRight: Radius.circular(15)
                              )),

                          child: Center(child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                const SizedBox(height: 40,),
                                Stack(
                                  children: [
                                    Image.asset("assets/icons/Ellipse.png"),
                                    const Positioned(
                                        left: 15,
                                        top: 15,
                                        child: ImageIcon(
                                            AssetImage("assets/icons/order.png"),
                                            size:50.0, color:Colors.white)),

                                  ],
                                ),
                                const SizedBox(height: 12,),
                                const Text("My orders",style: const TextStyle(color: Colors.white,fontFamily: 'Inter',fontWeight: FontWeight.w500,fontSize: 16),),
                                const SizedBox(height: 12,),
                              ]
                          ),
                          )

                      ),
                    )
                  ],
                )
              ),
            ),
          ],
        ),
      ):
      Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              Constant.home_title_Txt,style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700,fontFamily: 'Times New Roman'),),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
            Expanded(
              child: Container(
                  child:GridView.count( crossAxisCount: 2,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 8.0,
                    children: List.generate(choices.length, (index) {

                      bool checked = index == checkedIndex;
                      print(checked);
                      return Center(
                        child: GestureDetector (

                            onTap: (){
                              setState(() {
                                if(choices[index].title==Constant.contract_Txt){
                                  // ignore: prefer_const_constructors
                                  showDialog(context: context, builder:  (BuildContext context) => Contract_draft_Dialog());
                                }
                                if(choices[index].title==Constant.consultation_Txt){
                                  // ignore: prefer_const_constructors
                                  showDialog(context: context, builder:  (BuildContext context) => Consultion_Dialog());
                                }
                                if(choices[index].title==Constant.lawsuit_Txt){
                                  // ignore: prefer_const_constructors
                                  showDialog(context: context, builder:  (BuildContext context) => Lawsuit_Dialog());
                                }
                                if(!_isclicked){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>     Home_Other_Screen(title: choices[index].title,)),
                                  );
                                }


                                checkedIndex = index;

                              });

                            },
                            child: SelectCard(choice: choices[index], key: null, checked: checked,)),
                      );
                    }

                    ),
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }




}



class Choice {
   Choice({required this.title, required this.icon,required this.icon2});
  final String title;
  final String icon;
  final String icon2;
}

 List<Choice> choices =  <Choice>[
   Choice(title: Constant.contract_Txt, icon:"assets/icons/contract.png", icon2:"assets/images/splash_img.png"),
   Choice(title:  Constant.consultation_Txt, icon:"assets/icons/consultion.png", icon2:"assets/images/splash_img.png"),
   Choice(title:  Constant.lawsuit_Txt, icon:"assets/icons/case.png",icon2:"assets/images/splash_img.png"),
   Choice(title:  Constant.otherSRVC_Txt, icon:"assets/icons/ep_suitcase.png",icon2:"assets/images/splash_img.png"),

];
 class SelectCard extends StatelessWidget {
  const SelectCard({Key? key, required this.choice, required this.checked}) : super(key: key);
  final Choice choice;
  final bool checked;


  @override
  Widget build(BuildContext context) {

    //final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return  checked?Container(
       decoration:   BoxDecoration(
           image: DecorationImage(
             image: AssetImage(choice.icon2.toString()),
             fit: BoxFit.cover,
           ),
           color: AppColors.blue_light_grid,
           borderRadius: const BorderRadius.only(
           bottomRight: Radius.circular(15),
           bottomLeft: Radius.circular(15),
             topLeft: const Radius.circular(15),
             topRight: Radius.circular(15)
           )),

        child: Center(child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 40,),
              Stack(
                children: [
                  Image.asset("assets/icons/Ellipse.png"),
                  Positioned(
                    left: 15,
                      top: 15,
                      child: ImageIcon(
                          AssetImage(choice.icon.toString()),
                          size:50.0, color:Colors.white)),

                ],
              ),
              const SizedBox(height: 10,),
              Text(choice.title,style: const TextStyle(color: Colors.white,fontFamily: 'Inter',fontWeight: FontWeight.w500,fontSize: 16),),
            ]
        ),
        )
    ):Container(

        decoration:   const BoxDecoration(

            color: AppColors.blue_light_grid,
            borderRadius: BorderRadius.only(
                bottomRight: const Radius.circular(15),
                bottomLeft: Radius.circular(15),
                topLeft: Radius.circular(15),
                topRight: const Radius.circular(15)
            )),

        child: Center(child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 40,),
              Stack(
                children: [
                  Image.asset("assets/icons/Ellipse.png"),
                  Positioned(
                      left: 15,
                      top: 15,
                      child: ImageIcon(
                          AssetImage(choice.icon.toString()),
                          size:50.0, color:Colors.white)),

                ],
              ),
              const SizedBox(height: 10,),
              Text(choice.title,style: const TextStyle(color: Colors.white,fontFamily: 'Inter',fontWeight: FontWeight.w500,fontSize: 16),),
            ]
        ),
        )
    );
  }
}