import 'package:get/get.dart';
import 'package:quick_service/model/service_provider_model.dart';
import 'dart:async';

class ServiceProviderController extends GetxController {
  var providerList = <ServiceProviderModel>[].obs;
  var filteredList = <ServiceProviderModel>[].obs;
  var isLoading = true.obs;
  var searchText = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadProviders();
  }

  void loadProviders() async {
    await Future.delayed(const Duration(seconds: 1));
    providerList.value = providers;
    filteredList.value = providers;
    isLoading.value = false;
  }

  void filterProviders(String query) {
    searchText.value = query;
    if (query.isEmpty) {
      filteredList.value = providerList;
    } else {
      filteredList.value = providerList
          .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }

  void clearSearch() {
    searchText.value = '';
    filteredList.value = providerList;
  }
}
