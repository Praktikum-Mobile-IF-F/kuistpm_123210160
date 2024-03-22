import 'package:kuistpm/screen.dart';
import 'package:flutter/material.dart';
import 'package:kuistpm/screen.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String username = "";
  String password = "";
  bool isLogin = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Kuis Mobile",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text("Silahkan Login"),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  onChanged: (value) {
                    username = value;
                  },
                  onSaved: (String? value) {},
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  onChanged: (value) {
                    password = value;
                  },
                  onSaved: (String? value) {},
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      String text = "";
                      SnackBar snackBar;
                      if (username == "admin" && password == "123") {
                        setState(() {
                          text = "Login Sukses";
                          snackBar = SnackBar(
                            behavior: SnackBarBehavior.floating,
                            content: Text(
                              text,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                            backgroundColor: Colors.green,
                          );
                          isLogin = true;
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return SecondPage();
                          }));
                        });
                      } else {
                        setState(() {
                          text = "Login Gagal";
                          snackBar = SnackBar(
                            behavior: SnackBarBehavior.floating,
                            content: Text(
                              text,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                            backgroundColor: Colors.red,
                          );
                          isLogin = false;
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        });
                      }
                    },
                    color: Colors.red,
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
