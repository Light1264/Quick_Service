class ServiceProviderModel {
  final String id;
  final String name;
  final String imageUrl;
  final double rating;
  final double hourlyRate;
  final bool isVerified;

  ServiceProviderModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.hourlyRate,
    required this.isVerified,
  });
}

final providers = [
  ServiceProviderModel(
      id: '1',
      name: 'John Smith',
      imageUrl: 'https://i.pravatar.cc/150?img=12',
      rating: 4.8,
      hourlyRate: 45.0,
      isVerified: true),
  ServiceProviderModel(
      id: '2',
      name: 'Maria Johnson',
      imageUrl: 'https://i.pravatar.cc/150?img=5',
      rating: 4.5,
      hourlyRate: 40.0,
      isVerified: true),
  ServiceProviderModel(
      id: '3',
      name: 'Daniel Lee',
      imageUrl: 'https://i.pravatar.cc/150?img=33',
      rating: 4.2,
      hourlyRate: 35.0,
      isVerified: false),
  ServiceProviderModel(
      id: '4',
      name: 'Grace Kim',
      imageUrl: 'https://i.pravatar.cc/150?img=26',
      rating: 4.9,
      hourlyRate: 55.0,
      isVerified: true),
  ServiceProviderModel(
      id: '5',
      name: 'Samuel Green',
      imageUrl: 'https://i.pravatar.cc/150?img=18',
      rating: 4.1,
      hourlyRate: 30.0,
      isVerified: false),
  ServiceProviderModel(
      id: '6',
      name: 'Linda Brown',
      imageUrl: 'https://i.pravatar.cc/150?img=44',
      rating: 4.7,
      hourlyRate: 48.0,
      isVerified: true),
  ServiceProviderModel(
      id: '7',
      name: 'Nathan Drake',
      imageUrl: 'https://i.pravatar.cc/150?img=51',
      rating: 4.4,
      hourlyRate: 37.0,
      isVerified: false),
  ServiceProviderModel(
      id: '8',
      name: 'Sophia Carter',
      imageUrl: 'https://i.pravatar.cc/150?img=69',
      rating: 4.9,
      hourlyRate: 60.0,
      isVerified: true),
];
