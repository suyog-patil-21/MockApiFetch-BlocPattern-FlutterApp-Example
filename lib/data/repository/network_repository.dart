import '../models/companies_list.dart';
import '../service/network_service.dart';

import '../../globals/custom_error.dart';

class NetworkRepository {
  Future<CompaniesListModel> getCompanyList() async {
    try {
      final result = await NetworkService.postCompaniesList();
      return companiesListFromJson(result);
    } on FormatException {
      throw CustomError('Bad Request Format');
    }
  }
}
