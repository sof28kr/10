import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myapp/config%20/AppColors.dart';
import 'package:pretty_animated_buttons/pretty_animated_buttons.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    final colores = Theme.of(context).extension<AppColors>();
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color(0xffC4ACCD),
            Color(0xffF0EAF3),
          ],
        )),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 200),
              child: Container(
                width: 300,
                height: 50,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/CITEtex-Cusco.png'),
                        fit: BoxFit.cover)),
              ),
            ),
            SizedBox(height: 50),
            Text(
              'Aplicativo de Registro de Asistencia',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 40,
                  fontWeight: FontWeight.w400,
                  color: colores?.c1),
            ),
            ElevatedButton(onPressed: () {}, child: Text('Registro')),
            SizedBox(height: 50),
            PrettySlideUnderlineButton(
              label: 'gfyyyyy',
              onPressed: () {},
              secondSlideColor: colores!.c1,
            ),
            PrettyCapsuleButton(
              label: 'label',
              onPressed: () {},
              labelStyle: const TextStyle(fontSize: 25),
              bgColor: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
