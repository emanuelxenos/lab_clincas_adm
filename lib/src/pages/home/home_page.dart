import 'package:fe_lab_clinicas_adm/src/pages/home/home_contorller.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:validatorless/validatorless.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with MessageViewMixin {
  final formKey = GlobalKey<FormState>();
  final deskNumberEC = TextEditingController();
  final controller = Injector.get<HomeContorller>();

  @override
  void initState() {
    super.initState();
    effect(() => {
          if (controller.informationForm != null)
            {
              Navigator.of(context).pushReplacementNamed('/pre-checkin',
                  arguments: controller.informationForm)
            }
        });
    messageListener(controller);
  }

  @override
  void dispose() {
    deskNumberEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var sizeOf = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: LabClinicasAppBar(),
      body: Center(
        child: Form(
          key: formKey,
          child: Container(
            padding: const EdgeInsets.all(40),
            width: sizeOf.width * .4,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: LabClinicasTheme.orangeColor)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Seja Bem-Vindo',
                  style: LabClinicasTheme.titleStyle,
                ),
                const SizedBox(height: 32),
                const Text(
                  'Preencha o número do guichê que você está entendendo',
                  style: LabClinicasTheme.subTitleStyle,
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: deskNumberEC,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  validator: Validatorless.multiple([
                    Validatorless.required('Guichê obrigatório'),
                    Validatorless.number('Guichê só pode ser números'),
                  ]),
                  decoration: const InputDecoration(
                    label: Text('Número do guichê'),
                  ),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  height: 48,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () async {
                        final valid = formKey.currentState?.validate() ?? false;
                        if (valid) {
                          await controller
                              .startService(int.parse(deskNumberEC.text));
                        }
                      },
                      child: const Text('Chamar Próximo Paciente')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
