import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:moniepoint_test/common/utils/utils.dart';
import 'package:moniepoint_test/features/features.dart';

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

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  showAddressSheet() {
    animationController.forward();
    showModalBottomSheet(
        context: context,
        isDismissible: false,
        showDragHandle: true,
        backgroundColor: Colors.white,
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
                                        builder: (_) => const DeliveryDetails(),
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
