import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/Dependency%20Injection/injection.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(asExtension: false)
Future<void> configureInjection() async {
  await init(getIt, environment: Environment.prod);
}
