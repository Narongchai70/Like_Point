import 'package:get/get.dart';

class HomeDropdownController extends GetxController {
  final RxList<String> serverList = ['SEA', 'NA', 'EU'].obs;
  final RxnString selectedItem = RxnString(); 

  void selectItem(String? value) {
    selectedItem.value = value;
  }
}
