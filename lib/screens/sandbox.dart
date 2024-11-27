import 'dart:math';

import 'package:flutter/material.dart';

class Sandbox extends StatefulWidget {
  const Sandbox({Key? key}) : super(key: key);

  @override
  State<Sandbox> createState() => _SandboxState();
}

class _SandboxState extends State<Sandbox> {
  double _margin = 0;
  double _opacity = 1;
  double _width = 200;
  Color _color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedOpacity(
        duration: Duration(seconds: 1),
        opacity: _opacity,
        child: AnimatedContainer(
          margin: EdgeInsets.all(_margin),
          duration: Duration(seconds: 1),
          width: _width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => setState(
                  () => _color = Color.fromRGBO(Random().nextInt(255), Random().nextInt(255), Random().nextInt(255), 1),
                ),
                child: Text('Color'),
              ),
              ElevatedButton(
                  onPressed: () => setState(() => _margin = Random().nextInt(50).toDouble()), child: Text('Margin')),
              ElevatedButton(
                  onPressed: () => setState(() => _width = Random().nextInt(300).toDouble()), child: Text('Width ')),
              ElevatedButton(
                  onPressed: () => setState(() => _opacity = Random().nextInt(10) / 10), child: Text('Opacity')),
            ],
          ),
          color: _color,
        ),
      ),
      floatingActionButton: AnimatedOpacity(
        duration: Duration(seconds: 1),
        opacity: _opacity,
        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              _margin += 20;
            });
          },
        ),
      ),
    );
  }
}
