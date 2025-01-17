import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:turbo/app/dependency_injection/init_config.dart';
import 'package:turbo/firebase_options.dart';

/// Global instance of [GetIt] service locator.
GetIt sl = GetIt.I;
Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initCore(sl);
  runApp(await builder());
}
