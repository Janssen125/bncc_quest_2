import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BNCC_Quest',
      initialRoute: '/hal1',
      routes: {
        '/hal1': (context) => const Hal1(),
        '/hal2': (context) => const Hal2(),
      },
    );
  }
}

class Hal1 extends StatefulWidget {
  const Hal1({super.key});

  @override
  State<Hal1> createState() => _Hal1State();
}

class _Hal1State extends State<Hal1> {
  double _size = 100;

  void _animateBox() {
    setState(() {
      _size = _size + 50;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Halaman 1")),
      body: Column(
        children: [
          const SizedBox(height: 20),
          IconButton(
            icon: const Icon(Icons.play_arrow, size: 50, color: Colors.blue),
            onPressed: _animateBox,
          ),
          const SizedBox(height: 20),
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            width: _size,
            height: _size,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: GridView.builder(
                itemCount: 6,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        "Item ${index + 1}",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/hal2');
            },
            child: const Text("Go to Halaman 2"),
          ),
        ],
      ),
    );
  }
}

class Hal2 extends StatelessWidget {
  const Hal2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Halaman 2")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text("Halaman 2",
                style: TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.star, color: Colors.blue),
                  title: Text("List Item ${index + 1}"),
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Back to Halaman 1"),
            ),
          ],
        ),
      ),
    );
  }
}
