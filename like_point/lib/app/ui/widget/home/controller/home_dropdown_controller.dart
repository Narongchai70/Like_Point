import 'package:get/get.dart';

class HomeDropdownController extends GetxController {
  final RxList<String> serverList = [
    'br1', 'eun1', 'euw1', 'jp1', 'kr',
    'la1', 'la2', 'me1', 'na1', 'oc1',
    'ru', 'sg2', 'tr1', 'tw2', 'vn2',
  ].obs;

  final RxnString selectedItem = RxnString(); 

  final Map<String, String> regionPlatformMap = {
    'br1': 'americas',
    'eun1': 'europe',
    'euw1': 'europe',
    'jp1': 'asia',
    'kr': 'asia',
    'la1': 'americas',
    'la2': 'americas',
    'me1': 'europe',
    'na1': 'americas',
    'oc1': 'sea',
    'ru': 'europe',
    'sg2': 'asia',
    'tr1': 'europe',
    'tw2': 'asia',
    'vn2': 'asia',
  };

  final Map<String, String> regionalRoutingMap = {
    'br1': 'americas',
    'eun1': 'europe',
    'euw1': 'europe',
    'jp1': 'asia',
    'kr': 'asia',
    'la1': 'americas',
    'la2': 'americas',
    'me1': 'europe',
    'na1': 'americas',
    'oc1': 'sea',
    'ru': 'europe',
    'sg2': 'sea', 
    'tr1': 'europe',
    'tw2': 'asia',
    'vn2': 'asia',
  };

  void selectItem(String? value) {
    if (value != null && serverList.contains(value)) {
      selectedItem.value = value;
    }
  }

  String? get routing => selectedItem.value;

  String get platform => regionPlatformMap[selectedItem.value ?? ''] ?? 'sea';
  String get regionalRouting => regionalRoutingMap[selectedItem.value ?? ''] ?? 'sea';
}
