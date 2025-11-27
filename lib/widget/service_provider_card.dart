import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_service/model/service_provider_model.dart';
import 'package:quick_service/widget/app_button.dart';
import '../screen/booking_screen.dart';

class ServiceProviderCard extends StatelessWidget {
  const ServiceProviderCard({super.key, required this.provider});
  final ServiceProviderModel provider;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 1,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(provider.imageUrl),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            provider.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 6),
                          if (provider.isVerified)
                            const Icon(
                              Icons.check_circle,
                              color: Colors.blue,
                              size: 16,
                            )
                        ],
                      ),
                      Text("Home Cleaning Services"),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "\$${provider.hourlyRate}/hr",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 16),
                        Text(
                          provider.rating.toString(),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            AppPrimaryButton(
              buttonText: "Book",
              onPressed: () {
                Get.to(BookingScreen(provider: provider));
              },
            ),
          ],
        ),
      ),
    );
  }
}
