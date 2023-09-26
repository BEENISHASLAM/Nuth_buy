import 'package:nuth_buy/exportlinks.dart';
class NotificationServices {
  final  firebaseMessaging = FirebaseMessaging.instance;
  final  FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  void requestNotificationPermission () async {
    NotificationSettings settings = await firebaseMessaging.requestPermission(
      alert: true,
      provisional: true,
      announcement: true,
      badge: true,
      carPlay:true,
      criticalAlert: true,
      sound: true
    );
    if(settings.authorizationStatus==AuthorizationStatus.authorized){
      print("user grant permission");
    }
    else{
      print("user deny permission");
    }
}

void initLocalNotification(BuildContext context , RemoteMessage message)  async{
  var androidInitializationSettings = AndroidInitializationSettings('@mipmap/ic_launche');
  var initializationSettings = InitializationSettings(
    android: androidInitializationSettings,
  );
  await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    onSelectNotification: (String? payload) async {
        print('notification');
      // Handle when a notification is tapped
    },

  );
}
  Future<String?> getDeviceToken() async {
    String? token = await firebaseMessaging.getToken();
    return token;
  }
  void firebaseInit(){
    FirebaseMessaging.onMessage.listen((message) {
      print(message.notification!.title);
      print(message.notification!.body);
      showNotification(message);
    });

  }

  Future<void> showNotification(RemoteMessage message) async {
    AndroidNotificationChannel channel = AndroidNotificationChannel(
      Random.secure().nextInt(10000).toString(),
      'high_importance_channel',
      'Channel Description',
      importance: Importance.max,
    );
    AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
        channel.id.toString(),
        channel.name.toString(),
        channel.description.toString(),
        importance: Importance.high,
        priority: Priority.high,
        ticker: 'ticker'
    );
    NotificationDetails   notificationDetails =  NotificationDetails(
      android: androidDetails,
    );
    Future.delayed(Duration.zero, (){
    _flutterLocalNotificationsPlugin.show(
        0,
        message.notification!.title.toString(),
        message.notification!.body.toString(),
      notificationDetails
    );
    });
  }


  Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
  print(message.notification?.body);
  print(message.data);
  // Handle the notification data here
}
  Future <void> initFirebaseMessaging() async {
    // await _firebaseMessaging.requestPermission();
    // final fcMToken = await _firebaseMessaging.getToken();
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    print('yes');
  }
}