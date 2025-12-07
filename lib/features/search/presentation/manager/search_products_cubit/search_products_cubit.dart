import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../home/domain/entities/product_entity.dart';
import '../../../domain/repos/search_repo.dart';

part 'search_products_state.dart';

class SearchProductsCubit extends Cubit<SearchProductsState> {
  SearchProductsCubit({required this.searchRepos})
      : super(SearchProductsInitial());

  final SearchRepo searchRepos;
  StreamSubscription? _streamSubscription;

  // create method that get a list of search products;
  Future<void> getSearchProducts(
      {required String query}) async {
    emit(SearchProductsLoading());
    _streamSubscription?.cancel();
    _streamSubscription = searchRepos
        .searchProduct( query: query)
        .listen((products) {
      products.fold(
          (failure) =>
              emit(SearchProductsFailure(errormessage: failure.errorMessage)),
          (products) {
        emit(
          SearchProductsSuccess(products: products),
        );
      });
    });
  }

  // // create method that store search query for search products;
  // Future<void> storeSearchQuery({required String query}) async {
  //   emit(const StoreQueryLoading());
  //   try {
  //     await searchRepos.storeSearchQuery(query: query);
  //     emit(StoreQuerySuccess(query: query));
  //   } catch (e) {
  //     emit(const StoreQueryFailure(
  //         errormessage: "failed to store search query"));
  //   }
  // }

  // // create method that get search query for search products;
  // void getSearchQuery() {
  //   emit(const GetSearchQueryLoading());
  //   try {
  //     final query = searchRepos.getSearchQuery();
  //     emit(
  //       GetSearchQuerySuccess(query: query),
  //     );
  //   } catch (e) {
  //     emit(
  //       const GetSearchQueryFailure(errormessage: "failed to get search query"),
  //     );
  //   }
  // }

  // // create method that delete search query for search products;
  // Future<void> deleteSearchQuery({String? query}) async {
  //   emit(const DeleteSearchQueryLoading());
  //   try {
  //     await searchRepos.deleteSearchQuery(query: query);
  //     final queryUpdated = searchRepos.getSearchQuery();
  //     emit(GetSearchQuerySuccess(query: queryUpdated));
  //   } catch (e) {
  //     log("failed to delete search query");
  //     emit(const DeleteSearchQueryFailure(
  //         errormessage: "failed to delete search query"));
  //   }
  // }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
