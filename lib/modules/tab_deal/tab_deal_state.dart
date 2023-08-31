import 'package:equatable/equatable.dart';

import '../../data/model/category_model.dart';
import '../../data/model/deal_model.dart';

class TabDealState extends Equatable {
  final String location;
  final List<CategoryModel> lCategory;
  final List<DealModel> lDeal;

  const TabDealState(
      {this.location = 'Warszawa',
      this.lCategory = const [],
      this.lDeal = const []});

  TabDealState copyOf(
          {String? location,
          List<CategoryModel>? lCategory,
          List<DealModel>? lDeal}) =>
      TabDealState(
          lCategory: lCategory ?? this.lCategory,
          lDeal: lDeal ?? this.lDeal,
          location: location ?? this.location);

  @override
  List<Object?> get props => [location, lCategory, lDeal];
}
