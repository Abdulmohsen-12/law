import 'package:flutter/material.dart';

import 'constant.dart';

class Whitebutton extends StatefulWidget {
  final String btntext;
  const Whitebutton({
    Key? key,
    required this.btntext,

  }) : super(key: key);

  @override
  State<Whitebutton> createState() => _WhitebuttonState();
}

class _WhitebuttonState extends State<Whitebutton> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Align(
            alignment: Alignment.center,
            child: Text(widget.btntext)),
      ),

    );
  }
}


class imgtxtbutton extends StatefulWidget {
  final String btntext;
  const imgtxtbutton({
    Key? key,
    required this.btntext,

  }) : super(key: key);

  @override
  State<imgtxtbutton> createState() => _imgtxtbuttonstate();
}

class _imgtxtbuttonstate extends State<imgtxtbutton> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/icons/chat.png",scale: 2,),
            SizedBox(width: 5,),
            Text(widget.btntext,style: TextStyle(fontFamily: 'Inter',color: Colors.white),),
          ],
        ),
      ),

    );
  }

}

class alltextfield extends StatefulWidget {
  final TextEditingController textEditingControllers;
  final String label;
  const alltextfield({
    Key? key,
    required this.textEditingControllers, required this.label,

  }) : super(key: key);
  @override
  _alltextfieldState createState() => _alltextfieldState();
}

class _alltextfieldState extends State<alltextfield> {

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textEditingControllers,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        filled: true,
        hintText:widget.label,
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
    );
  }
}

class profiletextfield extends StatefulWidget {
  final TextEditingController textEditingControllers;
  final String label;
  const profiletextfield({
    Key? key,
    required this.textEditingControllers, required this.label,

  }) : super(key: key);
  @override
  _profiletextfieldState createState() => _profiletextfieldState();
}

class _profiletextfieldState extends State<profiletextfield> {

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textEditingControllers,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        filled: true,
        hintText:widget.label,
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
    );
  }
}
