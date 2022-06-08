import 'package:flutter/material.dart';
import 'package:job_timer/app/modules/project/controller/project_register_controller.dart';
import 'package:validatorless/validatorless.dart';

class ProjectRegisterPage extends StatefulWidget {
  final ProjectRegisterController controller;

  const ProjectRegisterPage({super.key, required this.controller});
  // const ProjectRegisterPage({super.key});

  @override
  State<ProjectRegisterPage> createState() => _ProjectRegisterPageState();
}

class _ProjectRegisterPageState extends State<ProjectRegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _estimateEC = TextEditingController();

  @override
  void dispose() {
    _nameEC.dispose();
    _estimateEC.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Criar novo projeto',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              TextFormField(
                controller: _nameEC,
                decoration: const InputDecoration(
                  label: Text('Nome do projeto'),
                ),
                validator: Validatorless.required('Nome obrigatório'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _estimateEC,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  label: Text('Estimativa de horas'),
                ),
                validator: Validatorless.multiple([
                  Validatorless.required('Estimativa obrigatória'),
                  Validatorless.number('Permitido somente números'),
                ]),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 49,
                child: ElevatedButton(
                  onPressed: () async {
                    final formValid =
                        _formKey.currentState?.validate() ?? false;
                    if (formValid) {
                      // final name = _nameEC.text;
                      // final estimate = int.parse(_estimateEC.text);

                      // await widget.controller.register(name, estimate);
                    }
                  },
                  child: const Text('Salvar'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}