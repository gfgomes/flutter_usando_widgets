import 'package:flutter/material.dart';
import 'package:my_first_app/components/difficulty.dart';
import 'package:my_first_app/data/task_inherited.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key, required this.taskContext});

  final BuildContext taskContext;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController _nomeTarefaController = TextEditingController();
  TextEditingController _dificuldadeTarefaController = TextEditingController();
  TextEditingController _imagemTarefaController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool valueIsValid(String? value) {
    if (value != null && value.isEmpty) {
      return false;
    }
    return true;
  }

  bool difficultyIsValid(String? value) {
    if (value != null && int.tryParse(value) == null) {
      return false;
    }
    if (int.parse(value!) > 5 || int.parse(value!) < 1) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Nova tarefa'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 3, color: Colors.black)),
              height: 875,
              width: 430,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _nomeTarefaController,
                      textAlign: TextAlign.center,
                      validator: (value) => valueIsValid(value)
                          ? null
                          : 'Insira o nome da tarefa.',
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Nome da terefa',
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _dificuldadeTarefaController,
                      validator: (value) => difficultyIsValid(value)
                          ? null
                          : 'Insira um valor entre 1 e 5.',
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Dificuldade da terefa',
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _imagemTarefaController,
                      validator: (value) => valueIsValid(value)
                          ? null
                          : 'Insira a URL da imagem.',
                      keyboardType: TextInputType.url,
                      onChanged: (text) => setState(() {}),
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Imagem da terefa',
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 72,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 2, color: Colors.blue),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        _imagemTarefaController.text,
                        errorBuilder: (BuildContext context, Object error,
                            StackTrace? stackTrace) {
                          return Image.asset('assets/images/no_image.jpg');
                        },
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // print(_nomeTarefaController.text);
                        // print(int.parse(_dificuldadeTarefaController.text));
                        // print(_imagemTarefaController.text);

                        TaskInherited.of(widget.taskContext)!.newTask(
                            _nomeTarefaController.text,
                            _imagemTarefaController.text,
                            int.parse(_dificuldadeTarefaController.text));

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Tarefa criada com sucesso!'),
                          ),
                        );
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Adicionar'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
