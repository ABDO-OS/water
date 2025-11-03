import 'package:flutter/material.dart';
import '../../../core/utils/widgets/bottomnavbar.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/order_button.dart';
import '../widgets/promo_banner.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/water_quantity_selector.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const HomeAppBar(),
              const SizedBox(height: 16),
              const SearchBarWidget(),
              const PromoBanner(),
              const WaterQuantitySelector(),
              const OrderButton(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 4),
    );
  }
}
