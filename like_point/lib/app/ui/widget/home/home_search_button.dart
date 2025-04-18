import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_point/app/ui/modules/summoner/summoner_page.dart';
import 'home_search_controller.dart';

class HomeSearchButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const HomeSearchButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeSearchController>();

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 57),
        child: ElevatedButton(
          onPressed: () {
            FocusScope.of(context).unfocus();
            final name = controller.searchController.text.trim();

            // ✅ ตรวจสอบรูปแบบ Riot ID ก่อน
            if (!name.contains('#') || name.split('#').length != 2) {
              Get.snackbar(
                'รูปแบบผิด',
                'กรุณาใส่ Riot ID เช่น ZolikeLP#TH1',
                snackPosition: SnackPosition.TOP,
                backgroundColor: Colors.redAccent,
                colorText: Colors.white,
              );
              return;
            }

            // ✅ ถ้าถูกต้อง → ไปหน้า Summoner
            Get.to(() => SummonerPage(riotId: name));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(52, 152, 219, 1),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            side: const BorderSide(color: Colors.white, width: 1.5),
            elevation: 1,
          ),
          child: const Text(
            'ค้นหา',
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.w800),
          ),
        ),
      ),
    );
  }
}
