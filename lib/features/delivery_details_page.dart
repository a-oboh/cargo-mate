import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:moniepoint_test/common/utils/colors.dart';
import 'package:moniepoint_test/common/utils/text_styles.dart';
import 'package:moniepoint_test/features/add_stop.dart';
import 'package:moniepoint_test/features/home_page.dart';

class DeliveryDetails extends StatefulWidget {
  const DeliveryDetails({super.key});

  @override
  State<DeliveryDetails> createState() => _DeliveryDetailsState();
}

class _DeliveryDetailsState extends State<DeliveryDetails>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> largePosition;
  late Animation<double> truckPosition;
  late Animation<double> largeOpacity;
  late Animation<double> truckOpacity;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));

    largePosition = Tween(begin: 100.0, end: 0.0).animate(CurvedAnimation(
      parent: controller,
      curve: const Interval(0.0, 0.3),
    ));

    largeOpacity = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: controller,
      curve: const Interval(0.0, 0.3),
    ));

    truckPosition =Tween(begin: 100.0, end: 0.0).animate(CurvedAnimation(
      parent: controller,
      curve: const Interval(0.1, 0.4),
    )); 

    truckOpacity = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: controller,
      curve: const Interval(0.1, 0.4),
    ));

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[700],
        title: Text(
          'Delivery Details',
          style: AppTextStyles.mediumSemiBold(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: AnimatedBuilder(
            animation: controller,
            builder: (context, _) {
              return ListView(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Delivery Option',
                      style: AppTextStyles.mediumSemiBold(
                        color: AppColors.blueGrey,
                      ),
                    ),
                  ),
                  const Gap(12),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: OptionCard(
                          icon: Icons.local_shipping_outlined,
                          title: 'Express Delivery',
                        ),
                      ),
                      Gap(12),
                      Expanded(
                        child: OptionCard(
                          icon: Icons.local_shipping,
                          title: 'Normal Delivery',
                        ),
                      ),
                    ],
                  ),
                  const Gap(8),
                  Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: Colors.orange[700],
                        size: 12,
                      ),
                      const Gap(4),
                      Text(
                        'Express delivery charge extra 10% cost',
                        style: AppTextStyles.smallLight(
                            fontSize: 10, color: Colors.orange[700]!),
                      ),
                    ],
                  ),
                  const Gap(16),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Product Details',
                      style: AppTextStyles.mediumSemiBold(
                        color: AppColors.blueGrey,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.all(16),
                    child: const Column(
                      children: [
                        DetailField(
                          icon: Icons.edit,
                          hintText: 'Product name',
                          opacity: 1,
                          y: 0,
                        ),
                        Gap(12),
                        DetailField(
                          icon: Icons.scale_outlined,
                          hintText: 'Approx weight',
                          opacity: 1,
                          y: 0,
                        ),
                      ],
                    ),
                  ),
                  const Gap(16),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Available Boxes',
                      style: AppTextStyles.mediumSemiBold(
                        color: AppColors.blueGrey,
                      ),
                    ),
                  ),
                  const Gap(8),
                  Row(
                    children: [
                      BoxCard(
                        title: 'Large Box',
                        opacity: largeOpacity.value,
                        offset: Offset(largePosition.value, 0),
                      ),
                      const Gap(8),
                      BoxCard(
                        title: 'Large Box',
                        opacity: truckOpacity.value,
                        offset: Offset(largePosition.value, 0),
                      ),
                      const Gap(8),
                      BoxCard(
                        title: 'Large Box',
                        opacity: truckOpacity.value,
                        offset: Offset(truckPosition.value, 0),
                      ),
                    ],
                  ),
                  const Gap(12),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (_) => HomePage(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.orange[700],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Text('Next'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }),
      ),
    );
  }
}

class OptionCard extends StatefulWidget {
  const OptionCard({super.key, required this.icon, required this.title});

  final IconData icon;
  final String title;

  @override
  _OptionCardState createState() => _OptionCardState();
}

class _OptionCardState extends State<OptionCard> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isTapped = !isTapped;
        });
      },
      child: AnimatedContainer(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: isTapped ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey[400]!, width: 0.4),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.icon,
                color: isTapped ? Colors.white : Colors.black,
                size: 22,
              ),
              const Gap(8),
              Text(
                widget.title,
                style: TextStyle(
                  color: isTapped ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BoxCard extends StatefulWidget {
  const BoxCard(
      {super.key,
      required this.title,
      required this.opacity,
      required this.offset});

  final String title;
  final double opacity;
  final Offset offset;

  @override
  State<BoxCard> createState() => _BoxCardState();
}

class _BoxCardState extends State<BoxCard> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: widget.offset,
      child: Opacity(
        opacity: widget.opacity,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: AppTextStyles.mediumBold(
                    color: AppColors.blueGrey, fontSize: 12),
              ),
              const Text(
                '50" x 60"',
                style: TextStyle(color: Colors.grey, fontSize: 11),
              ),
              Text(
                '\$200',
                style: TextStyle(color: Colors.deepPurple[700], fontSize: 11),
              ),
              const Gap(8),
              Image.asset(
                'assets/images/box.jpg',
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
