import 'dart:async';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:flutter_sixvalley_ecommerce/amplify_configuration/amplifyconfiguration.dart';
import 'package:flutter_sixvalley_ecommerce/models/ModelProvider.dart';
import 'package:provider/provider.dart';

Future<void> initAmplifyPlatformState() async {
  try {
    final api = AmplifyAPI(modelProvider: ModelProvider.instance);
    AmplifyAuthCognito auth = AmplifyAuthCognito();
    final storage = AmplifyStorageS3();

    print('hiiiiiiiiiiiiiiiiiiiiii');

    await Amplify.addPlugins([api, auth, storage]);
    // await Amplify.Auth.signOut();

    StreamSubscription subscription =
        Amplify.Hub.listen([HubChannel.Auth], (HubEvent hubEvent) {
      print('dddddddddddddddddddddddddccccccccccccccccccccccccccccccccc');
      print(hubEvent);
      if (hubEvent.eventName != 'SIGNED_IN') {
        print(hubEvent.payload);
        print(hubEvent.eventName);
        Amplify.Auth.signOut();
        print('*********************************************');
        print('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
      }
      // print('HUB: $lastHubEvent');
    });

    await Amplify.configure(amplifyconfig);
  } on AmplifyAlreadyConfiguredException {
    print(
        'Amplify was already configured. Looks like app restarted on android.');
  }
}
