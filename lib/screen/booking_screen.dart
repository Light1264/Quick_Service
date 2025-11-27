import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_service/model/service_provider_model.dart';
import 'package:quick_service/theme/app_color.dart';
import 'package:quick_service/widget/app_button.dart';
import '../controllers/booking_controller.dart';

class BookingScreen extends StatelessWidget {
  final ServiceProviderModel provider;
  const BookingScreen({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BookingController(provider));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Booking Screen',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(provider.imageUrl),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        provider.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            size: 16,
                            color: Colors.orange,
                          ),
                          Text(
                            provider.rating.toString(),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    '\$${provider.hourlyRate}/hr',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Divider(),
              const SizedBox(height: 8),
              const Text(
                'Select Date',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.dates.length,
                  itemBuilder: (context, index) {
                    final date = controller.dates[index];
                    // final isSelected =
                    //     controller.selectedDate.value.day == date.day;

                    return GestureDetector(
                      onTap: () => controller.selectDate(date),
                      child: SizedBox(
                        child: Obx(
                          () {
                            return Container(
                              margin: const EdgeInsets.only(right: 10),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: controller.selectedDate.value.day ==
                                        date.day
                                    ? AppColor.primaryColor
                                    : Colors.grey[200],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  controller.formatDate(date),
                                  style: TextStyle(
                                    color: controller.selectedDate.value.day ==
                                            date.day
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight:
                                        controller.selectedDate.value.day ==
                                                date.day
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Select Time',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.timeSlots.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 3,
                ),
                itemBuilder: (context, index) {
                  final slot = controller.timeSlots[index];
                  final isBooked = controller.bookedSlots.contains(slot);
                  final isSelected = controller.selectedTime.value == slot;
                  return GestureDetector(
                    onTap: isBooked ? null : () => controller.selectTime(slot),
                    child: Container(
                      decoration: BoxDecoration(
                        color: isBooked
                            ? Colors.grey[300]
                            : isSelected
                                ? AppColor.primaryColor
                                : Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey[300]!),
                      ),
                      child: Center(
                        child: Text(
                          slot,
                          style: TextStyle(
                            color: isBooked
                                ? Colors.grey
                                : isSelected
                                    ? Colors.white
                                    : Colors.black,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
              const Text(
                'Duration',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              DropdownButton<int>(
                value: controller.selectedDuration.value,
                items: const [1, 2, 3]
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(
                          '$e hour${e > 1 ? 's' : ''}',
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (v) => controller.setDuration(v!),
              ),
              const SizedBox(height: 15),
              Text(
                'Total: \$${controller.totalCost.toStringAsFixed(2)}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 80),
              controller.isConfirming.value
                  ? Center(
                    child: const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: AppColor.primaryColor
                        ),
                      ),
                  )
                  : AppPrimaryButton(
                      buttonText: "Confirm Booking",
                      onPressed: controller.canConfirm
                          ? () => controller.confirmBooking()
                          : () {},
                      buttonColor: controller.canConfirm
                          ? AppColor.primaryColor
                          : Colors.grey,
                    ),
            ],
          ),
        );
      }),
    );
  }
}