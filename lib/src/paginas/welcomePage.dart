import 'package:flutter/material.dart';
import 'package:myapp/config%20/AppColors.dart';

class welcomePage extends StatefulWidget {
  const welcomePage({super.key});

  @override
  State<welcomePage> createState() => _welcomePageState();
}

class _welcomePageState extends State<welcomePage> {
  @override
  Widget build(BuildContext context) {
    var colores = Theme.of(context).extension<AppColors>();
    return Scaffold(
      body: Container(
        decoration:
            BoxDecoration(gradient: LinearGradient(colors: Colors.accents)),

        // child: Text('hello', style: TextStyle(color: colores!.c2)),
      ),
    );
  }
}
