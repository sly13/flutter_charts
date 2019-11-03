import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

void main() => runApp( MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Flutter Demo',
      theme:  ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() =>  _MyHomePageState();
}

class ClicksPerYear {
  final String year;
  final int clicks;
  final charts.Color color;

  ClicksPerYear(this.year, this.clicks, Color color)
      : this.color =  charts.Color(
            r: color.red, g: color.green, b: color.blue, a: color.alpha);
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var data = [
       ClicksPerYear('2017', 42, Colors.red),
       ClicksPerYear('2018', 42, Colors.yellow),
       ClicksPerYear('2019', _counter, Colors.green),
    ];

    var series = [
       charts.Series(
        domainFn: (ClicksPerYear clickData, _) => clickData.year,
        measureFn: (ClicksPerYear clickData, _) => clickData.clicks,
        colorFn: (ClicksPerYear clickData, _) => clickData.color,
        id: 'Clicks',
        data: data,
      ),
    ];

    var chart =  charts.BarChart(
      series,
      animate: true,
    );
    var chartWidget =  Padding(
      padding:  EdgeInsets.all(32.0),
      child:  SizedBox(
        height: 200.0,
        child: chart,
      ),
    );

    return Scaffold(
      appBar:  AppBar(
        title:  Text(widget.title),
      ),
      body:  Center(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Text(
              'You have pushed the button this many times:',
            ),
             Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            chartWidget,
          ],
        ),
      ),
      floatingActionButton:  FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child:  Icon(Icons.add),
      ),
    );
  }
}
