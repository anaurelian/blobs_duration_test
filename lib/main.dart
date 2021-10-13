// Copyright 2021 anaurelian. All rights reserved.
// https://anaurelian.com
//
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import 'dart:math';

import 'package:blobs/blobs.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyTestApp());
}

class MyTestApp extends StatelessWidget {
  const MyTestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blobs Duration Test',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Random _random = Random();
  Color _color = Colors.blueGrey;

  // The duration of the animated blob seems to be stuck to this initial value, even if we change it using setState.
  int _duration = 500;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Duration: $_duration milliseconds'), // display the current duration
      ),
      body: Blob.animatedRandom(
        size: 400,
        edgesCount: 6,
        minGrowth: 7,
        // Apply the current color - this works.
        styles: BlobStyles(color: _color),
        loop: true,
        // Apply the current duration - doesn't seem to work!
        duration: Duration(milliseconds: _duration),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.shuffle),
        onPressed: () => setState(() {
          // Randomize the duration and the color
          _duration = _random.nextInt(20) * 500;
          _color = Color.fromRGBO(_random.nextInt(256), _random.nextInt(256), _random.nextInt(256), 1.0);
        }),
      ),
    );
  }
}
