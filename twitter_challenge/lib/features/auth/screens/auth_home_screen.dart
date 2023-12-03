import 'package:flutter/material.dart';
import 'package:twitter_challenge/constants/gaps.dart';
import 'package:twitter_challenge/constants/logo.dart';
import 'package:twitter_challenge/constants/sizes.dart';
import 'package:twitter_challenge/features/auth/screens/auth_sign_up_screen.dart';
import 'package:twitter_challenge/features/auth/widgets/auth_button.dart';
import 'package:twitter_challenge/features/auth/widgets/title_text.dart';

class AuthHomeScreen extends StatelessWidget {
  const AuthHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Logo.twitter,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size52),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.v160,
            const AuthTitleText(
                title: 'See whats\'s happening in the world right now.'),
            Gaps.v160,
            const AuthButton(text: 'Continue with Google', icon: Logo.google),
            Gaps.v14,
            const AuthButton(text: 'Continue with Google', icon: Logo.apple),
            Gaps.v20,
            const Row(
              children: [
                Expanded(
                  child: Divider(color: Colors.grey),
                ),
                Gaps.h10,
                Text('or'),
                Gaps.h10,
                Expanded(
                  child: Divider(color: Colors.grey),
                ),
              ],
            ),
            Gaps.v5,
            GestureDetector(
              onTap: () => _onCreateAccountTap(context),
              child: AuthButton(
                text: 'Create account',
                backgroundColor: Theme.of(context).colorScheme.primary,
                fontColor: Theme.of(context).colorScheme.background,
              ),
            ),
            Gaps.v20,
            RichText(
              text: const TextSpan(
                  text: 'By signing up, you agree to our ',
                  style:
                      TextStyle(color: Colors.black87, fontSize: Sizes.size16),
                  children: [
                    TextSpan(
                      text: 'Terms',
                      style: TextStyle(color: Colors.blue),
                    ),
                    TextSpan(
                      text: ', ',
                      style: TextStyle(color: Colors.black87),
                    ),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: TextStyle(color: Colors.blue),
                    ),
                    TextSpan(
                      text: ', and ',
                      style: TextStyle(color: Colors.black87),
                    ),
                    TextSpan(
                      text: 'Cookie Use',
                      style: TextStyle(color: Colors.blue),
                    ),
                    TextSpan(
                      text: '.',
                      style: TextStyle(color: Colors.black87),
                    ),
                  ]),
            ),
            Gaps.v40,
            RichText(
              text: const TextSpan(
                text: 'Have an account already? ',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: Sizes.size14,
                ),
                children: [
                  TextSpan(
                    text: 'Log in',
                    style:
                        TextStyle(fontSize: Sizes.size14, color: Colors.blue),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _onCreateAccountTap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AuthSignUpScreen(),
      ),
    );
  }
}
