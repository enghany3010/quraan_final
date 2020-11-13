import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:quraan/main.dart';
import 'package:audioplayers/audioplayers.dart';



class HomePage_Tape extends StatefulWidget{
  final int readerId;
  HomePage_Tape(this.readerId);
  @override
  _HomePage_Tape createState()=>_HomePage_Tape(readerId);
}

class _HomePage_Tape extends State<HomePage_Tape>{
  final int readid;
  AudioPlayer audioPlayer = AudioPlayer();
  int currentplay = -1;
  _HomePage_Tape(this.readid);

  RoundedRectangleBorder _roundedButton(){
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
    );
  }
  BoxDecoration _mainBackground(){
    return BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/listen.png')
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

  String GetData1(int id){
    if(readid == 1){
     return AudiosLinkMashary[id];
    }else if(readid == 2){
     return AudiosLinkSudias[id];
    }else{
      return AudiosLinkGhamdy[id];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(30, 30, 30, 1),
        body:Container(
          decoration: _mainBackground(),
          child: ListView.builder(
              itemCount: 114,
              itemBuilder: (BuildContext context,int index){

                return ListTile(
                   leading: Container(
                     width: 60,height: 60,
                     child: currentplay==index?CircleAvatar(backgroundImage: AssetImage(GetData1(114)),)
                         :Image.asset(GetData1(114),)
                     ,
                   ),
                  //-------------play button----------------//
                  trailing: FlatButton(
                      onPressed: ()async{
                       setState(() {
                           if(currentplay == index){
                             audioPlayer.pause();
                             currentplay=-1;
                           }else {
                             audioPlayer.play(GetData1(index));
                             currentplay = index;
                           }
                       });
                   },
                    child: currentplay == index? Icon(Icons.pause,color: Colors.amber[900],size: 40,)
                          : Icon(Icons.play_circle_outline,color: Colors.white38,size: 40,)
                  ),
                  title:Container(
                    child:Column(
                      children: [
                        currentplay==index?
                                 Text(SouraName[index], style: TextStyle(color: Colors.amber[900],fontWeight: FontWeight.bold,fontSize: 23), textAlign: TextAlign.center,
                                 )
                                 : Text(SouraName[index], style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 23), textAlign: TextAlign.center,
                                ),
                        Divider(height: 20,)
                              ],
                     ),
                  )
                );
              }
          ),
        )
    );
  }
//        مكة المدينة
}


final List<String> SouraName=[
  'الفاتحة مكة','البقرة المدينة','آل عمران المدينة', 'النساء المدينة','المائدة المدينة','الأنعام مكة',
  'الأعراف مكة','الأنفال المدينة','التوبة المدينة', 'يونس  مكة','هود مكة','يوسف مكة',
  'الرعد المدينة','إبراهيم مكة','الحجر مكة', 'النحل مكة','الإسراء مكة','الكهف مكة',
  'مريم مكة','طه مكة','الأنبياء مكة', 'الحج المدينة','المؤمنون مكة','النور المدينة',
  'الفرقان مكة','الشعراء مكة','النمل مكة', 'القصص مكة','العنكبوت مكة','الروم مكة',
  'لقمان مكة','السجدة مكة','الأحزاب المدينة', 'سبأ','فاطر','يس',
  'الصافات مكة','ص مكة','الزمر مكة', 'غافر مكة','فصلت مكة','الشورى مكة',
  'الزخرف مكة','الدخان مكة','الجاثية مكة', 'الأحقاف مكة','محمد المدينة','الفتح المدينة',
  'الحجرات المدينة','ق مكة','الذاريات مكة', 'الطور مكة','النجم مكة','القمر مكة',
  'الرحمن المدينة','الواقعة مكة','الحديد المدينة', 'المجادلة المدينة','الحشر المدينة','الممتحنة المدينة',
  'الصف المدينة','الجمعة المدينة','المنافقون المدينة','التغابن المدينة','الطلاق المدينة','التحريم المدينة',
  'الملك مكة','القلم مكة','الحاقة مكة','المعارج مكة','نوح مكة','الجن مكة',
  'المزمل مكة','المدثر مكة','القيامة مكة','الإنسان المدينة','المرسلات مكة','النبأ مكة',
  'النازعات مكة','عبس مكة','التكوير مكة','الإنفطار مكة','المطففين مكة','الإنشقاق مكة',
  'البروج مكة','الطارق مكة','الأعلى مكة','الغاشية مكة','الفجر مكة','البلد مكة',
  'الشمس مكة','الليل مكة','الضحى مكة','الشرح مكة','التين مكة','العلق مكة',
  'القدر مكة','البينة المدينة','الزلزلة المدينة','العاديات مكة','القارعة مكة','التكاثر مكة',
  'العصر مكة','الهمزة مكة','الفيل مكة','قريش مكة','الماعون مكة','الكوثر مكة',
  'الكافرون مكة','النصر المدينة','المسد مكة','الإخلاص مكة','الفلق مكة','الناس مكة' ];
final List<double> SouraTotalTime=[
  33.0,8562.0,5008.0,5273.0,3724.0,3661.0,4644.0,3760.0,2785.0,3062.0,2992.0,
  1296.0,1373.0,1013.0,2411.0,2269.0,1959.0,1480.0,913.0,1646.0,1951.0,1606.0,
  1878.0,1227.0,1972.0,1630.0,1947.0,1420.0,1450.0,896.0,671.0,2076.0,1309.0,
  1118.0,1153.0,1505.0,1193.0,1899.0,1713.0,1301.0,1385.0,1382.0,589.0,747.0,
  952.0,765.0,781.0,543.0,530.0,620.0,538.0,533.0,580.0,723.0,746.0,903.0,581.0,
  572.0,445.0,270,220.0,233.0,302.0,366.0,378.0,419.0,407.0,370.0,308.0,278.0,
  356.0,251.0,207.0,320.0,277.0,283.0,213.0,184.0,130.0,105.0,244.0,138.0,137.0,
  81.0,85.0,110.0,172.0,95.0,91.0,73.0,55.0,35.0,51.0,85.0,43.0,110,53.0,58.0,
  52.0,45.0,24.0,46.0,39.0,33.0,43.0,21.0,182.0,35.0,41.0,22.0,35.0,55.0
];
//----------------------links data of api sound------------------------//
final List<String> AudiosLinkMashary = [
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/001.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/002.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/003.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/004.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/005.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/006.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/007.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/008.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/009.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/010.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/011.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/012.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/013.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/014.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/015.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/016.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/017.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/018.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/019.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/020.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/021.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/022.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/023.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/024.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/025.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/026.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/027.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/028.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/029.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/030.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/031.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/032.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/033.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/034.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/035.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/036.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/037.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/038.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/039.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/040.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/041.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/042.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/043.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/044.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/045.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/046.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/047.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/048.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/049.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/050.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/051.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/052.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/053.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/054.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/055.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/056.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/057.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/058.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/059.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/060.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/061.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/062.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/063.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/064.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/065.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/066.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/067.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/068.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/069.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/070.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/071.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/072.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/073.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/074.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/075.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/076.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/077.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/078.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/079.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/080.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/081.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/082.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/083.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/084.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/085.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/086.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/087.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/088.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/089.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/090.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/091.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/092.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/093.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/094.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/095.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/096.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/097.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/098.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/099.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/100.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/101.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/102.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/103.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/104.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/105.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/106.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/107.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/108.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/109.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/110.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/111.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/112.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/113.mp3',
  'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/114.mp3',
  'assets/mashary.jpg'
];
List<String> AudiosLinkSudias = [
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/001.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/002.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/003.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/004.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/005.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/006.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/007.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/008.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/009.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/010.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/011.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/012.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/013.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/014.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/015.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/016.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/017.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/018.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/019.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/020.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/021.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/022.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/023.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/024.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/025.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/026.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/027.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/028.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/029.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/030.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/031.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/032.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/033.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/034.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/035.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/036.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/037.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/038.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/039.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/040.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/041.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/042.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/043.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/044.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/045.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/046.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/047.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/048.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/049.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/050.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/051.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/052.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/053.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/054.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/055.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/056.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/057.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/058.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/059.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/060.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/061.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/062.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/063.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/064.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/065.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/066.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/067.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/068.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/069.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/070.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/071.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/072.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/073.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/074.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/075.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/076.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/077.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/078.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/079.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/080.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/081.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/082.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/083.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/084.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/085.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/086.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/087.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/088.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/089.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/090.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/091.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/092.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/093.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/094.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/095.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/096.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/097.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/098.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/099.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/100.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/101.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/102.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/103.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/104.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/105.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/106.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/107.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/108.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/109.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/110.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/111.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/112.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/113.mp3',
  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/114.mp3',
  'assets/sudais.jpg'
];
List<String> AudiosLinkGhamdy = [
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/001.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/002.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/003.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/004.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/005.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/006.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/007.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/008.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/009.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/010.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/011.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/012.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/013.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/014.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/015.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/016.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/017.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/018.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/019.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/020.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/021.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/022.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/023.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/024.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/025.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/026.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/027.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/028.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/029.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/030.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/031.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/032.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/033.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/034.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/035.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/036.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/037.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/038.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/039.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/040.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/041.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/042.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/043.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/044.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/045.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/046.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/047.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/048.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/049.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/050.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/051.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/052.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/053.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/054.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/055.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/056.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/057.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/058.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/059.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/060.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/061.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/062.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/063.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/064.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/065.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/066.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/067.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/068.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/069.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/070.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/071.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/072.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/073.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/074.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/075.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/076.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/077.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/078.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/079.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/080.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/081.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/082.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/083.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/084.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/085.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/086.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/087.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/088.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/089.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/090.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/091.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/092.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/093.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/094.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/095.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/096.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/097.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/098.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/099.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/100.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/101.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/102.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/103.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/104.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/105.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/106.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/107.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/108.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/109.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/110.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/111.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/112.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/113.mp3',
  'https://download.quranicaudio.com/quran/sa3d_al-ghaamidi/complete/114.mp3',
  'assets/Ghamdy.png'
];