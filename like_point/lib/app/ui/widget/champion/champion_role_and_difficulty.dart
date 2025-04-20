import 'package:flutter/material.dart';

class ChampionRoleAndDifficulty extends StatelessWidget {
  final String role;
  final int difficulty;

  const ChampionRoleAndDifficulty({
    super.key,
    required this.role,
    required this.difficulty,
  });

  String _getDifficultyLabel(int difficulty) {
    if (difficulty <= 3) return 'Easy';
    if (difficulty <= 6) return 'Medium';
    return 'Hard';
  }

  Widget _buildDifficultyStars(double starSize) {
    int filledStars;
    if (difficulty <= 3) {
      filledStars = 1;
    } else if (difficulty <= 6) {
      filledStars = 2;
    } else {
      filledStars = 3;
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(3, (index) {
        return Icon(
          Icons.star,
          size: starSize,
          color: index < filledStars ? Colors.amber : Colors.white,
        );
      }),
    );
  }

  String _getRoleIconAsset(String role) {
    switch (role.toLowerCase()) {
      case 'assassin':
        return 'assets/role/icon_assasin.png';
      case 'fighter':
        return 'assets/role/icon_fighter.png';
      case 'mage':
        return 'assets/role/icon_mage.png';
      case 'marksman':
        return 'assets/role/icon_marksman.png';
      case 'support':
        return 'assets/role/icon_support.png';
      case 'tank':
        return 'assets/role/icon_tank.png';
      default:
        return 'assets/role/icon_fighter.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final roleIconSize = screenWidth * 0.18; 
    final starSize = screenWidth * 0.06; 
    final spacingSmall = screenHeight * 0.008; 
    final fontSizeLabel = screenWidth * 0.035; 

    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.015),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Image.asset(
                _getRoleIconAsset(role),
                width: roleIconSize,
                height: roleIconSize,
              ),
              SizedBox(height: spacingSmall),
              Text(
                'Role',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: fontSizeLabel,
                ),
              ),
              Text(
                role,
                style: TextStyle(color: Colors.white, fontSize: fontSizeLabel),
              ),
            ],
          ),

          SizedBox(height: screenHeight * 0.005),

          Column(
            children: [
              _buildDifficultyStars(starSize),
              SizedBox(height: spacingSmall),
              Text(
                'Difficulty',
                style: TextStyle(color: Colors.white, fontSize: fontSizeLabel),
              ),
              Text(
                _getDifficultyLabel(difficulty),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: fontSizeLabel,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
