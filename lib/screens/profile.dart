import 'package:flutter/cupertino.dart';

//page that says profile
class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CupertinoButton(onPressed: null, child: Text("data")),
    );
  }
}
