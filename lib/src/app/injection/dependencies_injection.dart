import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'dependencies_injection.config.dart';

final sl = GetIt.instance;

@InjectableInit(
  initializerName: r'$initSL', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
void configureDependencies() => $initSL(sl);
