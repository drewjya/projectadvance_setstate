import 'package:flutter/material.dart';
import '../components/newappbar.dart';
import '../model/konsumen.dart';
import '../service/service.dart';
import '../service/session.dart';
import '../view/input_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List<Konsumen> konsumen = [];
  bool flag = false;
  String? username;
  @override
  void initState() {
    Service.getItems().then((value) {
      konsumen.addAll(value);
      flag = true;
      setState(() {});
    });
    getUsername();
    super.initState();
  }

  getUsername() async {
    var res = await Session.read();
    username = res["username"];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewAppBar(text: "Data Konsumen"),
      body: (flag)
          ? Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              child: CustomScrollView(
                slivers: <Widget>[
                  Welcome(username: username!),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 30,
                    ),
                  ),
                  SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                    var curr = konsumen[index];
                    if (konsumen.isEmpty) {
                      return const Text("Empty");
                    } else if (index >= 0 && index < konsumen.length - 1) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text("${curr.nama} (${curr.nohp})"),
                            const Text(
                                "Jl. MT Haryono no 11 Jakarta Timur, 13330"),
                            const SizedBox(
                              height: 10,
                            ),
                            const Divider(
                              thickness: 10,
                              color: Color.fromARGB(255, 22, 98, 160),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text("${curr.nama} (${curr.nohp})"),
                            const Text(
                                "Jl. MT Haryono no 11 Jakarta Timur, 13330"),
                            const SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      );
                    }
                  }, childCount: konsumen.length))
                ],
              ),
            )
          : null,
      floatingActionButton: SizedBox(
        height: 40,
        width: 40,
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const InputPage();
                },
              ),
              (route) {
                return true;
              },
            );
          },
          shape: const CircleBorder(
              side: BorderSide(
            color: Color.fromARGB(255, 22, 98, 160),
            width: 2,
          )),
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class Welcome extends StatelessWidget {
  const Welcome({
    Key? key,
    required this.username,
  }) : super(key: key);

  final String username;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Text.rich(
        TextSpan(
          text: "Selamat Datang, ",
          children: [
            TextSpan(
              text: username,
              style: const TextStyle(
                color: Colors.red,
              ),
            ),
          ],
        ),
        style: const TextStyle(
          fontSize: 17,
        ),
      ),
    );
  }
}
