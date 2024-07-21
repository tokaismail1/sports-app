class TopScorer {
  final String playerName;
  final int goals;

  TopScorer({required this.playerName, required this.goals});

  factory TopScorer.fromJson(Map<String, dynamic> json) {
    return TopScorer(
      playerName: json['player_name']?? "",
      goals: json['goals']?? "",
    );
  }
}
