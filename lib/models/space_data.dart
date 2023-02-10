import 'package:meta/meta.dart';

@immutable
class SpaceData {
  const SpaceData({
    required this.title,
    this.firstBoxTitle,
    this.firstBoxDescription,
    this.secondBoxTitle,
    this.secondBoxDescription,
    this.price,
    this.priceTimeReference,
    this.bookedDates,
    required this.picture,
  });
  final String title;
  final String? firstBoxTitle;
  final String? firstBoxDescription;
  final String? secondBoxTitle;
  final String? secondBoxDescription;
  final int? price;
  final String? priceTimeReference;
  final DateTime? bookedDates;
  final String picture;
}