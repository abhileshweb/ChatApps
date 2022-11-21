import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/calls_page.dart';
import '../pages/contacts_page.dart';
import '../pages/message_page.dart';
import '../pages/notification_page.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  // ValueNotifier will hold a single value
  final ValueNotifier<int> pageIndex = ValueNotifier(0);
  final pages = const [
    MessagePage(),
    NotificationsPage(),
    CallsPage(),
    ContactsPage()
  ];

  int indexvalue = 0;

  @override
  Widget build(BuildContext context) {
    // pageIndex.addListener(
    //   () {
    //     print(pageIndex.value);
    //     // its print 1, 2,3 ,4 pages
    //    },
    // );
    return Scaffold(
      // The [valueListenable] and [builder] arguments must not be null.
      //  The [ValueListenable] whose value you depend on in order to build.
      body: ValueListenableBuilder(
        builder: (context, value, _) {
          return pages[value];
        },
        valueListenable: pageIndex,
      ),
      bottomNavigationBar: _BottomNavigationBar(
        onSelectedItem: (value) {
          indexvalue = value;
        },
      ),
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar({super.key, required this.onSelectedItem});

  final ValueChanged<int> onSelectedItem;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NaviagtionBarItem(
              label: "Messages",
              icon: CupertinoIcons.bubble_left_bubble_right_fill,
              index: 0,
              onTap: onSelectedItem),
          _NaviagtionBarItem(
              label: "Notifications",
              icon: CupertinoIcons.bed_double,
              index: 1,
              onTap: onSelectedItem),
          _NaviagtionBarItem(
              label: "Calls",
              icon: CupertinoIcons.phone_fill,
              index: 2,
              onTap: onSelectedItem),
          _NaviagtionBarItem(
              label: "Contacts",
              icon: CupertinoIcons.person_2_fill,
              index: 3,
              onTap: onSelectedItem),
        ],
      ),
    );
  }
}

class _NaviagtionBarItem extends StatelessWidget {
  const _NaviagtionBarItem(
      {super.key,
      required this.label,
      required this.icon,
      required this.index,
      required this.onTap});
  final int index;
  final String label;
  final IconData icon;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(index);
      },
      child: SizedBox(
        height: 70,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 20,
            ),
            Text(
              label,
              style: const TextStyle(
                fontSize: 11,
              ),
            )
          ],
        ),
      ),
    );
  }
}
