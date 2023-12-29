import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:moniepoint_test/common/utils/utils.dart';

import 'widgets/widgets.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: CustomScrollView(
        slivers: [
          const HomeAppBar(),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            sliver: SliverList.list(children: [
              const Gap(20),
              Text(
                'Tracking',
                style: AppTextStyles.mediumSemiBold(color: AppColors.blueGrey),
              ),
              const Gap(12),
              const TrackingCard(),
              const Gap(20),
              Text(
                'Available Vehicles',
                style: AppTextStyles.mediumSemiBold(color: AppColors.blueGrey),
              ),
              SizedBox(
                height: 200,
                child: ListView.separated(
                  itemCount: 4,
                  controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    // final max = scrollController.position.maxScrollExtent / 4;
                    bool isActive = scrollController.offset >= 4;

                    return VehicleCard(isActive: isActive);
                  },
                  separatorBuilder: (context, index) {
                    return const Gap(8);
                  },
                ),
              ),
            ]),
          )
        ],
      ),
      // TODO: custom bottom bar
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.calculate_outlined), label: 'Calculate'),
        BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Shipment'),
      ]),
    );
  }
}

class VehicleCard extends StatelessWidget {
  const VehicleCard({
    super.key,
    required this.isActive,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 120,
      padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          const PositionedVehicleImage(
            isActive: true,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ocean Freight',
                style: AppTextStyles.mediumRegular(
                  color: AppColors.blueGrey,
                  fontSize: 13,
                ),
              ),
              Text(
                'International',
                style: AppTextStyles.mediumRegular(
                    fontSize: 10, color: Colors.grey[700]!),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PositionedVehicleImage extends StatefulWidget {
  const PositionedVehicleImage({
    super.key,
    required this.isActive,
  });

  final bool isActive;

  @override
  State<PositionedVehicleImage> createState() => _PositionedVehicleImageState();
}

class _PositionedVehicleImageState extends State<PositionedVehicleImage>
    with SingleTickerProviderStateMixin {
  late AnimationController imageController;
  late Animation<double> imageAnimation;

  @override
  void initState() {
    super.initState();
    imageController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    imageAnimation = Tween<double>(begin: 100, end: 0).animate(imageController);
    imageController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: imageAnimation,
      builder: (context, _) {
        return Positioned(
          right: imageAnimation.value,
          left: -100,
          child: Image.asset('assets/images/ship.jpg'),
        );
      },
    );
  }
}
