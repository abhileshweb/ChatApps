import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mediator/helper.dart';
import 'package:mediator/utils/theme.dart';
import 'package:mediator/widgets/widgets.dart';

import '../pages/calls_page.dart';
import '../pages/contacts_page.dart';
import '../pages/message_page.dart';
import '../pages/notification_page.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  // ValueNotifier will hold a single value
  final ValueNotifier<int> pageIndex = ValueNotifier(0);
  final ValueNotifier<String> appBarTitleIndex = ValueNotifier("Messages");

  final pages = const [
    MessagePage(),
    NotificationsPage(),
    CallsPage(),
    ContactsPage()
  ];
  final appBarTitle = ["Messages", "Notifications", "Calls", "Contacts"];

  void _onNavigationBuildSelected(index) {
    appBarTitleIndex.value = appBarTitle[index];
    pageIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    // pageIndex.addListener(
    //   () {
    //     print(pageIndex.value);
    //     // its print 1, 2,3 ,4 pages
    //    },
    // );
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        title: ValueListenableBuilder(
          valueListenable: appBarTitleIndex,
          builder: (context, value, child) {
            return Text(value);
          },
        ),
        leadingWidth: 50,
        leading: Align(
          alignment: Alignment.centerRight,
          child: IconBackGround(icon: Icons.search, onTab: () {}),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Avatar.small(url: Helpers.randomPictureUrl()),
          )
        ],
      ),
      // The [valueListenable] and [builder] arguments must not be null.
      //  The [ValueListenable] whose value you depend on in order to build.
      body: ValueListenableBuilder(
        builder: (context, value, _) {
          return pages[value];
        },
        valueListenable: pageIndex,
      ),
      bottomNavigationBar: //
          _BottomNavigationBar(onSelectedItem: _onNavigationBuildSelected),
    );
  }
}

class _BottomNavigationBar extends StatefulWidget {
  const _BottomNavigationBar({super.key, required this.onSelectedItem});

  final ValueChanged<int> onSelectedItem;

  @override
  State<_BottomNavigationBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<_BottomNavigationBar> {
  var isSelectedIndex = 0;

  void handleItemSelected(int index) {
    setState(() {
      isSelectedIndex = index;
      print(isSelectedIndex);
    });
    widget.onSelectedItem(isSelectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return Card(
      elevation: 0,
      color: (brightness == Brightness.light) ? Colors.transparent : null,
      child: SafeArea(
        top: false,
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 8, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NaviagtionBarItem(
                  isSelected: (isSelectedIndex == 0),
                  label: "Messages",
                  icon: CupertinoIcons.bubble_left_bubble_right_fill,
                  index: 0,
                  onTap: handleItemSelected),
              _NaviagtionBarItem(
                  isSelected: (isSelectedIndex == 1),
                  label: "Notifications",
                  icon: CupertinoIcons.bed_double,
                  index: 1,
                  onTap: handleItemSelected),
              _NaviagtionBarItem(
                  isSelected: (isSelectedIndex == 2),
                  label: "Calls",
                  icon: CupertinoIcons.phone_fill,
                  index: 2,
                  onTap: handleItemSelected),
              _NaviagtionBarItem(
                label: "Contacts",
                icon: CupertinoIcons.person_2_fill,
                index: 3,
                onTap: handleItemSelected,
                isSelected: (isSelectedIndex == 3),
              ),
            ],
          ),
        ),
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
      this.isSelected = false,
      required this.onTap});
  final int index;
  final String label;
  final IconData icon;
  final ValueChanged<int> onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
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
              color: isSelected ? AppColors.secondary : null,
            ),
            Text(
              label,
              style: isSelected
                  ? const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondary)
                  : const TextStyle(
                      fontSize: 11,
                    ),
            )
          ],
        ),
      ),
    );
  }
}
