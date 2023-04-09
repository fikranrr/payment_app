import 'package:flutter/material.dart';
import 'package:payment_app/theme.dart';

void main() {
  runApp(PaymentApp());
}

class PaymentApp extends StatefulWidget {
  const PaymentApp({Key? key}) : super(key: key);

  @override
  State<PaymentApp> createState() => _PaymentAppState();
}

class _PaymentAppState extends State<PaymentApp> {
  int selectionIndex = -1;

  @override
  Widget build(BuildContext context) {
    Widget option(int index, String title, String subtitle, String price) {
      return GestureDetector(
        onTap: () {
          setState(() {
            selectionIndex = index;
          });
        },
        child: Container(
          width: 311,
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 10,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                  color: selectionIndex == index
                      ? Color(0xff007DFF)
                      : Color(0xff40587C))),
          child: Row(
            children: [
              selectionIndex == index
                  ? Image.asset(
                      'assets/check_filled.png',
                      width: 18,
                    )
                  : Image.asset(
                      'assets/check.png',
                      width: 18,
                    ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: planTextStyle,
                    ),
                    Text(
                      subtitle,
                      style: optionTextStyle,
                    )
                  ],
                ),
              ),
              Text(
                price,
                style: priceTextStyle,
              ),
            ],
          ),
        ),
      );
    }

    Widget header() {
      return Padding(
        padding: EdgeInsets.only(
          top: 50,
          left: 32,
          right: 32,
        ),
        child: Column(
          children: [
            Center(
              child: Image.asset(
                'assets/goal.png',
                width: 267,
                height: 200,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Column(
              children: [
                Text.rich(
                  TextSpan(
                    text: 'Upgrade to',
                    style: titleTextStyle.copyWith(
                      fontSize: 26,
                    ),
                    children: [
                      TextSpan(
                        text: ' Pro',
                        style: titleproTextStyle,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Go unlock all features and\nbuild your own business bigger',
                  style: title2TextStyle.copyWith(fontSize: 16),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ],
        ),
      );
    }

    Widget checkButton() {
      return Container(
        margin: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 20,
        ),
        height: 50,
        width: 311,
        child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            backgroundColor: blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(70),
            ),
          ),
          child: Text(
            'Checout Now',
            style: buttonTextStyle,
          ),
        ),
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: darkBlue,
        body: SingleChildScrollView(
          child: Column(
            children: [
              header(),
              SizedBox(
                height: 20,
              ),
              option(0, 'Monthly', 'Good for starting up', '\$20'),
              option(1, 'Quarterly', 'Focusing on building', '\$55'),
              option(2, 'Yearly', 'Steady company', '\$220'),
              selectionIndex == -1 ? SizedBox() : checkButton(),
            ],
          ),
        ),
      ),
    );
  }
}
