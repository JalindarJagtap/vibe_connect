import 'package:equatable/equatable.dart';

class InterestItem extends Equatable {
  final String icon;
  final String label;

  const InterestItem({required this.icon, required this.label});

  @override
  List<Object?> get props => [icon, label];
}

class UserProfile extends Equatable {
  final String id;
  final String name;
  final int age;
  final String pictureUrl;
  final String secondaryPictureUrl;
  final String? videoIntroUrl;
  final String? videoDuration;
  final String? motherTongue;
  final String? communicationStyle;
  final String city;
  final int distanceKm;
  final String occupation;
  final String height;
  final String relationshipGoal;
  final int matchPercentage;
  final int trustPercentage;
  final String replyTime;
  final String aboutBio;
  final String birthDate;
  final String livesInDetail;
  final String prompt1Question;
  final String prompt1Answer;
  final String prompt2Question;
  final String prompt2Answer;
  final String education;
  final String educationDetail;
  final String workAs;
  final String workDetail;
  final String workStyle;
  final String ambitionLevel;
  final String bigDream;
  final List<InterestItem> interests;
  final Map<String, String> lifestyle;
  final String datingGoalTitle;
  final String datingGoalSubtitle;

  const UserProfile({
    required this.id,
    required this.name,
    required this.age,
    required this.pictureUrl,
    required this.secondaryPictureUrl,
    this.videoIntroUrl,
    this.videoDuration,
    this.motherTongue,
    this.communicationStyle,
    required this.city,
    required this.distanceKm,
    required this.occupation,
    required this.height,
    required this.relationshipGoal,
    required this.matchPercentage,
    required this.trustPercentage,
    required this.replyTime,
    required this.aboutBio,
    required this.birthDate,
    required this.livesInDetail,
    required this.prompt1Question,
    required this.prompt1Answer,
    required this.prompt2Question,
    required this.prompt2Answer,
    required this.education,
    required this.educationDetail,
    required this.workAs,
    required this.workDetail,
    required this.workStyle,
    required this.ambitionLevel,
    required this.bigDream,
    required this.interests,
    required this.lifestyle,
    required this.datingGoalTitle,
    required this.datingGoalSubtitle,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        age,
        pictureUrl,
        secondaryPictureUrl,
        videoIntroUrl,
        videoDuration,
        motherTongue,
        communicationStyle,
        city,
        distanceKm,
        occupation,
        height,
        relationshipGoal,
        matchPercentage,
        trustPercentage,
        replyTime,
        aboutBio,
        birthDate,
        livesInDetail,
        prompt1Question,
        prompt1Answer,
        prompt2Question,
        prompt2Answer,
        education,
        educationDetail,
        workAs,
        workDetail,
        workStyle,
        ambitionLevel,
        bigDream,
        interests,
        lifestyle,
        datingGoalTitle,
        datingGoalSubtitle,
      ];
}
