import 'package:meta/meta.dart';

@immutable
class BookedData {
  const BookedData({
    required this.clientId,
    required this.date,
    required this.spaceId,
  });
  final String clientId;
  final DateTime? date;
  final String spaceId;
}