
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import '../../data/models/message_model.dart';

class MessageModelEntity extends Equatable {
  final String id;
  final String sender;
  final String content;
  final Timestamp time;
  final MessageType type;

  const MessageModelEntity({
    required this.id,
    required this.sender,
    required this.content,
    required this.time,
    required this.type,
  });

  @override
  List<Object?> get props => [
    id,
    sender,
    content,
    time,
    type,
  ];
}
