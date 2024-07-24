class Team {
  final int teamKey;
  final String teamName;
  final String teamLogo;

  Team({
    required this.teamKey,
    required this.teamName,
    required this.teamLogo,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    print('Team JSON: $json');
    return Team(
      teamKey: json['team_key'] ?? 0, // Adjust field names as necessary
      teamName: json['team_name'] ?? "",
      teamLogo: json['team_logo'] ?? "",
    );
  }
}
