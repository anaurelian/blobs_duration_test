# blobs_duration_test

A basic Flutter project that tests a potential issue with the [blobs](https://pub.dev/packages/blobs) Flutter Package.

When using `Blob.animatedRandom`, the duration of the animated blob seems to be stuck to the initial value, even if it is changed using `setState` in a `StatefulWidget`.

### Video of the issue

Here is the test app running on an Android 11.0 (API 30) emulator. Pressing the FAB button assigns a random duration and a random color. So the duration keeps changing (as reflected in the app bar), but the animation of the blob shape doesn't seem to change its rythm.

https://user-images.githubusercontent.com/24680762/137090427-cbf742d7-cf87-4a91-b09b-0e42b9352d51.mp4

### The code

```dart

...

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
```

([See the full code](lib/main.dart)).
