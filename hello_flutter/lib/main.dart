import 'package:flutter/material.dart';
import 'package:hello_flutter/widgets/button.dart';
import 'package:hello_flutter/widgets/card.dart';

void main() {
  runApp(App());
}

// starting point
class App extends StatelessWidget {
  // return root widget
  // material(google style) or cupertino(ios app) app 이용할 예정
  // scaffold 를 먼저 깔아서 구조를 가져줘야 함
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xff161616),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 70),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'Hey, Selena',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Welcome back',
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.8), fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              Text(
                'Total Balance',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                '\$5 194 482',
                style: TextStyle(
                  fontSize: 44,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const MyButton(
                    text: 'Transfer',
                    backgroundColor: Colors.amber,
                    textColor: Colors.black,
                  ),
                  MyButton(
                    text: 'Request',
                    backgroundColor: Colors.white.withOpacity(0.1),
                    textColor: Colors.white,
                  ),
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    'Wallets',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'View All',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 18,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const MyWalletCard(
                currencyTitle: 'Euro',
                balanceText: '6 428',
                currencyCodeText: 'EUR',
                backgroundColor: Color(0xff1c1d1f),
                fontColor: Colors.white,
                rightIcon: Icons.euro,
                order: 0,
              ),
              const MyWalletCard(
                currencyTitle: 'Dollar',
                balanceText: '55 622',
                currencyCodeText: 'USD',
                backgroundColor: Colors.white,
                fontColor: Color(0xff1c1d1f),
                rightIcon: Icons.monetization_on_outlined,
                order: 1,
              ),
              const MyWalletCard(
                currencyTitle: 'Bitcoin',
                balanceText: '312.65',
                currencyCodeText: 'BTC',
                backgroundColor: Color(0xff1c1d1f),
                fontColor: Colors.white,
                rightIcon: Icons.currency_bitcoin,
                order: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
