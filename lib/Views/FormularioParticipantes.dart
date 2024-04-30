import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/Custom_Widgets/AppColors.dart';

import 'package:pretty_animated_buttons/configs/pkg_sizes.dart';
import 'package:pretty_animated_buttons/pretty_animated_buttons.dart';

class FormularioParticipantes extends StatelessWidget {
  const FormularioParticipantes({super.key});

  @override
  Widget build(BuildContext context) {
    final colores = Theme.of(context).extension<AppColors>();
    return Scaffold(
      body: SafeArea(
        child: Container(
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
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Container(
                    width: 140,
                    height: 40,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/CITEtex-Cusco.png'),
                            fit: BoxFit.cover)),
                  ),
                ]),
              ),
              SizedBox(height: 50),
              Text(
                'Ingreso de Datos del Participante',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 28,
                    fontWeight: FontWeight.w400,
                    color: colores!.c1),
              ),
              // Cuerpo de los form fields
              Container(),

              SizedBox(height: 50),
              PrettyBorderButton(
                label: '  Registrar Participacion   ',
                onPressed: () => context.push('/ListadoParticipantes'),
                labelStyle: const TextStyle(fontSize: 20),
                bgColor: Color(0xffC4ACCD),
                borderColor: Color(0xff6C3082),
                borderWidth: s4,
              )
            ],
          ),
        ),
      ),
    );
  }
}
