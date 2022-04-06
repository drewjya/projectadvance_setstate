import 'package:flutter/material.dart';
import 'package:projectadvance/components/textbox.dart';
import 'package:projectadvance/service/service.dart';
import 'package:projectadvance/service/session.dart';
import 'package:projectadvance/view/welcome_page.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  void initState() {
    check();
    super.initState();
  }

  check() async {
    var session = await Session.read();
    bool result = await Service.login(session["username"], session["password"]);
    if (result) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const WelcomePage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController username = TextEditingController();
    TextEditingController password = TextEditingController();
    // Future signup() async {
    //   String uname = username.text;
    //   String pass = password.text;
    //   await Service.createUsers(uname, pass);
    //   Session.write(uname, pass);
    //   print(await Session.read());
    // }

    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: size.height * 0.3,
          ),
          TextBox(
            title: "Username",
            controller: username,
          ),
          TextBox(
            title: "Password",
            controller: password,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 75),
            margin: const EdgeInsets.only(top: 20),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                color: Colors.blue,
              )),
              onPressed: () {
                // signup();
                Service.login(username.text, password.text).then((value) {
                  if (value) {
                    Session.write(username.text, password.text);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WelcomePage(),
                      ),
                    );
                  }
                });
              },
              child: const Center(
                child: Text("Login"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
