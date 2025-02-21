class NotesModel {
  String note;
  String? song;
  String? author;
  String userName;
  String profile;
  NotesModel({
    required this.note,
    required this.song,
    required this.userName,
    required this.profile,
    this.author,
  }) {
    // dummyNotes.insert(
    //   0,
    //   NotesModel(
    //     note: "note",
    //     song: "song",
    //     userName: "Your notes",
    //     profile: "profile",
    //   ),
    // );
    // for (var e in dummyStories) {
    //   dummyNotes.add(
    //     NotesModel(
    //       note: "note",
    //       song: " song",
    //       userName: e.name,
    //       profile: e.profile,
    //     ),
    //   );
    // }
  }
}

List<NotesModel> dummyNotes = [
  NotesModel(
    note: "Just vibing with some music 🎶",
    song: "Blinding Lights",
    userName: "Your notes",
    profile: "assets/images/alice.jpg",
    author: "The Weeknd",
  ),
  NotesModel(
    note: "Just vibing with some music 🎶",
    song: "Blinding Lights",
    userName: "Alice Johnson",
    profile: "assets/images/alice.jpg",
    author: "The Weeknd",
  ),
  NotesModel(
    note: "Feeling nostalgic ✨",
    song: "Bohemian Rhapsody",
    userName: "Bob Smith",
    profile: "assets/images/bob.jpg",
    author: "Queen",
  ),
  NotesModel(
    note: "Chilling with coffee ☕",
    song: "Someone Like You",
    userName: "Charlie Brown",
    profile: "assets/images/charlie.jpg",
    author: "Adele",
  ),
  NotesModel(
    note: "Late-night coding session 💻",
    song: "Lose Yourself",
    userName: "David White",
    profile: "assets/images/david.jpg",
    author: "Eminem",
  ),
  NotesModel(
    note: "Sunset vibes 🌅",
    song: "Perfect",
    userName: "Emma Wilson",
    profile: "assets/images/emma.jpg",
    author: "Ed Sheeran",
  ),
];
