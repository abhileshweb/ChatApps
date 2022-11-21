import 'package:meta/meta.dart';

@immutable
class MessageData {
  MessageData(
      {
   required   this.senderName,
   required   this.message,
   required   this.messgaeDate,
   required   this.dateMessage,
   required   this.profilePicture});
  final String senderName;
  final String message;
  final DateTime messgaeDate;
  final String dateMessage;
  final String profilePicture;
}
