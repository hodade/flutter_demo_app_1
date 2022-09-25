import 'package:flutter/material.dart';

class NextPage extends StatelessWidget {
  final String title;
  const NextPage(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 30,
                  child: Text('ID')
                ),
                const Text(': id'),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(
                    width: 30,
                    child: Text('PW')
                ),
                const Text(': password'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
