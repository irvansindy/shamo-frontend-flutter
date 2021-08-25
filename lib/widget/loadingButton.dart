import 'package:flutter/material.dart';
import 'package:shamo_app/theme.dart';

class LoadingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: double.infinity,
      margin: EdgeInsets.only(top: 30.0),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor: primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 16.0,
              height: 16.0,
              child: CircularProgressIndicator(
                strokeWidth: 2.0,
                valueColor: AlwaysStoppedAnimation(
                  primeTextColor,
                ),
              ),
            ),
            SizedBox(
              width: 4.0,
            ),
            Text(
              'Loading',
              style: primaryTextStyle.copyWith(
                fontSize: 16.0,
                fontWeight: medium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
