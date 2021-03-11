import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StateView extends StatelessWidget {
  final String imagePath;
  final String title;
  final String message;
  final String cta;
  final VoidCallback onCtaClick;

  const StateView({
    @required this.imagePath,
    @required this.title,
    @required this.message,
    @required this.cta,
    @required this.onCtaClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [_buildImage(), _buildTitle(), _buildMessage(), _buildCta()],
      ),
    );
  }

  Widget _buildImage() {
    return Container(
        child: SvgPicture.asset(imagePath, width: 192, height: 192));
  }

  Widget _buildTitle() {
    return Container(
        padding: const EdgeInsets.only(top: 16),
        child: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ));
  }

  Widget _buildMessage() {
    return Container(
      padding: const EdgeInsets.only(top: 16),
      child: Text(
        message,
        style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            height: 1.25,
            color: Colors.grey[400]),
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
    );
  }

  Widget _buildCta() {
    return Container(
      padding: const EdgeInsets.only(top: 16),
      child: ButtonTheme(
        height: 35,
        minWidth: 70,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
          textColor: Colors.white,
          color: Colors.blue,
          onPressed: () => onCtaClick.call(),
          child: Text(
            cta,
            style: TextStyle(color: Colors.white, fontSize: 13.0),
          ),
        ),
      ),
    );
  }
}
