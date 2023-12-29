import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:moniepoint_test/features/features.dart';

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
