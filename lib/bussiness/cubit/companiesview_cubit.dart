import 'package:bloc/bloc.dart';
import '../../data/repository/network_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/models/companies_list.dart';

part 'companiesview_state.dart';

class CompaniesviewCubit extends Cubit<CompaniesviewState> {
  NetworkRepository _networkRepository;
  CompaniesviewCubit({required NetworkRepository networkRepository})
      : _networkRepository = networkRepository,
        super(CompaniesviewLoadingState()) {
    fetchData();
  }

  void fetchData() async {
    emit(CompaniesviewLoadingState());
    try {
      final list = await _networkRepository.getCompanyList();
      emit(CompaniesviewLoadedState(list: list));
    } catch (err) {
      emit(CompaniesviewFaliourState(err.toString()));
    }
  }
}
