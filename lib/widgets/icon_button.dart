import 'package:flutter/material.dart';
import 'package:mediator/utils/theme.dart';

class IconBackGround extends StatelessWidget {
  const IconBackGround({super.key,required this.icon,required this.onTab});

  final IconData icon;
  final VoidCallback onTab;


  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).cardColor,
      borderRadius: BorderRadius.circular(6),
      child: InkWell(
        borderRadius: BorderRadius.circular(6),
        splashColor: AppColors.secondary,
        onTap: onTab,
        child: Padding(padding: const EdgeInsets.all(6),
        child: Icon(icon,size: 18,),
        
        
        ),
      ),
    );
  }
}
