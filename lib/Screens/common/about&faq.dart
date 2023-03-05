import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:law/Screens/drawer_screen.dart';
import 'package:law/api/responses/details_response.dart';

import '../../api/services/api_service.dart';
import '../../utils/constant.dart';

class About_screen extends StatefulWidget {
  late int about_status;

  About_screen({Key? key, required this.about_status});

  @override
  _About_screenState createState() => _About_screenState();
}

class _About_screenState extends State<About_screen> {
  static var details = "";

  @override
  void initState() {
    getdetails();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("assets/icons/arrows.png"),
                      const Text(
                        "BACK",
                        style: const TextStyle(
                          height: 1,
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                )),
            Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    if (ZoomDrawer.of(context)!.isOpen()) {
                      ZoomDrawer.of(context)!.close();
                    } else {
                      ZoomDrawer.of(context)!.open();
                    }
                  },
                  child: Image.asset("assets/icons/hamburger.png"),
                )),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.about_status == 0
                  ? Text(
                      Constant.Aboutus_txt,
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Times New Roman'),
                    )
                  : Text(
                      Constant.FAqs_txt,
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Times New Roman'),
                    ),
              SizedBox(
                height: 10,
              ),
              Text(
                details,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Inter',
                    color: Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getdetails() async {
    String _responseBody = await APIService.getAPI(
        Route: ApiRoute.about_description,
        context: context,
        show_CircularDialog: false);
    DetailsResponse profileResponse = detailsResponseFromJson(_responseBody);
    print(_responseBody);
    if (profileResponse.statusCode == 200) {
      setState(() {
        details = profileResponse.data.details;
        print(profileResponse.data.details);
      });
    }
  }
}
