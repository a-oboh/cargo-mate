import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../common/common.dart';

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
