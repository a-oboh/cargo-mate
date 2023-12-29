import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:moniepoint_test/common/utils/utils.dart';
import 'package:moniepoint_test/features/delivery_details_page.dart';
import 'package:moniepoint_test/features/search_page.dart';

class AddStop extends StatefulWidget {
  const AddStop({super.key});

  @override
  State<AddStop> createState() => _AddStopState();
}

class _AddStopState extends State<AddStop> with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> homePosition;
  late Animation<double> buttonPosition;
  late Animation<double> homeOpacity;
  late Animation<double> buttonOpacity;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    homePosition = Tween(begin: 100.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.0,
          1.0,
          curve: Curves.easeInOut,
        ),
      ),
    );

    buttonPosition = Tween(begin: 100.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.7,
          1.0,
          curve: Curves.easeInOut,
        ),
      ),
    );

    homeOpacity = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: animationController,
      curve: const Interval(0.1, 0.5),
    ));

    buttonOpacity = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: animationController,
      curve: const Interval(0.7, 1.0),
    ));

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      showAddressSheet();
    });
  }

  showAddressSheet() {
    animationController.forward();
    showModalBottomSheet(
        context: context,
        isDismissible: false,
        builder: (_) {
          return BottomSheet(
            animationController: BottomSheet.createAnimationController(this),
            backgroundColor: Colors.white,
            onClosing: () {
              animationController.reverse();
            },
            showDragHandle: true,
            dragHandleSize: const Size(250, 5),
            dragHandleColor: Colors.grey[300],
            builder: (_) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: AnimatedBuilder(
                    animation: animationController,
                    builder: (context, _) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Transform.translate(
                              offset: Offset(0, homePosition.value),
                              child: Opacity(
                                  opacity: homeOpacity.value,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Address details',
                                      style: AppTextStyles.mediumSemiBold(
                                        color: AppColors.blueGrey,
                                      ),
                                    ),
                                  ))),
                          const Gap(12),
                          DetailField(
                            opacity: homeOpacity.value,
                            y: homePosition.value,
                            icon: Icons.business_outlined,
                            hintText: 'Floor or unit number',
                            onTap: () =>
                                Navigator.of(context).push(searchPageRoute()),
                          ),
                          const Gap(12),
                          DetailField(
                            opacity: homeOpacity.value,
                            y: homePosition.value,
                            icon: Icons.contact_page_outlined,
                            hintText: 'Phone Number',
                          ),
                          const Gap(12),
                          DetailField(
                            opacity: homeOpacity.value,
                            y: homePosition.value,
                            icon: Icons.edit_outlined,
                            hintText: 'Name',
                          ),
                          Transform.translate(
                            offset: Offset(0, buttonPosition.value),
                            child: Opacity(
                              opacity: buttonOpacity.value,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Checkbox(
                                    value: false,
                                    onChanged: (value) {},
                                  ),
                                  Text(
                                    'Save this address',
                                    style: AppTextStyles.smallRegular(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(0, buttonPosition.value),
                            child: Opacity(
                              opacity: buttonOpacity.value,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        // Navigator.of(context).pop();
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (_) => DeliveryDetails(),
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        backgroundColor: Colors.orange,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(12.0),
                                        child: Text('Confirm'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
              );
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
          child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: BackButton(
              onPressed: () => Navigator.pop(context),
            ),
          ),
          //TODO: Map view
        ],
      )),
    );
  }
}

class DetailField extends StatelessWidget {
  const DetailField({
    super.key,
    required this.icon,
    required this.hintText,
    required this.opacity,
    required this.y,
    this.onTap,
  });

  final IconData icon;
  final String hintText;
  final double opacity;
  final double y;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, y),
      child: Opacity(
        opacity: opacity,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 4),
                child: Icon(
                  icon,
                  color: Colors.grey,
                ),
              ),
              Container(
                height: 20,
                width: 1,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                ),
              ),
              const Gap(8),
              Expanded(
                child: TextField(
                  onTap: onTap,
                  decoration: InputDecoration(
                    hintText: hintText,
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

PageRouteBuilder searchPageRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const SearchPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      var offsetAnimation = animation.drive(tween);
      var fadeAnimation = animation.drive(Tween<double>(begin: 0.0, end: 1.0));

      return SlideTransition(
        position: offsetAnimation,
        child: FadeTransition(
          opacity: fadeAnimation,
          child: child,
        ),
      );
    },
  );
}
