import 'package:flutter/material.dart';

class NavigationBarService extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onDestinationSelected;

  const NavigationBarService({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required bool isSelected,
  }) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: isSelected ? 38 : 30,
            color: isSelected
                ? const Color.fromARGB(255, 128, 33, 155)
                : Colors.grey.shade400,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: isSelected ? 16 : 11,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected
                  ? const Color.fromARGB(255, 128, 33, 155)
                  : Colors.grey.shade400,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.1),
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: NavigationBarTheme(
            data: NavigationBarThemeData(
              height: 65, 
              backgroundColor: Colors.transparent,
              indicatorColor: Colors.transparent,
              surfaceTintColor: Colors.white,
            ),
            child: NavigationBar(
              selectedIndex: selectedIndex,
              onDestinationSelected: onDestinationSelected,
              labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
              destinations: [
                NavigationDestination(
                  icon: _buildNavItem(
                    icon: Icons.home,
                    label: 'Home',
                    isSelected: selectedIndex == 0,
                  ),
                  label: '',
                ),
                NavigationDestination(
                  icon: _buildNavItem(
                    icon: Icons.school,
                    label: 'Champion',
                    isSelected: selectedIndex == 1,
                  ),
                  label: '',
                ),
                NavigationDestination(
                  icon: _buildNavItem(
                    icon: Icons.person,
                    label: 'Profile',
                    isSelected: selectedIndex == 2,
                  ),
                  label: '',
                ),
                NavigationDestination(
                  icon: _buildNavItem(
                    icon: Icons.settings,
                    label: 'Setting',
                    isSelected: selectedIndex == 3,
                  ),
                  label: '',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
