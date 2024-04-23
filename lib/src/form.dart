import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class formulario1 extends StatefulWidget {
  const formulario1({super.key});

  @override
  State<formulario1> createState() => _formulario1State();
}

class _formulario1State extends State<formulario1> {
  //controladores
  final nombrevariable = TextEditingController();

  //variables que guardan los valores
  String nom = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('agregando'),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            child: TextField(
              controller: nombrevariable,
              decoration: InputDecoration(hintText: 'nombre'),
            ),
          ),
          FilledButton(
              onPressed: () async {
                //toma el valor del controlador y lo usa en la variable
                nom = nombrevariable.text;
                print(nom);

                await Supabase.instance.client
                    .from('Participantes')
                    .insert({'nombre': nom});

                // limpiar textfield
                nombrevariable.text = '';

                Navigator.of(context).pop();
              },
              child: Text('pa la db'))
        ],
      ),
    );
  }
}
