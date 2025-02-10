import 'package:flutter/material.dart';
import 'package:guia_moteis_app/ui/themes/theme_app.dart';

class FilterButton extends StatelessWidget {
  final String labelText;
  final IconData? filterIcon;

  const FilterButton({
    super.key,
    required this.labelText,
    this.filterIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: ElevatedButton.icon(
        
        style: ElevatedButton.styleFrom(
        alignment: Alignment.center,
        backgroundColor: ThemeApp.white,
        overlayColor: Colors.transparent,
        shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              color: ThemeApp.gray,
              width: 0.5,
            ),
          ),
        ),
        onPressed: () {},
        label: Text(labelText, style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w800,
          color: ThemeApp.textColor
        ),),
        icon: Visibility(
          visible: filterIcon != null,
          replacement: SizedBox.shrink(),
          child: Icon(filterIcon,
          color: ThemeApp.gray,),  
        ),
      ),
    );
  }
}
