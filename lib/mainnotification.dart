import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;
void main() {
  runApp(MyApp());
  /* final channel = IOWebSocketChannel.connect('ws://192.168.1.15:8080');

  channel.stream.listen((message) {
    channel.sink.add('received!');
    channel.sink.close(status.goingAway);
  });*/
}

class MyApp extends StatelessWidget {
  final WebSocketChannel channel = IOWebSocketChannel.connect('ws://192.168.1.15:8080');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WebSocket Notification Demo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
   
        body: Center(
          child: StreamBuilder(
            stream: channel.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text('Produit ${snapshot.data}');
              } else {
                return Text('Waiting for notifications...');
              }
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {

    channel.sink.close();
  }
}
