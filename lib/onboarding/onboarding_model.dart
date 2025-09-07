class OnboardingItem {
  final String image;
  final String title;
  final String description;

  OnboardingItem({
    required this.image,
    required this.title,
    required this.description,
  });
}

List<OnboardingItem> onboardingItems = [
  OnboardingItem(
    image: 'assets/1.png',
    title: 'Discover Luxury Fragrances',
    description: 'Explore our exclusive collection of premium perfumes from world-renowned brands.',
  ),
  OnboardingItem(
    image: 'assets/onboarding2.png',
    title: 'Personalized Experience',
    description: 'Find your perfect scent with our personalized fragrance recommendations.',
  ),
  OnboardingItem(
    image: 'assets/onboarding3.png',
    title: 'Start Your Journey',
    description: 'Join thousands of fragrance enthusiasts who trust us for their luxury perfume needs.',
  ),
];