import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:moniepoint_test/features/add_stop.dart';

import '../../common/common.dart';

class TrackingCard extends StatefulWidget {
  const TrackingCard({
    super.key,
  });

  @override
  State<TrackingCard> createState() => _TrackingCardState();
}

class _TrackingCardState extends State<TrackingCard>
    with TickerProviderStateMixin {
  late final AnimationController buttonController;
  late final Animation<double> buttonScaleAnimation;

  @override
  void initState() {
    buttonController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300))
      ..addListener(() {
        setState(() {});
      });
    buttonScaleAnimation =
        Tween<double>(begin: 1, end: 0.5).animate(buttonController);
    super.initState();
  }

  @override
  void dispose() {
    buttonController.dispose();
    super.dispose();
  }

  bool addPressed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            offset: const Offset(
              0,
              0,
            ),
            spreadRadius: 0,
            blurRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Shipment Number',
                      style: AppTextStyles.smallLight(color: Colors.grey[700]!),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'NEJ900833412274',
                      style:
                          AppTextStyles.mediumBold(color: AppColors.blueGrey),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Image.asset('assets/images/forklift.jpg', height: 40),
            ],
          ),
          Divider(color: Colors.grey[300]),
          const Gap(4),
          Row(
            children: [
              CircleAvatar(backgroundColor: Colors.red[100]),
              const Gap(6),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sender',
                    style: AppTextStyles.smallLight(
                      color: Colors.grey[700]!,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    'Atlanta, 5243',
                    style: AppTextStyles.mediumRegular(
                      color: AppColors.blueGrey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Time',
                    style: AppTextStyles.smallLight(
                        color: Colors.grey[700]!, fontSize: 12),
                  ),
                  Text(
                    '2 days - 3 days',
                    style: AppTextStyles.mediumRegular(
                        color: AppColors.blueGrey, fontSize: 14),
                  ),
                ],
              )
            ],
          ),
          const Gap(28),
          Row(
            children: [
              CircleAvatar(backgroundColor: Colors.green[100]),
              const Gap(6),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Receiver',
                    style: AppTextStyles.smallLight(
                      color: Colors.grey[700]!,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    'Chicago, 5243',
                    style: AppTextStyles.mediumRegular(
                      color: AppColors.blueGrey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Status',
                      style: AppTextStyles.smallLight(
                          color: Colors.grey[700]!, fontSize: 12),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Waiting to collect',
                      style: AppTextStyles.mediumRegular(
                          color: AppColors.blueGrey, fontSize: 13),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Gap(8),
          Divider(color: Colors.grey[300]),
          AnimatedBuilder(
            animation: buttonScaleAnimation,
            builder: (context, _) {
              return Transform.scale(
                scale: buttonScaleAnimation.value,
                child: GestureDetector(
                  onTapDown: (details) {
                    buttonController.forward();
                  },
                  onTapUp: (details) {
                    buttonController.reverse().whenCompleteOrCancel(() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const AddStop();
                      }));
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.orange[700],
                      ),
                      Text(
                        'Add Stop',
                        style: AppTextStyles.mediumRegular(
                            color: Colors.orange[800]!),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
