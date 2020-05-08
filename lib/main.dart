import 'package:flutter/material.dart';

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

  String _result = 'HEAD';

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
                child: Image(image: AssetImage('assets/images/head.png'),),
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
                    setState(() {
                      //TODO: Ramdon
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
