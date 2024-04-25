import 'package:flutter/material.dart';
import 'package:myapp/config%20/AppColors.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(decoration: BoxDecoration( 
        gradient: LinearGradient(colors: [
          Color(0xffC4ACCD),
          Color(0xffF0EAF3),
        ],
       	)
      ),)
    );
  }
}




