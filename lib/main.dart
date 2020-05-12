import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:async';

void main() => runApp(MaterialApp(
  home: Home(),
  theme: ThemeData(
    primarySwatch: Colors.amber,
  ),
  debugShowCheckedModeBanner: false,
));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  double _ratio = 0.0;
  String _result = '-';
  bool _isHead = true;
  String _imagePath = 'assets/images/head.png';
  int _counter = 4;
  Timer _everySecond;
  int _spinCounter = 0, _spinIndex = 0;


  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width - 20;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('BM2', style: TextStyle(color: Colors.grey)),
            Text('Head or Tails', style: TextStyle(fontSize: 22, color: Colors.grey)),
            SizedBox(height: 20,),
            Center(
              child: SizedBox(
                width: width,
                height: width,
                child: Transform(  // Transform widget
                    transform: Matrix4.rotationY(_ratio),
                    alignment: FractionalOffset.center,
                    child: Image(image: AssetImage(_imagePath),)
                ),
              ),
            ),
            SizedBox(height: 20,),
            Text(_result, style: TextStyle(color: Colors.grey,fontSize: 30)),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                FloatingActionButton.extended(
                  label: Text('Play', style: TextStyle(color: Colors.white),),
                  icon: Icon(Icons.play_arrow, color: Colors.white),
                  onPressed: (){
                    //Generate Ramdom between 0 and 1
                    var random = math.Random();
                    setState(() {
                      _spinIndex = random.nextInt(2);
                    });
                    // Spin coin and Show Result
                    _everySecond = Timer.periodic(Duration(milliseconds: 150), (Timer t) {
                      setState(() {
                        _ratio += math.pi / 8;
                        _counter++;
                        if(_counter == 8){
                          _counter = 0;
                          _imagePath = _isHead ? 'assets/images/tails.png' : 'assets/images/head.png';
                          _isHead = !_isHead;
                        }

                        _spinCounter++;
                        if(_spinCounter == [16,24][_spinIndex]){
                          _spinCounter = 0;
                          _everySecond.cancel();
                          _result = _spinIndex == 0 ? 'HEAD' : 'TAILS';
                        }
                      });
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
}
