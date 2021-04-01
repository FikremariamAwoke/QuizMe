class Stats {
  final int riddlesCorrectlyAnswered;
  final int riddlesTotalAnswered;
  final int generalKnowledgeCorrectlyAnswered;
  final int generalKnowledgeTotalAnswered;
  final int computerScienceCorrectlyAnswered;
  final int computerScienceTotalAnswered;
  final int geographyCorrectlyAnswered;
  final int geographyTotalAnswered;
  final int artCorrectlyAnswered;
  final int artTotalAnswered;
  final int sportCorrectlyAnswered;
  final int sportTotalAnswered;

  Stats(
      {this.riddlesCorrectlyAnswered,
      this.riddlesTotalAnswered,
      this.generalKnowledgeCorrectlyAnswered,
      this.generalKnowledgeTotalAnswered,
      this.computerScienceCorrectlyAnswered,
      this.computerScienceTotalAnswered,
      this.geographyCorrectlyAnswered,
      this.geographyTotalAnswered,
      this.artCorrectlyAnswered,
      this.artTotalAnswered,
      this.sportCorrectlyAnswered,
      this.sportTotalAnswered});
  bool isEmpty() {
    if (riddlesTotalAnswered == null &&
        generalKnowledgeTotalAnswered == null &&
        computerScienceTotalAnswered == null &&
        geographyTotalAnswered == null &&
        artTotalAnswered == null &&
        sportTotalAnswered == null) return true;
    return false;
  }
}
