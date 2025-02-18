class StoryModel {
  String name;
  String profile;
  StoryModel({
    required this.name,
    required this.profile,
  });
}

List<StoryModel> dummyStories = [
  StoryModel(name: "Your story", profile: "profile"),
  StoryModel(name: "person", profile: "profile"),
  StoryModel(name: "person", profile: "profile"),
  StoryModel(name: "person", profile: "profile"),
  StoryModel(name: "person", profile: "profile"),
  StoryModel(name: "person", profile: "profile"),
];
