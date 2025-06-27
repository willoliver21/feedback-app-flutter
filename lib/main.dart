import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'feedback_screen.dart'; // Vamos criar este arquivo no próximo passo

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Configure o Supabase com suas credenciais
  // As credenciais estão no seu arquivo index.html
  await Supabase.initialize(
    url: 'https://koephgpqguzxqchxsrlp.supabase.co', // SUA URL DO SUPABASE AQUI
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImtvZXBoZ3BxZ3V6eHFjaHhzcmxwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTAwODUwNDksImV4cCI6MjA2NTY2MTA0OX0.LiSgIqsCNafhUXd5RqU42LHcf_fhXznOb13y-aP-clk', // SUA ANON KEY AQUI
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Feedback de Serviços',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const FeedbackScreen(), // Tela principal do app
    );
  }
}