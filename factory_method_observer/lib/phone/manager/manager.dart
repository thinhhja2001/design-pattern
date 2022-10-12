import 'package:rxdart/rxdart.dart';

enum MessageType { android, ios, both }

class Message {
  final MessageType platform;
  final String message;

  const Message({required this.message, required this.platform});
}

class ManagerMessage {
  late BehaviorSubject<Message?> _subjectMessage;

  Stream<Message?> get messageObservable => _subjectMessage.stream;

  void postMessage(MessageType platform, String message) {
    _subjectMessage.sink.add(Message(message: message, platform: platform));
  }

  void dispose() {
    _subjectMessage.close();
  }
}
