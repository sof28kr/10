import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://oicgtegeayqbqvzoousx.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9pY2d0ZWdlYXlxYnF2em9vdXN4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTM4MTUyNTYsImV4cCI6MjAyOTM5MTI1Nn0.fyhjKUZqSBNuVWZNg5aXQUtH07I6iG-PWQKQrEiphPM',
  );

  runApp(MyApp());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //indica el flujo de nuevos participantes
  final _participantesStream =
      //el nombre que va ahi es el nombre de la tabla
      Supabase.instance.client.from('Participantes').stream(primaryKey: ['id']);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('mi tabla'),
      ),
      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: _participantesStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final Participantes = snapshot.data!;
          return ListView.builder(
              itemCount: Participantes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(Participantes[index]['nombre']),
                );
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: ((context) {
                  return SimpleDialog(
                    title: const Text('agregar'),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    children: [
                      TextFormField(
                        onFieldSubmitted: (value) async {
                          await Supabase.instance.client
                              .from('Participantes')
                              .insert({'nombre': value});
                          //el nombre que va antes de value es por el nombre de la columna a la que se inserta
                        },
                      )
                    ],
                  );
                }));
          },
          child: const Icon(Icons.add)),
    );
  }
}
