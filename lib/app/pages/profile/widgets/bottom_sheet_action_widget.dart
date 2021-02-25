import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tuple/tuple.dart';

class BottomSheetActionWidget extends StatelessWidget {
  final Tuple2 action;
  final Function onTap;

  BottomSheetActionWidget(this.action, this.onTap);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(
          children: [
            SvgPicture.asset(action.item1, width: 24,height: 24),
            SizedBox(
              width: 16,
            ),
            Text(action.item2)
          ],
        ),
      ),
      onTap: () => onTap,
    );
  }
}
