import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_service/controllers/service_provider_controller.dart';
import 'package:quick_service/widget/service_provider_card.dart';

class ServiceProviderListScreen extends StatelessWidget {
  const ServiceProviderListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ServiceProviderController());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Service Providers',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: controller.filterProviders,
                    decoration: InputDecoration(
                      hintText: 'Search providers...',
                      suffixIcon: Obx(
                        () => controller.searchText.isNotEmpty
                            ? IconButton(
                                icon: const Icon(Icons.clear),
                                onPressed: controller.clearSearch,
                              )
                            : const SizedBox(),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (controller.filteredList.isEmpty) {
                return const Center(child: Text("No providers found"));
              }

              return ListView.builder(
                itemCount: controller.filteredList.length,
                itemBuilder: (_, index) {
                  return ServiceProviderCard(
                      provider: controller.filteredList[index]);
                },
              );
            }),
          )
        ],
      ),
    );
  }
}
