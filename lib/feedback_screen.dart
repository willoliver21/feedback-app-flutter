import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  // Chave para identificar e validar nosso formulário
  final _formKey = GlobalKey<FormState>();

  // Controladores para pegar os textos dos campos
  final _nomeController = TextEditingController();
  final _qualidadeController = TextEditingController();
  final _pontualidadeController = TextEditingController();
  final _comentarioController = TextEditingController();

  String _statusMessage = '';
  bool _isLoading = false;

  // Função para enviar os dados, similar à sua "enviarFeedback()" em JS
  Future<void> _enviarFeedback() async {
    // Valida se todos os campos obrigatórios foram preenchidos corretamente
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
      _statusMessage = 'Enviando...';
    });

    try {
      // Os nomes das colunas (nome_profissional, nota_qualidade, etc.)
      // devem ser os mesmos da sua tabela "feedbacks" no Supabase
      await Supabase.instance.client.from('feedbacks').insert({
        'nome_profissional': _nomeController.text.trim(),
        'nota_qualidade': int.parse(_qualidadeController.text),
        'nota_pontualidade': int.parse(_pontualidadeController.text),
        'comentario': _comentarioController.text.trim(),
      });

      setState(() {
        _statusMessage = '✅ Feedback enviado com sucesso!';
        _formKey.currentState!.reset(); // Limpa o formulário
        _nomeController.clear();
        _qualidadeController.clear();
        _pontualidadeController.clear();
        _comentarioController.clear();
      });

      // Limpa a mensagem de status após 3 segundos
      Future.delayed(const Duration(seconds: 3), () {
        if (mounted) {
          setState(() => _statusMessage = '');
        }
      });

    } catch (error) {
      setState(() {
        _statusMessage = 'Erro ao enviar feedback: $error';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    // Limpa os controladores quando a tela for descartada
    _nomeController.dispose();
    _qualidadeController.dispose();
    _pontualidadeController.dispose();
    _comentarioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: Card(
            elevation: 4,
            margin: const EdgeInsets.all(16.0),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Feedback do Serviço', // Equivalente ao <h2> do seu HTML
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),

                    // Campo Nome do Profissional
                    TextFormField(
                      controller: _nomeController,
                      decoration: const InputDecoration(
                        labelText: 'Nome do profissional avaliado',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Por favor, digite o nome.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // Campo Nota da Qualidade
                    TextFormField(
                      controller: _qualidadeController,
                      decoration: const InputDecoration(
                        labelText: 'Qualidade do serviço (1 a 5)',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Digite uma nota.';
                        }
                        final n = int.tryParse(value);
                        if (n == null || n < 1 || n > 5) {
                          return 'A nota deve ser entre 1 e 5.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // Campo Nota da Pontualidade
                    TextFormField(
                      controller: _pontualidadeController,
                      decoration: const InputDecoration(
                        labelText: 'Pontualidade (1 a 5)',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                         if (value == null || value.isEmpty) {
                          return 'Digite uma nota.';
                        }
                        final n = int.tryParse(value);
                        if (n == null || n < 1 || n > 5) {
                          return 'A nota deve ser entre 1 e 5.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // Campo Comentário
                    TextFormField(
                      controller: _comentarioController,
                      decoration: const InputDecoration(
                        labelText: 'Comentário (opcional)',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 3,
                    ),
                    const SizedBox(height: 24),

                    // Botão de Enviar
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                      // O botão fica desabilitado enquanto estiver carregando (_isLoading)
                      onPressed: _isLoading ? null : _enviarFeedback,
                      child: _isLoading
                          ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 3,
                              ),
                            )
                          : const Text('Enviar Feedback'),
                    ),
                    const SizedBox(height: 16),

                    // Mensagem de Status
                    if (_statusMessage.isNotEmpty)
                      Text(
                        _statusMessage,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: _statusMessage.contains('Erro')
                              ? Colors.red
                              : Colors.green,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}