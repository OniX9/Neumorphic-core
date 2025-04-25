import 'package:flutter/material.dart';
import 'package:neumorphic_core/neumorphic.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        body: const NeomorphicPage(),
      ),
    );
  }
}

class NeomorphicPage extends StatefulWidget {
  const NeomorphicPage({Key? key}) : super(key: key);

  @override
  State<NeomorphicPage> createState() => _NeomorphicPageState();
}

class _NeomorphicPageState extends State<NeomorphicPage> {
  double opacity = 0.5;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,

        children: [
          NeuContainer(
            softness: 2,
            width: 150,
            height: 150,
            colorCode: const Color(0xFFEEEEEE),
            opacity: opacity,
            child: const Center(
              child:  Text('Hello Onix',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey,
                  ),
              ),
            ),
          ),
          Slider(
            value: opacity,
            activeColor: Colors.grey[400],
            inactiveColor: Colors.white,
            thumbColor: Colors.grey,
            secondaryActiveColor: Colors.cyan,
            min: 0.0,
            max: 1.0,
            label: 'opacity',
            onChanged: (double newValue){
              setState(() {
                  opacity = newValue;
                });
              },
          ),
        ],
      ),
    );
  }
}


