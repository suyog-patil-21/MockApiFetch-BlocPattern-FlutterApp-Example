part of 'companiesview_cubit.dart';

@immutable
abstract class CompaniesviewState extends Equatable {
  const CompaniesviewState();
  @override
  List<Object?> get props => [];
}

class CompaniesviewLoadingState extends CompaniesviewState {}

class CompaniesviewLoadedState extends CompaniesviewState {
  final CompaniesListModel list;
  const CompaniesviewLoadedState({required this.list});
  @override
  List<Object?> get props => [list];
}

class CompaniesviewFaliourState extends CompaniesviewState {
  final String message;
  const CompaniesviewFaliourState(this.message);
  @override
  List<Object?> get props => [message];
}
