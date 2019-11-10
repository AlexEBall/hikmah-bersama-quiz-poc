import 'package:flutter/material.dart';

class DonationHeader extends StatelessWidget {
  const DonationHeader();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        // decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: <Widget>[
            Row(
              //Title and Image Row
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: Text(
                        'Something sdkfj  fsldkj aslfj aasdlfj sfkljasd fklasjdf lask dfsljd ksljdf '),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 15.0),
                    decoration: BoxDecoration(color: Colors.red),
                    height: 50.0,
                    width: 50.0,
                    child: Text('hey'))
              ],
            ),
            Row(
              // Donation amount row
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    'Something on the bottom here',
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
