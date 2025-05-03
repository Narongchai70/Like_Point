import 'package:get/get.dart';
import 'package:like_point/app/ui/modules/champion/champion_page.dart';
import 'package:like_point/app/ui/modules/home/home_page.dart';
import 'package:like_point/app/ui/modules/settings/settings_page.dart';

class NavController extends GetxController {
  var selectedIndex = 0.obs;

  final pages = [() => HomePage(), () => ChampionPage(), () => SettingsPage()];
}
