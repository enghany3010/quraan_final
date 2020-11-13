import 'package:flutter/gestures.dart';
import 'package:full_screen_menu/full_screen_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quraan/pages/Sebha.dart';
import 'package:quraan/pages/TasbeehPageTape.dart';
import 'HomePage_Tape.dart';
import 'ReadQuraan.dart';

class HomeTappedPage extends StatefulWidget {
  @override
  _HomeTappedPage createState() => _HomeTappedPage();
}

class _HomeTappedPage extends State<HomeTappedPage> {

  int readerPerson = 1;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          drawer: Drawer(
            child: Column(
              children: [
                AppBar(
                  backgroundColor: Color.fromRGBO(148, 39, 178, 1),
                  title: Text("الاعدادت"),
                ),
                Container(
                  color: Colors.purple,
                  child: selectReader(),
                ),
              ],
            ),
          ),
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Color.fromRGBO(148, 39, 178, 1),
            title: Text("الرئيسية"),
            bottom: TabBar(
                labelColor: Colors.white,
                tabs: <Widget>[
                  Tab(
                    child: Text("استماع"),
                    icon: Icon(Icons.home),),
                  Tab(
                    child: Text("القراءن"),
                    icon: Icon(Icons.book),),
                  Tab(
                    child: Text("التسبيح"),
                    icon: Icon(Icons.timelapse),),
                  Tab(
                    child: Text("السبحة"),
                    icon: Icon(Icons.scatter_plot),),
                ]),
          ),
          body: TabBarView(
              children: <Widget>[
                HomePage_Tape(readerPerson),
                ReadQuraan(),
                TasbeehPageTape(),
                Sebha(),
              ]),
        )
    );
  }

  Column selectReader() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text("أختر القارئ",
          style: TextStyle(fontSize: 20.0, color: Colors.white),),
        Card(
          color: Colors.white38,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(backgroundImage: AssetImage('assets/mashary.jpg')),
              Text(" القارئ الشيخ: مشاري العفاسي ",
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0),),
              IconButton(
                  onPressed: () {
                    setState(() {
                      readerPerson = 1;
                      Navigator.pop(context);
                    });
                  },
                  icon: Icon(Icons.check_circle_outline, color: Colors.white)
              )
            ],
          ),
        ),
        Card(
          color: Colors.white38,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(backgroundImage: AssetImage('assets/sudais.jpg')),
              Text("القارئ الشيخ:عبد الرحمن السديس ",
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0)),
              IconButton(
                  onPressed: () {
                    setState(() {
                      readerPerson = 2;
                      Navigator.pop(context);
                    });
                  },
                  icon: Icon(Icons.check_circle_outline, color: Colors.white,)
              )
            ],
          ),
        ),
        Card(
          color: Colors.white38,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(backgroundImage: AssetImage('assets/Ghamdy.png')),
              Text("      القارئ الشيخ: سعد الغامدي",
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0)),
              IconButton(
                  onPressed: () {
                    setState(() {
                      readerPerson = 3;
                      Navigator.pop(context);
                    });
                  },
                  icon: Icon(Icons.check_circle_outline, color: Colors.white)
              )
            ],
          ),
        ),
       Divider(height: MediaQuery.of(context).size.height/3,),
       SingleChildScrollView(
         child: Column(
           children: [
             Container(
               child: RaisedButton(
                 color: Colors.white38,
                 splashColor: Colors.red,
                 onPressed: () {
                   showFullScreen(context, 'assets/appinfo.png',false);
                   Navigator.pop(context);
                 },
                 child: Text("About App", style: TextStyle(color: Colors.white),),
                 shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(20.0),
                     side: BorderSide(color: Colors.blue)
                 ),
               ),
             ),
             Divider(
               height: 8,
             ),
             Container(
              // width: 150, height: 40,
               child: RaisedButton(
                 color: Colors.white38,
                 splashColor: Colors.red,
                 onPressed: () {
                   Navigator.pop(context);
                   showFullScreen(context,'assets/developerinfo.png',true);
                 },
                 child: Text(
                   "About Deeveloper", style: TextStyle(color: Colors.white),),
                 shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(20.0),
                     side: BorderSide(color: Colors.blue)
                 ),
               ),
             ),
           ],
         ),
       ),
      ],
    );
  }

  void showFullScreen(BuildContext context,String imgstr,bool s) {
    return FullScreenMenu.show(context,
        items: [
             Image.asset(imgstr,height: MediaQuery.of(context).size.height/1.9,fit: BoxFit.contain,),
          s?SingleChildScrollView(
            child: Column(
              children: [
                CircleAvatar(backgroundImage: AssetImage('assets/developer.jpg')),
                Text("http://linkedin.com/in/hani-nady-a54405140",style: TextStyle(color: Colors.blueAccent),),
                Text("https://github.com/enghany3010",style: TextStyle(color: Colors.blueAccent),),
              ],
            )
          ):Divider(height: 1.0,),
        ]
      );
  }

}

