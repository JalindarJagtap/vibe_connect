import '../../domain/entities/user_profile.dart';

class RandomUserModel {
  final String id;
  final String first;
  final String last;
  final int age;
  final String pictureLarge;
  final String pictureMedium;
  final String city;
  final String state;
  final String country;

  RandomUserModel({
    required this.id,
    required this.first,
    required this.last,
    required this.age,
    required this.pictureLarge,
    required this.pictureMedium,
    required this.city,
    required this.state,
    required this.country,
  });

  factory RandomUserModel.fromJson(Map<String, dynamic> json, int index) {
    final nameJson = json['name'] ?? {};
    final dobJson = json['dob'] ?? {};
    final locationJson = json['location'] ?? {};
    final pictureJson = json['picture'] ?? {};
    final loginJson = json['login'] ?? {};

    return RandomUserModel(
      id: loginJson['uuid'] ?? 'user_$index',
      first: nameJson['first'] ?? 'User',
      last: nameJson['last'] ?? '',
      age: dobJson['age'] ?? (21 + (index % 8)),
      pictureLarge: pictureJson['large'] ?? 'https://images.unsplash.com/photo-1534528741775-53994a69daeb',
      pictureMedium: pictureJson['medium'] ?? 'https://images.unsplash.com/photo-1534528741775-53994a69daeb',
      city: locationJson['city'] ?? 'Bengaluru',
      state: locationJson['state'] ?? 'Karnataka',
      country: locationJson['country'] ?? 'India',
    );
  }

  UserProfile toEntity(int index) {
    final listOccupations = [
      'Product Designer · 5\'5"',
      'Content Creator · 5\'2"',
      'Fashion Design · 5\'6"',
      'Architect · 5\'4"',
      'UX Researcher · 5\'7"',
      'Brand Strategist · 5\'3"',
      'Software Engineer · 5\'5"',
      'Creative Director · 5\'6"'
    ];

    final listMatchPercents = [88, 92, 77, 95, 84, 90, 89, 94];
    final listTrustPercents = [98, 98, 98, 99, 97, 98, 96, 99];
    final listReplyTimes = [
      '~5m Reply',
      '~5m Replies',
      '~2m Reply',
      '~10m Reply',
      '~5m Reply'
    ];

    final listGoals = [
      "Let's see where it goes",
      "Serious relationship",
      "Long-term, marriage-open",
      "Deep connection first",
      "Looking for something real"
    ];

    final listBios = [
      "Building products by day, planning my next trek by night. Looking for someone equally driven and equally curious.",
      "Creative soul with a soft spot for specialty coffee, indie gigs, and late night conversations.",
      "Design enthusiast who loves art galleries, weekend getaways, and cooking experimental dishes.",
      "Explorer at heart. When not working, you'll find me reading in cozy cafes or on a nature trail.",
    ];

    final listPrompts1 = [
      {
        'q': 'The way to win me over is...',
        'a': 'A good book rec and a strong chai opinion.'
      },
      {
        'q': 'Together, we could...',
        'a': 'Explore hidden coffee spots and host cozy dinner parties.'
      },
      {
        'q': 'I take pride in...',
        'a': 'Making the best homemade pesto and keeping my indoor plants alive.'
      },
    ];

    final listPrompts2 = [
      {
        'q': 'My simple pleasures...',
        'a': 'Roadside chai after a long trek, no signal, good company.'
      },
      {
        'q': 'A key to my heart is...',
        'a': 'Spontaneous weekend road trips and great playlists.'
      },
    ];

    final prompt1 = listPrompts1[index % listPrompts1.length];
    final prompt2 = listPrompts2[index % listPrompts2.length];

    final secondaryImages = [
      'https://images.unsplash.com/photo-1517841905240-472988babdf9?w=800&q=80',
      'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?w=800&q=80',
      'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=800&q=80',
      'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?w=800&q=80',
    ];

    final defaultName = index == 0 ? 'Meera' : (index == 1 ? 'Ishita' : first);

    return UserProfile(
      id: id,
      name: defaultName,
      age: age,
      pictureUrl: pictureLarge,
      secondaryPictureUrl: secondaryImages[index % secondaryImages.length],
      videoIntroUrl: 'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?w=800&q=80',
      videoDuration: '0:28',
      motherTongue: index % 2 == 0 ? 'Marathi' : 'Hindi',
      communicationStyle: index % 2 == 0 ? 'Phone calls over texts' : 'Voice notes & quick texts',
      city: index == 0 ? 'Bengaluru' : (index == 1 ? 'Hyderabad' : city),
      distanceKm: 2 + (index * 3) % 12,
      occupation: listOccupations[index % listOccupations.length],
      height: index % 2 == 0 ? "5'5\" (165 cm)" : "5'2\" (157 cm)",
      relationshipGoal: listGoals[index % listGoals.length],
      matchPercentage: listMatchPercents[index % listMatchPercents.length],
      trustPercentage: listTrustPercents[index % listTrustPercents.length],
      replyTime: listReplyTimes[index % listReplyTimes.length],
      aboutBio: listBios[index % listBios.length],
      birthDate: '19 Feb 1999',
      livesInDetail: index == 0
          ? 'Koregaon park\nPune, Maharashtra'
          : '$city, $state',
      prompt1Question: prompt1['q']!,
      prompt1Answer: prompt1['a']!,
      prompt2Question: prompt2['q']!,
      prompt2Answer: prompt2['a']!,
      education: 'NIFT Pune',
      educationDetail: 'B. Des Fashion Design · 3rd year',
      workAs: 'Fashion Design',
      workDetail: 'Freelance · 2 yrs exp',
      workStyle: 'Creative · Hybrid',
      ambitionLevel: 'HIGHLY DRIVEN',
      bigDream:
          'Launch her own sustainable Indian fashion label — handcrafted, slow fashion made with heart. Also wants to travel every fashion capital before 30.',
      interests: const [
        InterestItem(icon: '✈️', label: 'Travel'),
        InterestItem(icon: '☕', label: 'Coffee'),
        InterestItem(icon: '🏔️', label: 'Trekking'),
        InterestItem(icon: '📖', label: 'Books'),
        InterestItem(icon: '🧘', label: 'Yoga'),
        InterestItem(icon: '🎵', label: 'Indie music'),
        InterestItem(icon: '🍳', label: 'Cooking'),
        InterestItem(icon: '📷', label: 'Photography'),
      ],
      lifestyle: const {
        'Diet': 'Vegetarian',
        'Drinking': 'Socially',
        'Smoking': 'Non-smoker',
        'Fitness': 'Gym 4x/week\nYoga · Trekking',
        'Travel': '4–5 trips/year',
        'Pets': 'Cat parent',
        'Sleep': 'Night Owl',
      },
      datingGoalTitle: 'Long-term, marriage-open',
      datingGoalSubtitle:
          'No pressure, no timelines — just looking for the right person to build something real with.',
    );
  }
}
