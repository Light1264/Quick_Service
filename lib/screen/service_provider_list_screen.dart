import 'package:flutter/material.dart';

class ServiceProviderListScreen extends StatelessWidget {
  const ServiceProviderListScreen({super.key});

  @override
  Widget build(BuildContext context) {


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

                    decoration: InputDecoration(
                      hintText: 'Search providers...',
                      suffixIcon: IconButton(
                                icon: const Icon(Icons.clear),
                                onPressed: (){},
                              

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
         
        ],
      ),
    );
  }
}
