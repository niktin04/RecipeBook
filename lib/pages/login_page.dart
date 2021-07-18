import 'package:flutter/material.dart';
import 'package:recipe_book/services/auth_service.dart';
import 'package:recipe_book/pages/signup_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = new GlobalKey<FormState>();

  String email = "", password = "";
  Color greenColour = Color(0xFF00AF19);

  // To check fields during submit
  checkFields() {
    final form = formKey.currentState!;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  // To validate email
  String? validateEmail(String value) {
    RegExp regex = new RegExp(r"^(\w|\.|\_|\-)+[@](\w|\_|\-|\.)+[.]\w{2,3}$");
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Form(
          key: formKey,
          child: _buildLoginForm(),
        ),
      ),
    );
  }

  _buildLoginForm() {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24.0),
      child: ListView(
        children: [
          SizedBox(
            height: 72.0,
          ),
          Container(
            height: 120.0,
            width: 200.0,
            child: Stack(
              children: [
                Text(
                  "Hello",
                  style: TextStyle(fontSize: 60.0),
                ),
                Positioned(
                  top: 50.0,
                  child: Text(
                    "There",
                    style: TextStyle(fontSize: 60.0),
                  ),
                ),
                Positioned(
                  top: 97.0,
                  left: 175.0,
                  child: Container(
                    height: 10.0,
                    width: 10.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: greenColour,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "EMAIL",
              labelStyle: TextStyle(
                fontSize: 12.0,
                color: Colors.grey.withOpacity(0.5),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: greenColour,
                ),
              ),
            ),
            onChanged: (value) {
              this.email = value;
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Email is required!";
              }
              return validateEmail(value);
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "PASSWORD",
              labelStyle: TextStyle(
                fontSize: 12.0,
                color: Colors.grey.withOpacity(0.5),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: greenColour,
                ),
              ),
            ),
            obscureText: true,
            onChanged: (value) {
              this.password = value;
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Password is required!";
              } else {
                return null;
              }
            },
          ),
          SizedBox(
            height: 5.0,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              alignment: Alignment(1.0, 0.0),
              padding: EdgeInsets.only(
                top: 15.0,
                left: 20.0,
              ),
              child: InkWell(
                child: Text(
                  "Forgot Password",
                  style: TextStyle(
                      color: greenColour,
                      fontSize: 11.0,
                      decoration: TextDecoration.underline),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50.0,
          ),
          GestureDetector(
            onTap: () {
              if (checkFields()) {
                AuthService().signIn(email, password, context);
              }
            },
            child: Container(
              height: 50.0,
              alignment: Alignment(1.0, 0.0),
              padding: EdgeInsets.only(
                top: 15.0,
                left: 20.0,
              ),
              child: Material(
                borderRadius: BorderRadius.circular(20.0),
                shadowColor: Colors.greenAccent,
                color: greenColour,
                elevation: 7.0,
                child: Center(
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          GestureDetector(
            onTap: () {
              AuthService().signInWithGoogle();
            },
            child: Container(
              height: 50.0,
              alignment: Alignment(1.0, 0.0),
              padding: EdgeInsets.only(
                top: 15.0,
                left: 20.0,
              ),
              child: Material(
                borderRadius: BorderRadius.circular(20.0),
                shadowColor: Colors.greenAccent,
                color: greenColour,
                elevation: 7.0,
                child: Center(
                  child: Text(
                    "LOGIN WIH GOOGLE",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("New to recipe book?"),
              SizedBox(
                width: 5.0,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/register',
                  );
                },
                child: Text(
                  "Register",
                  style: TextStyle(
                    color: greenColour,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
