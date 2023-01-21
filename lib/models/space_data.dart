import 'package:meta/meta.dart';

@immutable
class SpaceData {
  const SpaceData({
    required this.title,
    required this.price,
    this.bookedDates,
    this.picture,
  });
  final String title;
  final String price;
  final DateTime? bookedDates;
  final String? picture;
}