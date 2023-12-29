import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:moniepoint_test/common/utils/colors.dart';
import 'package:moniepoint_test/common/utils/text_styles.dart';
import 'package:moniepoint_test/features/add_stop.dart';
import 'package:moniepoint_test/features/home_page.dart';

class DeliveryDetails extends StatelessWidget {
  const DeliveryDetails({super.key});

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
        child: ListView(
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
            const Row(
              children: [
                BoxCard(title: 'Large Box'),
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
                      backgroundColor: Colors.orange,
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
        ),
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

class BoxCard extends StatelessWidget {
  const BoxCard({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
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
    );
  }
}
