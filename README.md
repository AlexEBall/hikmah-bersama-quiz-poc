# Hikmah Quiz POC

## Getting started

First things first, you'll need to install flutter

Here's the [docs](https://flutter.dev/docs/get-started/install)

If you're using a mac, I recommend these videos from London App Brewery (Angela Yu)

- [Installing Flutter on Mac (part I)](https://www.youtube.com/watch?v=hL7pkX1Pfko)
- [Installing Flutter on Mac (part II)](https://www.youtube.com/watch?v=gv1LScpG0jM)

If you're on windows she has videos for that too... I just haven't looked since I use a mac

Once that's all up and ready. Start up an Android or iOS emulator and try out the following.

Make sure you get all your packages in the `pubspec.yaml` then `flutter run`

That should boot up the app

## Architecture

This application uses Redux to manage it's state. In order to create a new state property in the store. You'll have to from `lib` cd into `redux/app/app_state` to add a new state property. Create a new folder under redux named after the piece of state you're adding. Each state folder should contain 3 files:

- `<state>_actions.dart`
- `<state>_reducer.dart`
- `<state>_state.dart`

Try to follow the patterns set out and work within the Flux/Redux architecture.

Once state has been configured you can connect the store to a screen.

```
class YourWidget extends StatelessWidget {
  static const String id = 'yourWidget_screen';

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      distinct: true,
      onInit: (store) {
        <!-- Here you can dispatch actions from the store on init -->
      },
      converter: (store) => store.state,
      builder: (context, state) => YourPage(state),
      onDidChange: (state) {},
    );
  }
}

class YourPage extends StatelessWidget {
  YourPage(this.state);
  final AppState state;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30.0),
      child: Widget(
        slides: // You have access to state and can pick off a property,
        nameDoneBtn: 'Get Started',
        onDonePress: () => Navigator.pushNamed(context, QuizScreen.id),
      ),
    );
  }
}
```

## Other notes

- Try to break things down into components as much as possible
- Use full relative paths for imports

Follow this convention when importing

```
<!-- Block 1: Flutter intermnals and 3rd Parties  -->
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

<!-- Block 2: Anything related to the store -->
import 'package:hikmah_bersama_quiz_poc/redux/app/app_state.dart';

<!-- Block 3: App level components, constants, utilities -->
import 'package:hikmah_bersama_quiz_poc/components/ui/circle_avatar.dart';
import 'package:hikmah_bersama_quiz_poc/constants/constants.dart';
```
