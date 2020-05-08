import 'package:flutter/material.dart';
import 'dart:math' as math;

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

class _HomeState extends State<Home> with TickerProviderStateMixin {

  AnimationController controller;
  double _ratio = 0.0;
  String _result = '-';
  bool _isHead = true;
  String _imagePath = 'assets/images/head.png';
  int _counter = 4;


  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width - 20;

    return Scaffold(
      body: AnimatedBuilder(
          animation: controller,
          builder: (context, child){
            return Container(
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
                          if(!controller.isAnimating){
                            controller.forward(from: controller.value == 1.0 ? 0.0 : controller.value);
                            setState(() {
                              _ratio += math.pi / 8;
                              _counter++;
                              if(_counter == 8){
                                _counter = 0;
                                _imagePath = _isHead ? 'assets/images/tails.png' : 'assets/images/head.png';
                                _isHead = !_isHead;
                              }
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
      ),
    );
  }
}
