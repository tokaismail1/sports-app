class Team {
  final String teamName;
  final String teamLogo;

  Team({required this.teamName, required this.teamLogo});

  factory Team.fromJson(Map<String, dynamic> json) {
    print('Team logo URL: ${json['team_logo']}');
    return Team(
      teamName: json['team_name'] ?? "",
      teamLogo: json['team_logo']?? "",
    );
  }
}
