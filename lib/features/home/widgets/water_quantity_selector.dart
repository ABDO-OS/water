import 'package:flutter/material.dart';
import '../../../core/utils/colors/AppColors.dart';
import '../../../core/utils/fonts/AppFonts.dart';
import '../../../core/utils/widgets/customebutton.dart';

class WaterQuantitySelector extends StatefulWidget {
  const WaterQuantitySelector({super.key});

  @override
  State<WaterQuantitySelector> createState() => _WaterQuantitySelectorState();
}

class _WaterQuantitySelectorState extends State<WaterQuantitySelector> {
  int _selectedQuantity = 1; // 0: 6 tons, 1: 12 tons, 2: 18 tons

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.waterQuantityColor.withValues(alpha: 0.25),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'كم تبغى مويه؟',
                style: AppFonts.textMedium.copyWith(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 2),
              Icon(Icons.water_drop, color: AppColors.primaryColor, size: 24),

              const Spacer(),

              Container(
                padding: const EdgeInsets.all(1),
                margin: const EdgeInsets.only(right: 1),
                decoration: BoxDecoration(
                  color: AppColors.waterQuantityColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.primaryColor.withValues(alpha: 0.4),
                    size: 20,
                  ),
                ),
              ),
              const SizedBox(width: 5),
              Container(
                padding: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  color: AppColors.waterQuantityColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.primaryColor.withValues(alpha: 0.4),
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildQuantityCard(3, '18 طن'),
                const SizedBox(width: 12),
                _buildQuantityCard(2, '12 طن'),
                const SizedBox(width: 12),
                _buildQuantityCard(1, '6 طن'),
                const SizedBox(width: 12),
                _buildQuantityCard(0, '6 طن'),
              ],
            ),
          ),
          const SizedBox(height: 18),
          CustomButton(title: 'اطلب الآن', onPressed: () {}, radius: 14),
        ],
      ),
    );
  }

  Widget _buildQuantityCard(int index, String quantity) {
    final isSelected = _selectedQuantity == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedQuantity = index;
        });
      },
      child: Container(
        width: 86,
        height: 114,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? AppColors.primaryColor
                : AppColors.primaryColor.withValues(alpha: 0.2),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/truck.png', width: 50, height: 40),
            const SizedBox(height: 12),
            Text(
              quantity,
              style: AppFonts.textMedium.copyWith(
                fontSize: 16,
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
