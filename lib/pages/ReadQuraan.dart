
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReadQuraan extends StatefulWidget{
  @override
  readquraan createState()=>readquraan();
}

class readquraan extends State<ReadQuraan>{

  bool is_loading = true;
  PDFDocument docpdf;
  BoxDecoration _mainBackground(){
    return BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/read.png')
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
  void initState() {
    LoadDocumentpdf();
  }
  void LoadDocumentpdf() async{
    docpdf = await PDFDocument.fromAsset('assets/quraanpdf1.pdf');
    setState(() {
      is_loading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
      return Container(
         decoration:_mainBackground() ,
          child: Center(
            child:is_loading?
            Center(
              child: Theme.of(context).platform == TargetPlatform.iOS?CupertinoActivityIndicator():CircularProgressIndicator(backgroundColor: Colors.red,),):
                   PDFViewer(
                     document: docpdf,
                     zoomSteps: 2,
                     enableSwipeNavigation: true,
                     indicatorBackground: Colors.black,
                   panLimit: 10, showNavigation: true,
                   ),
               )
      );
  }

}