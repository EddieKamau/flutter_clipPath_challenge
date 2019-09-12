import 'package:flutter/material.dart';
import 'package:challenge_03/my_custom_icons_icons.dart';
import 'package:flutter/services.dart';

void main() { 


SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromRGBO(52, 73, 94,1.0),
        accentColor: Color.fromRGBO(87, 101, 116,1.0),
      ),
      home: MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          TopSection(),
          Expanded(
            child: BodySection(),
          ),
        ],
      ),      
    );
  }
}


class TopSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 220,
        child: Stack(
          children: <Widget>[
            ClipPath(
              clipper: TopClipper(),
                child: Container(
                  color: Color.fromRGBO(44, 62, 80,1.0),
                  height: 180,
                  width: double.maxFinite,
                ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ClipPath(
                clipper: ImageClipper(),
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  color: Theme.of(context).accentColor,
                  height: 155,
                  width: 125,
                  child: ClipPath(
                    clipper: ImageClipper(),
                    child: Image.asset('assets/img1.jpg', fit: BoxFit.cover,),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14, right: 15, top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(Icons.search, color: Theme.of(context).primaryColor, size: 22,),
                  Icon(Icons.settings, color: Colors.white, size: 22,),
                ],
              ),
            ),
          ],
        ),
      );
  }
}



class TopClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;

    final path = Path();
    path.moveTo(width*0.18, 0.0);
    path.lineTo(width, 0.0);
    path.lineTo(width, height*0.94);
    path.lineTo(width*0.98, height);
    path.lineTo(width*0.5, height);
    path.lineTo(width*0.16, height*0.08);

    path.close();
    return path;

  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {

    return true;
  }
}

class ImageClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;
    final path = Path();

    path.moveTo(width/2, 0.0);
    path.lineTo(width, height*0.25);
    path.lineTo(width, height*0.75);
    path.lineTo(width/2, height);
    path.lineTo(0.0, height*0.75);
    path.lineTo(0, height*0.25);

    


    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class BodySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Bottom left Clip
        Align(
          alignment: Alignment.bottomLeft,
          child: ClipPath(
            clipper: BottomLeftClipper(),
            child: Container(
              color: Theme.of(context).accentColor,
              height: 120,
              width: 80,
              padding: EdgeInsets.only(top: 13, right: 12),
              child: ClipPath(
                clipper: BottomLeftClipper(),
                child: Container(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
        ),
        BodyContent(),
      ],
    );
  }
}

class BottomLeftClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;
    final path = Path();

    path.lineTo(width, height*0.3);
    path.lineTo(width, height);
    path.lineTo(0, height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class BodyContent extends StatelessWidget {

  Widget IconPallet(context){
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                radius: 17,
                child: Padding(
                  padding: const EdgeInsets.only(top: 7.0),
                  child: Icon(
                    MyCustomIcons.facebook_squared,
                    size: 19,
                    color: Colors.white,
                  ),
                ),
              ),
              
              CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                radius: 17,
                child: Padding(
                  padding: const EdgeInsets.only(top: 7.0),
                  child: Icon(
                    MyCustomIcons.gplus,
                    size: 17,
                    color: Colors.white,
                  ),
                ),
              ),
              CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                radius: 17,
                child: Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: Icon(
                    MyCustomIcons.instagram,
                    size: 19,
                    color: Colors.white,
                  ),
                ),
              ),

            ],
          );
  }

  Widget numberItem({context, String digit, String text}){
    return Column(
          children: <Widget>[
            Text(digit, style: TextStyle(fontSize: 27, color: Theme.of(context).primaryColor),),
            Text(text, style: TextStyle(fontSize: 11, color: Theme.of(context).primaryColor),),
          ],
        );
  }

  Widget VerticalDivider(context){
      return Container(
        color: Theme.of(context).primaryColor,
        width: 1,
        height: 30,
      );
  }

  Widget NumberRow(context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        numberItem(context: context,digit: "09", text: "Hour"),
        VerticalDivider(context),
        
        numberItem(context: context,digit: "55", text: "Months"),
        VerticalDivider(context),
        numberItem(context: context,digit: "17", text: "Oct"),
        VerticalDivider(context),
        numberItem(context: context,digit: "60", text: "some"),



      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.only(top: 30, left: 45, right: 45),
      child: Column(
        children: <Widget>[
          Text(
            "CG Eddie".toUpperCase(),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).primaryColor,
              letterSpacing: 0.5
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Good Morning! Today will be rain around \n veinticinca to treita y tres gradas ceisus",
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontWeight: FontWeight.w400,
              fontSize: 14
            ),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 30),
          IconPallet(context),
          SizedBox(height: 35),
          // Horizontal Divider
          Container(
            width: double.maxFinite,
            height: 1,
            color: Theme.of(context).accentColor,
          ),
          SizedBox(height: 45),
          // Number row
          NumberRow(context),
          SizedBox(height: 55),
          // Button
          Container(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.only(topLeft: Radius.circular(14), bottomLeft: Radius.circular(14), topRight: Radius.circular(14), bottomRight: Radius.circular(14),)),
            height: 27,
            width: 75,
            child: Center(
              child: Text(
                "Drawer",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}











