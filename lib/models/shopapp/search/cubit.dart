import 'package:flutter2/models/shopapp/search/search_model.dart';
import 'package:flutter2/models/shopapp/search/state.dart';
import 'package:flutter2/shared/components/constants.dart';
import 'package:flutter2/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter2/shared/network/end_points.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialState());
  static SearchCubit get(context) => BlocProvider.of(context);

  SearchModel? model;
  void search(String text) {
    emit(SearchLoadingState());

    DioHelper.postDate(
      url: SEARCH,
      token: token,
      data: {
      'text': text,
    }).then((value) {
      model = SearchModel.fromJson(value.data);
      emit(SearchSuccessState());
    }).catchError((e) {
      print(e.toString());
      emit(SearchErrorState());
    });
  }
}
