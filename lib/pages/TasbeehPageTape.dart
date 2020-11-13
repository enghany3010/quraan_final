import 'package:share/share.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TasbeehPageTape extends StatefulWidget{
  @override
  _TasbeehPageTape createState()=>_TasbeehPageTape();
}


class _TasbeehPageTape extends State<TasbeehPageTape>{


  BoxDecoration _mainBackground(){
    return BoxDecoration(
        image: DecorationImage(
          alignment: Alignment.topLeft,
            image: AssetImage('assets/seb7a.png')
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

  String GetData1(int id,List data){
    return data[id];
  }

  Future<void> _showMyDialog(int id,BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                    side: BorderSide(color: Colors.blue)
                 ),
          backgroundColor: Colors.white70,
          title: Text('أكتمل',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(Tasbe7[id],style: TextStyle(fontSize: 20.0,color: Colors.amber[900],fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
           FlatButton(
             onPressed: (){
                shareIt(context, Tasbe7[id]);
             }, child: Icon(Icons.share))
          ],
        );
      },
    );
  }

  void setCounters(int index){
     Counters[index] +=1;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(30, 30, 30, 1),
        body:Container(
          decoration: _mainBackground(),
          child: ListView.builder(
              itemCount: Tasbe7.length,
              itemBuilder: (BuildContext context,int index){
                return Container(
                  padding: EdgeInsets.all(5.0),
                  color: Colors.white38,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(GetData1(index, Tasbe7),maxLines: 4,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center,),
                      Text(GetData1(index, TasbeehBest),maxLines: 4,style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),
                      Container(
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 80,height: 80,
                              child:  RaisedButton(
                                color: Colors.amber[900],
                                splashColor: Colors.blue[900],
                                onPressed: (){
                                  if(Counters[index]==int.parse(tasbehReapeat[index])-1){
                                    _showMyDialog(index,context);
                                    Counters[index]=0;
                                  }
                                  setState(() {
                                    setCounters(index);
                                  });
                                }
                                ,child: Text(Counters[index].toString()+'/'+GetData1(index, tasbehReapeat)),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40.0),
                                    side: BorderSide(color: Colors.blue)
                                ),
                              ),
                            ),
                            FlatButton(
                                onPressed: (){
                                  //shareIt(context, Tasbe7[index]);
                                  _showMyDialog(index, context);
                                },
                                child: Icon(Icons.share,color: Colors.blueAccent,size: 40,))
                          ],
                        )
                      ),
                    ],
                  ),
                );
              }
          ),
        )
    );
  }
  void shareIt(BuildContext context,String txt) async{
    final RenderBox box = context.findRenderObject();
    if(txt.isNotEmpty){
      await Share.share(txt,
        subject: "السبحة الالكترونيه",
      sharePositionOrigin: box.localToGlobal(Offset.zero)&box.size);
    }

  }

  List<String> Tasbe7=[
    'سُبْحَانَ اللَّهِ',
    'سُبْحَانَ اللَّهِ وَبِحَمْدِهِ',
    'سُبْحَانَ اللَّهِ وَالْحَمْدُ لِلَّهِ',
    'سُبْحَانَ اللهِ العَظِيمِ وَبِحَمْدِهِ',
    'سُبْحَانَ اللَّهِ وَبِحَمْدِهِ ، سُبْحَانَ اللَّهِ الْعَظِيمِ',
    'لَا إلَه إلّا اللهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ وَهُوَ عَلَى كُلُّ شَيْءِ قَدِيرِ',
    'لا حَوْلَ وَلا قُوَّةَ إِلا بِاللَّهِ',
    'الْحَمْدُ للّهِ رَبِّ الْعَالَمِينَ',
    'الْلَّهُم صَلِّ وَسَلِم وَبَارِك عَلَى سَيِّدِنَا مُحَمَّد',
    'أستغفر الله ',
    'سُبْحَانَ الْلَّهِ، وَالْحَمْدُ لِلَّهِ، وَلَا إِلَهَ إِلَّا الْلَّهُ، وَالْلَّهُ أَكْبَ',
    'لَا إِلَهَ إِلَّا اللَّهُ',
    'الْلَّهُ أَكْبَرُ',
    'سُبْحَانَ اللَّهِ ، وَالْحَمْدُ لِلَّهِ ، وَلا إِلَهَ إِلا اللَّهُ ، وَاللَّهُ أَكْبَرُ ، اللَّهُمَّ اغْفِرْ لِي ، اللَّهُمَّ ارْحَمْنِي ، اللَّهُمَّ ارْزُقْنِ',
    'الْحَمْدُ لِلَّهِ حَمْدًا كَثِيرًا طَيِّبًا مُبَارَكًا فِيهِ',
    'اللَّهُ أَكْبَرُ كَبِيرًا ، وَالْحَمْدُ لِلَّهِ كَثِيرًا ، وَسُبْحَانَ اللَّهِ بُكْرَةً وَأَصِيلاً',
    'اللَّهُمَّ صَلِّ عَلَى مُحَمَّدٍ وَعَلَى آلِ مُحَمَّدٍ كَمَا صَلَّيْتَ عَلَى إِبْرَاهِيمَ , وَعَلَى آلِ إِبْرَاهِيمَ إِنَّكَ حَمِيدٌ مَجِيدٌ , اللَّهُمَّ بَارِكْ عَلَى مُحَمَّدٍ وَعَلَى آلِ مُحَمَّدٍ كَمَا بَارَكْتَ عَلَى إِبْرَاهِيمَ وَعَلَى آلِ إِبْرَاهِيمَ إِنَّكَ حَمِيدٌ مَجِيدٌ'
  ];
  List<String> TasbeehBest=[
    'يكتب له ألف حسنة أو يحط عنه ألف خطيئة',
    'حُطَّتْ خَطَايَاهُ وَإِنْ كَانَتْ مِثْلَ زَبَدِ الْبَحْرِ. لَمْ يَأْتِ أَحَدٌ يَوْمَ الْقِيَامَةِ بِأَفْضَلَ مِمَّا جَاءَ بِهِ إِلَّا أَحَدٌ قَالَ مِثْلَ مَا قَالَ أَوْ زَادَ عَلَيْهِ',
    'تَمْلَآَنِ مَا بَيْنَ السَّمَاوَاتِ وَالْأَرْضِ',
    'غرست له نخلة في الجنة (أى عدد)',
    'ثقيلتان في الميزان حبيبتان إلى الرحمن (أى عدد)',
    'كانت له عدل عشر رقاب، وكتبت له مئة حسنة، ومحيت عنه مئة سيئة، وكانت له حرزا من الشيطان',
    'كنز من كنوز الجنة (أى عدد)',
    'تملأ ميزان العبد بالحسنات',
    'من صلى على حين يصبح وحين يمسى ادركته شفاعتى يوم القيامة',
    'لفعل الرسول صلى الله عليه وسلم',
    'أنهن أحب الكلام الى الله، ومكفرات للذنوب، وغرس الجنة، وجنة لقائلهن من النار، وأحب الى النبي عليه السلام مما طلعت عليه الشمس، والْبَاقِيَاتُ الْصَّالِحَات',
    'أفضل الذكر لا إله إلاّ الله',
    'من قال الله أكبر كتبت له عشرون حسنة وحطت عنه عشرون سيئة. الله أكبر من كل شيء',
    'خير الدنيا والآخرة',
    'قَالَ النَّبِيُّ صَلَّى اللَّهُ عَلَيْهِ وَسَلَّمَ ‏"‏لَقَدْ رَأَيْتُ اثْنَيْ عَشَرَ مَلَكًا يَبْتَدِرُونَهَا، أَيُّهُمْ يَرْفَعُهَا"',
    'قَالَ النَّبِيُّ صَلَّى اللَّهُ عَلَيْهِ وَسَلَّمَ "عَجِبْتُ لَهَا ، فُتِحَتْ لَهَا أَبْوَابُ السَّمَاءِ',
    'ي كل مره تحط عنه عشر خطايا ويرفع له عشر درجات ويصلي الله عليه عشرا وتعرض على الرسول صلى الله عليه وسلم (أى عدد)'
  ];
  List<String> tasbehReapeat=[
    '100',
    '100',
    '100',
    '100',
    '100',
    '100',
    '100',
    '100',
    '100',
    '100',
    '100',
    '100',
    '100',
    '100',
    '100',
    '100',
    '100'
  ];
  static List<int> Counters=[
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  ];
}