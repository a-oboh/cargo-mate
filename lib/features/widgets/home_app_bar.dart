import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:moniepoint_test/common/common.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.deepPurple,
      title: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.grey,
              ),
              const Gap(8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your location',
                    style: AppTextStyles.smallLight(
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Wertheimer, Illonois',
                        style: AppTextStyles.mediumRegular(
                          color: Colors.white,
                        ),
                      ),
                      const Gap(6),
                      const Icon(
                        CupertinoIcons.chevron_down,
                        size: 12,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              const Expanded(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.notifications_none,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(0),
                filled: true,
                fillColor: Colors.white,
                hintText: 'Enter the receipt number',
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.deepPurple,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100.0), // Rounded borders
                  borderSide: BorderSide.none, // No side border
                ),
              ),
            ),
          ),
        ),
      ),
      expandedHeight: 180,
    );
  }
}
