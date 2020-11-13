

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sebha extends StatefulWidget{

  _Sebha createState()=>_Sebha();
}
class _Sebha extends State<Sebha>{
  static int sebhaCounter=0;

  BoxDecoration _mainBackground(){
    return BoxDecoration(
        image: DecorationImage(
          alignment: Alignment.topRight,
            image: AssetImage('assets/seb7a.png'),
            fit: BoxFit.fitWidth,
        ),
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [
              Colors.purple,
              Colors.blueAccent,
              Colors.red
            ])
    );
  }

  @override
  Widget build(BuildContext  context){
    return Container(
      alignment: Alignment.topLeft,
      decoration: _mainBackground(),
      child: Center(
        child: Container(
            padding: EdgeInsets.fromLTRB(0, 200, 0, 0),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/seb7abutton.png')
                    ),
                ),
                width: 100,height: 100,
                child: FlatButton(
                  splashColor: Colors.lightGreenAccent,
                  onPressed: (){
                    setState(() {
                      sebhaCounter+=1;
                    });
                  },
                  child: Text("$sebhaCounter",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30.0,fontStyle: FontStyle.italic,color: Colors.blueAccent)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      side: BorderSide(color: Colors.grey,width: 3.0)
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                width: 50,height: 50,
                child: FlatButton(
                    splashColor: Colors.red[900],
                    onPressed: (){
                      setState(() {
                        sebhaCounter = 0;
                      });
                    },
                    child: Icon(Icons.refresh,color: Colors.amber[900],size: 25,),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                    )
                ),
              )
            ],
          )
        )
      ),
    );
  }

}