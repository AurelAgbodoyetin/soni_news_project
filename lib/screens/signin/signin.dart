import 'package:flutter/material.dart';
import 'package:soni_news_project/utils/colors.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sign In",
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                          fontSize: 40,
                          letterSpacing: 1.5,
                        ),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: InputDecoration(hintText: "Email"),
                  ),
                  SizedBox(height: 15.0),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Password",
                      //TODO Fix suffix changing color and displaying password
                      suffixIcon: Icon(
                        Icons.lock_outlined,
                        color: kTextColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  TextButton(
                    onPressed: () {
                      //TODO Handle onPressed
                    },
                    child: Text(
                      "Sign in",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 15.0,
                          ),
                    ),
                  ),
                  SizedBox(height: 40.0),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: kLightenBackgroundColor,
                          thickness: 2.0,
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        "OR",
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                              fontSize: 20,
                              letterSpacing: 1.5,
                            ),
                      ),
                      SizedBox(width: 10.0),
                      Expanded(
                        child: Divider(
                          color: kLightenBackgroundColor,
                          thickness: 2.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  TextButton(
                    onPressed: () {
                      //TODO Handle onPressed
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: kLightenPrimaryColor,
                    ),
                    child: Text(
                      "Sign in with Google",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 15.0,
                            color: kBackgroundColor,
                          ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  TextButton(
                    onPressed: () {
                      //TODO Handle onPressed
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: kLightenPrimaryColor,
                    ),
                    child: Text(
                      "Create your account",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 15.0,
                            color: kBackgroundColor,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
