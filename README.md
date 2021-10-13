# blobs_duration_test

A basic Flutter project that tests a potential issue with the [blobs](https://pub.dev/packages/blobs) Flutter Package.

When using `Blob.animatedRandom`, the duration of the animated blob seems to be stuck to the initial value, even if we change it using `setState` in a `StatefulWidget` ([see the code](lib/main.dart)).

### Video of the issue

Here is the test app running on an Android 11.0 (API 30) emulator. Pressing the FAB button assigns a random duration and a random color. So the duration keeps changing, but the animation of the blob shape doesn't seem to change its rythm.

https://user-images.githubusercontent.com/24680762/137085863-23207b7e-76a7-4aa0-b989-58f3c7648d5d.mp4

 

