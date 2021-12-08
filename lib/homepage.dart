import 'package:flutter/material.dart';
import 'package:flutter_mobile_vision/flutter_mobile_vision.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isInit = false;
  @override
  void initState() {
    FlutterMobileVision.start().then((value){
      setState(() {
        isInit = true;
      });
    
    });
    
    super.initState();
  }
  // Variables for custumzation of scanner
  int _cameraOcr = FlutterMobileVision.CAMERA_BACK;
  bool _autoFocusOcr = true;
  bool _torchOcr = false;
  bool _multipleOcr = false;
  bool _waitTapOcr = false;
  bool _showTextOcr = true;
  late Size _previewOcr;
  List t=[];
  List<OcrText> _textsOcr = [];
 
  startScan()async{
    print("HELLO WORKD");
    List<OcrText> lst = [];
    String result = "";
    try{
      lst = await FlutterMobileVision.read(
        waitTap: true,
        fps: 5,
        multiple: true,
        
        

      );
      for(OcrText text in lst){
        result += text.value;
      }
      
      // for(OcrText text in lst){
      //   lst.add(text);
      //   print(lst);
        
      // }

    }catch(e){
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){startScan();},child: Text("Start"),),
      appBar: AppBar(
        title: Text('Text Recognation'),
      ),
      body: Column(
        children:[
          

        ]
      ),
      
    );
  }
}