import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isWorkingExample = true;

  void _incrementCounter() {
    setState(() {
      _isWorkingExample = !_isWorkingExample;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_isWorkingExample)
              ManagementList(
                items: ['Working example'],
                someBuilder: (value) => Text(value),
              ),
            if (!_isWorkingExample)
              ManagementListNotWorking<String>(
                items: ['Not working example'],
                someBuilder: (value) => Text(value),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Change example',
        child: Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class ManagementListNotWorking<T> extends StatefulWidget {
  final Widget Function(T item) someBuilder;
  final List<T> items;

  ManagementListNotWorking({
    @required this.items,
    @required this.someBuilder,
  });

  @override
  State<StatefulWidget> createState() => _ManagementListNotWorkingState();
}

class _ManagementListNotWorkingState extends State<ManagementListNotWorking> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          return widget.someBuilder(widget.items.first);
        },
      ),
    );
  }
}

class ManagementList<T> extends StatefulWidget {
  final Widget Function(T item) someBuilder;
  final List<T> items;

  ManagementList({
    @required this.items,
    @required this.someBuilder,
  });

  @override
  State<StatefulWidget> createState() => _ManagementListState<T>();
}

class _ManagementListState<T> extends State<ManagementList<T>> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          return widget.someBuilder(widget.items.first);
        },
      ),
    );
  }
}
