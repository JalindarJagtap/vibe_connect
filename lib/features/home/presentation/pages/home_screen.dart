import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_colors.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';
import '../widgets/top_header_bar.dart';
import '../widgets/swipeable_profile_stack.dart';
import '../widgets/about_section.dart';
import '../widgets/basics_section.dart';
import '../widgets/language_communication_card.dart';
import '../widgets/video_intro_card.dart';
import '../widgets/prompt_card.dart';
import '../widgets/career_section.dart';
import '../widgets/secondary_photo_card.dart';
import '../widgets/interests_section.dart';
import '../widgets/lifestyle_section.dart';
import '../widgets/dating_goal_card.dart';
import '../widgets/user_shimmer_skeleton.dart';
import '../widgets/user_error_widget.dart';
import '../widgets/compliment_bottom_sheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading || state is HomeInitial) {
              return const UserShimmerSkeleton();
            } else if (state is HomeError) {
              return UserErrorWidget(
                message: state.message,
                onRetry: () {
                  context.read<HomeBloc>().add(const FetchUsersEvent());
                },
              );
            } else if (state is HomeLoaded) {
              final user = state.currentUser;

              return Column(
                children: [
                  // Fixed & Pinned Top Header Bar (Never scrolls away)
                  const TopHeaderBar(),

                  // Scrollable Profile Details Area
                  Expanded(
                    child: RefreshIndicator(
                      color: AppColors.primaryRose,
                      backgroundColor: Colors.white,
                      onRefresh: () async {
                        context.read<HomeBloc>().add(const RefreshUsersEvent());
                      },
                      child: CustomScrollView(
                        physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics(),
                        ),
                        slivers: [
                          // Main Profile Hero Card Stack with Rotation & Swipe Animation
                          SliverToBoxAdapter(
                            child: SwipeableProfileStack(
                              currentUser: user,
                              nextUser: state.currentIndex < state.users.length - 1
                                  ? state.users[state.currentIndex + 1]
                                  : null,
                              onSwipeLeft: () {
                                context.read<HomeBloc>().add(const NextProfileEvent());
                              },
                              onSwipeRight: () {
                                context.read<HomeBloc>().add(const NextProfileEvent());
                              },
                              onUndo: () {
                                context.read<HomeBloc>().add(const PreviousProfileEvent());
                              },
                              onMoreOptions: () {
                                _showOptionsBottomSheet(context);
                              },
                            ),
                          ),

                          // About Section
                          SliverToBoxAdapter(
                            child: AboutSection(
                              aboutBio: user.aboutBio,
                              userName: user.name,
                            ),
                          ),

                          // The Basics Section
                          SliverToBoxAdapter(
                            child: BasicsSection(
                              age: user.age,
                              birthDate: user.birthDate,
                              height: user.height,
                              livesIn: user.livesInDetail,
                            ),
                          ),

                          // Mother Tongue & Communication Style Card
                          if (user.motherTongue != null || user.communicationStyle != null)
                            SliverToBoxAdapter(
                              child: LanguageCommunicationCard(
                                motherTongue: user.motherTongue ?? 'Marathi',
                                communicationStyle:
                                    user.communicationStyle ?? 'Phone calls over texts',
                              ),
                            ),

                          // Video Intro Card (if available, show Video Intro with Play Button)
                          if (user.videoIntroUrl != null)
                            SliverToBoxAdapter(
                              child: VideoIntroCard(
                                videoThumbnailUrl: user.videoIntroUrl!,
                                duration: user.videoDuration ?? '0:28',
                                userName: user.name,
                              ),
                            )
                          else
                            SliverToBoxAdapter(
                              child: SecondaryPhotoCard(
                                photoUrl: user.secondaryPictureUrl,
                                onRoseTap: () {
                                  ComplimentBottomSheet.show(
                                    context,
                                    sectionTitle: 'Photo',
                                    userName: user.name,
                                  );
                                },
                              ),
                            ),

                          // Prompt 1 Card
                          SliverToBoxAdapter(
                            child: PromptCard(
                              question: user.prompt1Question,
                              answer: user.prompt1Answer,
                              userName: user.name,
                            ),
                          ),

                          // Career & Ambition Section
                          SliverToBoxAdapter(
                            child: CareerSection(
                              education: user.education,
                              educationDetail: user.educationDetail,
                              workAs: user.workAs,
                              workDetail: user.workDetail,
                              workStyle: user.workStyle,
                              ambitionLevel: user.ambitionLevel,
                              bigDream: user.bigDream,
                            ),
                          ),

                          // Prompt 2 Card
                          SliverToBoxAdapter(
                            child: PromptCard(
                              question: user.prompt2Question,
                              answer: user.prompt2Answer,
                              userName: user.name,
                            ),
                          ),

                          // Interests & Hobbies
                          SliverToBoxAdapter(
                            child: InterestsSection(interests: user.interests),
                          ),

                          // Lifestyle Section
                          SliverToBoxAdapter(
                            child: LifestyleSection(lifestyle: user.lifestyle),
                          ),

                          // Dating Goal Card
                          SliverToBoxAdapter(
                            child: DatingGoalCard(
                              title: user.datingGoalTitle,
                              subtitle: user.datingGoalSubtitle,
                            ),
                          ),

                          // Bottom Extra Padding for navigation bar
                          const SliverToBoxAdapter(
                            child: SizedBox(height: 24),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  void _showOptionsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.cardBackground,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.share_rounded, color: AppColors.textPrimary),
              title: const Text('Share Profile'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.block_rounded, color: Colors.orange),
              title: const Text('Hide Profile'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.report_problem_outlined, color: Colors.red),
              title: const Text('Report User'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
