import 'package:companieslist/data/models/companies_list.dart';
import 'package:companieslist/data/service/network_service.dart';

class NetworkRepository {
  Future<CompaniesListModel> getCompanyList() async {
    final result = await NetworkService.postCompaniesList();
    return companiesListFromJson(result);
  }
}
