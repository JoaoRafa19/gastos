import 'package:flutter/material.dart';
import 'package:gastos/pages/core/core.page.dart';
import 'package:gastos/shared/enviromentvariables.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: ENVIROMENT.prod.SUPABASE_URL,
    anonKey: ENVIROMENT.prod.ANONKEY,
  );

  runApp( CoreWidget());
}
