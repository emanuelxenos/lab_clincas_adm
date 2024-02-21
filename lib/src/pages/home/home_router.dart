import 'package:fe_lab_clinicas_adm/src/pages/home/home_contorller.dart';
import 'package:fe_lab_clinicas_adm/src/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class HomeRouter extends FlutterGetItPageRouter {
  const HomeRouter({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<HomeContorller>((i) => HomeContorller(
            attendantDeskRepository: i(), callNextPatientService: i())),
      ];

  @override
  String get routeName => '/home';

  @override
  WidgetBuilder get view => (_) => const HomePage();
}
