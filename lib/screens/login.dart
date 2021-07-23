import 'package:flutter/material.dart';
import 'package:thirtydays_flutter/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String name = "";
  final _formKey = GlobalKey<FormState>();
  moveToHome(BuildContext context) {
    {
      if (_formKey.currentState!.validate()) {
        Navigator.pushNamed(context, MyRoutes.homeRoute);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: context.canvasColor,
        child: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/login.png",
                    fit: BoxFit.cover,
                  ),
                  Text(
                    "Welcome! $name",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Enter Username",
                            labelText: "Username or email",
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Username is required";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            name = value;
                            setState(() {});
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: "Enter Password",
                              labelText: "Password",
                              border: OutlineInputBorder()),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password is required";
                            } else if (value.length < 8) {
                              return "Password length must be greater than 8 characters";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 35,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    context.theme.buttonColor)),
                            onPressed: () => moveToHome(context),
                            child: Text("Sign in"),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
