import 'package:flutter/material.dart';
import 'package:xtramilemobiletest/screens/webview/view.dart';
import 'package:xtramilemobiletest/utils/color.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.black54),
                    child: const Icon(Icons.account_circle, size: 100)),
                SizedBox(height: 12),
                const Text(
                  "Username Admin",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 4),
                const Text(
                  "admin@gmail.com | 08121212xxxx",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
              ],
            )),
        const SizedBox(height: 20),
        Column(
          children: [
            AccountWidget(
                labelText: "Change Username",
                onClick: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const WebviewPage()));
                }),
            AccountWidget(labelText: "Change Password", onClick: () {}),
            AccountWidget(labelText: "About Us", onClick: () {}),
            AccountWidget(labelText: "Rate Us", onClick: () {}),
            AccountWidget(labelText: "Logout", isLogout: true, onClick: () {})
          ],
        ),
      ],
    );
  }
}

class AccountWidget extends StatelessWidget {
  final String labelText;
  final bool isLogout;
  final VoidCallback onClick;

  const AccountWidget(
      {required this.labelText,
      this.isLogout = false,
      required this.onClick,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          mainAxisAlignment: isLogout
              ? MainAxisAlignment.center
              : MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              labelText,
              style: TextStyle(
                  fontSize: 16,
                  color: isLogout ? Colors.red : Colors.black,
                  fontWeight: FontWeight.w500),
            ),
            !isLogout
                ? const Icon(Icons.navigate_next, size: 24)
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
