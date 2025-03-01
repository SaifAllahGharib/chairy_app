import 'package:chairy_app/core/utils/internet_connectivity.dart';
import 'package:chairy_app/core/utils/my_shared_preferences.dart';
import 'package:chairy_app/core/utils/service_locator.dart';

Future<void> connectionState() async {
  if (await getIt.get<InternetConnectivity>().isConnected) {
    await getIt.get<MySharedPreferences>().storeBool("con", true);
    return;
  }

  getIt.get<MySharedPreferences>().storeBool("con", false);
}
