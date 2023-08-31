import 'package:base_bloc/data/model/category_model.dart';
import 'package:base_bloc/data/model/deal_model.dart';
import 'package:base_bloc/modules/tab_deal/tab_deal_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabDealBloc extends Cubit<TabDealState> {
  TabDealBloc() : super(const TabDealState());

  void getDeal({bool? isPaging}) {}

  List<CategoryModel> lCategoryFake() => [
        CategoryModel(name: 'Bary'),
        CategoryModel(name: 'Restauracje'),
        CategoryModel(name: 'Kawiarnie'),
        CategoryModel(name: 'Street food'),
      ];

  List<DealModel> lDeal() => [
        DealModel(
            restaurantName: 'Anatolia Restaurant & Lounge',
            category: 'Bary',
            distance: 219,
            deal: 'Śródziemnomorska',
            avatar: '',
            poster: ''),
        DealModel(
            restaurantName: 'Trattoria Rucola',
            category: '',
            distance: 219,
            deal: 'Włoska',
            avatar: '',
            poster: ''),
        DealModel(
            restaurantName: 'ORZO',
            category: '',
            distance: 218,
            deal: 'Śródziemnomorska',
            avatar: '',
            poster: ''),
        DealModel(
            restaurantName: 'Tel Aviv',
            category: '',
            distance: 0,
            deal: 'Śródziemnomorska',
            avatar: '',
            poster: ''),
        DealModel(
            restaurantName: 'Sushi Świętokrzyska',
            category: '',
            distance: 0,
            deal: 'Azjatycka',
            avatar: '',
            poster: ''),
        DealModel(
            restaurantName: 'K-bar',
            category: '',
            distance: 0,
            deal: 'Azjatycka',
            avatar: '',
            poster: '')
      ];
}
