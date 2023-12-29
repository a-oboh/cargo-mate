import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:moniepoint_test/common/utils/utils.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          backgroundColor: Colors.deepPurple,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              BackButton(
                color: Colors.white,
                onPressed: () => Navigator.pop(context),
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(0),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Search...',
                    hintStyle: TextStyle(color: Colors.grey[600]),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.deepPurple,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: const Icon(
                      Icons.clear,
                      size: 16.0,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
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
                  const SearchItem(
                    icon: Icons.work,
                    title: 'Work',
                    subtitle: '2974 Westheimer Rd. Santa Ana, Illinois 994846',
                   
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                    child: Divider(),
                  ),
                  const SearchItem(
                    icon: Icons.home,
                    title: 'Home',
                    subtitle: '3024 Warsaw Rd. Bridgerton, New York 31444',
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                    child: Divider(),
                  ),
                  SearchItem(
                    icon: Icons.add,
                    title: 'Add New Places',
                    subtitle: 'Save your favorite places',
                    iconBg: Colors.orange[400],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchItem extends StatefulWidget {
  const SearchItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.iconBg,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Color? iconBg;

  @override
  State<SearchItem> createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> with SingleTickerProviderStateMixin{
  late  AnimationController buttonController;
  late Animation<double> scale;

  @override
  void initState() {
    super.initState();
    buttonController = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    scale = Tween(begin: 1.0, end: 0.5).animate(buttonController);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        buttonController.forward();
      },
      onTapUp: (details) {
        buttonController.reverse().whenCompleteOrCancel(() {
          Navigator.pop(context);
        });
      },
      child: AnimatedBuilder(
        animation: buttonController,
        builder: (context, child) {
          return Transform.scale(
            scale: scale.value,
            child: Row(
              children: [
                ItemIcon(icon: widget.icon, bg: widget.iconBg),
                const Gap(6),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: AppTextStyles.mediumRegular(fontSize: 14),
                      ),
                      Text(
                        widget.subtitle,
                        style: AppTextStyles.mediumRegular(
                            color: Colors.grey[600]!, fontSize: 11),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }
      ),
    );
  }
}

class ItemIcon extends StatelessWidget {
  const ItemIcon({super.key, required this.icon, this.bg});

  final IconData icon;
  final Color? bg;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 18,
      backgroundColor: bg ?? Colors.deepPurple,
      child: Icon(
        icon,
        size: 20,
        color: Colors.white,
      ),
    );
  }
}
