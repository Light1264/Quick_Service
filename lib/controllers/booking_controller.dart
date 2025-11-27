import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_service/model/service_provider_model.dart';
import 'package:quick_service/theme/app_color.dart';

class BookingController extends GetxController {
  final ServiceProviderModel provider;
  BookingController(this.provider);

  // --- Reactive State ---
  var selectedDate = DateTime.now().obs;
  var selectedTime = ''.obs;
  var selectedDuration = 1.obs;
  var bookedSlots = <String>[].obs;
  var isConfirming = false.obs;

  // --- Time Slots ---
  final List<String> timeSlots = [
    "9:00 AM",
    "11:00 AM",
    "1:00 PM",
    "3:00 PM",
    "5:00 PM",
    "7:00 PM",
  ];

  // --- 7-Day List ---
  late final List<DateTime> dates;

  @override
  void onInit() {
    super.onInit();
    dates = List.generate(7, (i) => DateTime.now().add(Duration(days: i)));
    generateBookedSlots();
  }

  // --------------------------------------------------------
  // --- BOOKED SLOT GENERATION (Random but consistent) -----
  // --------------------------------------------------------
  void generateBookedSlots() {
    final rand = Random(provider.id.hashCode);
    bookedSlots.value =
        timeSlots.where((_) => rand.nextBool()).take(3).toList();
  }

  // --------------------------------------------------------
  // --- SELECTIONS -----------------------------------------
  // --------------------------------------------------------
  void selectDate(DateTime date) {
    selectedDate.value = date;
  }

  void selectTime(String time) {
    if (!bookedSlots.contains(time)) {
      selectedTime.value = time;
    }
  }

  void setDuration(int hours) {
    selectedDuration.value = hours;
  }

  // --------------------------------------------------------
  // --- FORMATTING HELPERS ---------------------------------
  // --------------------------------------------------------
  String formatDate(DateTime date) {
    final weekdays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
    return "${weekdays[date.weekday - 1]} ${date.day}";
  }

  String fullDate(DateTime date) {
    return "${date.day}-${date.month}-${date.year}";
  }

  // --------------------------------------------------------
  // --- CALCULATIONS ---------------------------------------
  // --------------------------------------------------------
  double get totalCost => provider.hourlyRate * selectedDuration.value;

  bool get canConfirm => selectedTime.isNotEmpty;

  // --------------------------------------------------------
  // --- CONFIRM BOOKING -----------------------------------
  // --------------------------------------------------------
  Future<void> confirmBooking() async {
    if (!canConfirm) return;

    isConfirming.value = true;
    await Future.delayed(const Duration(milliseconds: 800));
    isConfirming.value = false;

    Get.dialog(
      AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Booking Confirmed",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            Icon(
              Icons.check_circle_outline_rounded,
              color: AppColor.primaryColor,
            )
          ],
        ),
        content: Text(
          """
Provider: ${provider.name}
Date: ${fullDate(selectedDate.value)}
Time: ${selectedTime.value}
Duration: ${selectedDuration.value} hr(s)
Total: \$${totalCost.toStringAsFixed(2)}
          """,
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text("Okay"),
          ),
        ],
      ),
    );
  }
}
