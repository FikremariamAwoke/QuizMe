class QuestionData {
  final int id;
  final String question, correctAnswer;
  final String category;
  List<String> answers;

  QuestionData(
      {this.id,
      this.question,
      this.category,
      this.correctAnswer,
      this.answers});
}

// "Tricky & Brain Riddles" category questions
const riddles = [
  {
    "id": 1,
    "category": "Tricky & Brain Riddles",
    "question":
        "I am a mother's child and a father's child but nobody's son. What am I?",
    "correct_answer": "A daughter",
    "incorrect_answers": ["A grandson", "A father", "An uncle"]
  },
  {
    "id": 2,
    "category": "Tricky & Brain Riddles",
    "question": "16 - 4 / (1/4) + 2 = ?",
    "correct_answer": "2",
    "incorrect_answers": ["6", "17", "5"]
  },
  {
    "id": 3,
    "category": "Tricky & Brain Riddles",
    "question":
        "when I get multiplied by any number, the sum of the figures in the product is always me. What am I?",
    "correct_answer": "9",
    "incorrect_answers": ["8", "2", "4"]
  },
  {
    "id": 4,
    "category": "Tricky & Brain Riddles",
    "question": "How would one say goodbye in Spanish?",
    "correct_answer": "Adios",
    "incorrect_answers": [" Hola", "Au Revoir", "Salir"]
  },
  {
    "id": 5,
    "category": "Tricky & Brain Riddles",
    "question": "what ten letter word starts with gas?",
    "correct_answer": "Automobile",
    "incorrect_answers": ["Retirement", "Aberration", "Television"]
  },
  {
    "id": 6,
    "category": "Tricky & Brain Riddles",
    "question":
        "I was 13 years old in 1870 and 8 years old in 1875. How is this possible?",
    "correct_answer": "The dates are in BC",
    "incorrect_answers": [
      "The dates are in AC",
      "1875 was a leap year",
      "1870 began on the vernal equinox"
    ]
  },
  {
    "id": 7,
    "category": "Tricky & Brain Riddles",
    "question":
        "What flies when it's born, lies when it is alive, and runs when it's dead?",
    "correct_answer": "A snowflake",
    "incorrect_answers": ["A grain of sand", "An eaglet", "A fruit fly"]
  },
  {
    "id": 8,
    "category": "Tricky & Brain Riddles",
    "question": "If POST is 1234 and FLIRT is 56784, what is FROST?",
    "correct_answer": "58234",
    "incorrect_answers": ["43285", "58243", "52384"]
  },
  {
    "id": 9,
    "category": "Tricky & Brain Riddles",
    "question":
        "I start with M, end with X, and have never ending amount of letters. what am I?",
    "correct_answer": "Mailbox",
    "incorrect_answers": ["Mix", "Multiplex", "Matrix"]
  },
  {
    "id": 10,
    "category": "Tricky & Brain Riddles",
    "question":
        "I weigh 98 pounds plus half my own weight. How much do I weigh?",
    "correct_answer": "196",
    "incorrect_answers": ["128", "192", "184"]
  },
  {
    "id": 11,
    "category": "Tricky & Brain Riddles",
    "question": "In Roman Numerals, how many hours are in a day?",
    "correct_answer": "XXIV",
    "incorrect_answers": ["XXVI", "XXIL", "XIXV"]
  },
  {
    "id": 12,
    "category": "Tricky & Brain Riddles",
    "question":
        "What comes once in a minute, twice in a moment, but never in a thousand years?",
    "correct_answer": "The letter 'M'",
    "incorrect_answers": [
      "Thirty-one seconds",
      "1/1000",
      "One-tenth of a century"
    ]
  },
  {
    "id": 13,
    "category": "Tricky & Brain Riddles",
    "question": "What is 3/7 chicken, 2/3 cat and 2/4 goat?",
    "correct_answer": "Chicago",
    "incorrect_answers": ["Childbirth", "Chiffon", "Chipmunk"]
  },
  {
    "id": 14,
    "category": "Tricky & Brain Riddles",
    "question":
        "I am a 7 letter word. I become longer when my third letter is removed. Who am I?",
    "correct_answer": "Lounger",
    "incorrect_answers": ["Longing", "Lengthy", "Longine"]
  },
  {
    "id": 15,
    "category": "Tricky & Brain Riddles",
    "question": "Which word best expresses the meaning of: 'Reassure'?",
    "correct_answer": "Hearten",
    "incorrect_answers": ["Proffer", "Induce", "Submit"]
  },
  {
    "id": 16,
    "category": "Tricky & Brain Riddles",
    "question":
        "A painting and a sculpture cost \$1500 in total. The painting costs \$1,000 more than the sculpture. How much does the sculpture cost?",
    "correct_answer": "\$250",
    "incorrect_answers": ["\$400", "\$450", "\$200"]
  }
];
