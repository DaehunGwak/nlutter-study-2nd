import 'package:flutter/material.dart';
import 'package:twitter_challenge/constants/gaps.dart';
import 'package:twitter_challenge/constants/logo.dart';
import 'package:twitter_challenge/constants/sizes.dart';
import 'package:twitter_challenge/features/auth/models/user_account.dart';
import 'package:twitter_challenge/features/auth/widgets/title_text.dart';

class AuthSignUpScreen extends StatefulWidget {
  const AuthSignUpScreen({super.key});

  @override
  State<AuthSignUpScreen> createState() => _AuthSignUpScreenState();
}

class _AuthSignUpScreenState extends State<AuthSignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneOrEmailController = TextEditingController();

  final UserAccount _userAccount = UserAccount(name: '');


  @override
  void initState() {
    super.initState();
    _nameController.addListener(() {
      print(_userAccount);
      setState(() {
        _userAccount.name = _nameController.text;
      });
    });
    _phoneOrEmailController.addListener(() {
      print(_userAccount);
      setState(() {
        _userAccount.email = _phoneOrEmailController.text;
      });
    });
  }


  @override
  void dispose() {
    _nameController.dispose();
    _phoneOrEmailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text(
            'Cancel',
            softWrap: false,
            style: TextStyle(
              fontSize: Sizes.size16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        leadingWidth: Sizes.size96,
        title: Logo.twitter,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
        child: Column(
          children: [
            Gaps.v24,
            const AuthTitleText(title: 'Create your account'),
            Gaps.v32,
            Form(
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: 'Name',
                      suffixIcon: const Icon(Icons.check_circle),
                      suffixIconColor: _userAccount.isNameValid()
                          ? Colors.green
                          : Colors.transparent,
                    ),
                  ),
                  Gaps.v24,
                  TextFormField(
                    controller: _phoneOrEmailController,
                    decoration: InputDecoration(
                      hintText: 'Email address',
                      suffixIcon: const Icon(Icons.check_circle),
                      suffixIconColor: _userAccount.isEmailValid()
                          ? Colors.green
                          : Colors.transparent,
                    ),
                  ),
                  Gaps.v24,
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Date of birth',
                      suffixIcon: const Icon(Icons.check_circle),
                      suffixIconColor: _userAccount.isBirthdayValid()
                          ? Colors.green
                          : Colors.transparent,
                    ),
                  ),
                ],
              ),
            ),
            Gaps.v10,
            const Text(
                'This will not be shown publicly, Confirm your own age, even if this account is for a business, a pet, or something else'),
          ],
        ),
      ),
    );
  }
}
