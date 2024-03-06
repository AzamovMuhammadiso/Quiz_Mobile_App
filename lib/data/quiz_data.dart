class Quiz {
  String question;
  List<String> options;
  int correctIndex;

  Quiz({
    required this.question,
    required this.options,
    required this.correctIndex,
  });
}

List<Quiz> mathQuestions = [
  Quiz(
    question: 'What is 2 + 2?',
    options: ['3', '4', '5', '6'],
    correctIndex: 1,
  ),
  Quiz(
    question: 'What is 5 x 7?',
    options: ['30', '35', '40', '45'],
    correctIndex: 1,
  ),
  Quiz(
    question: 'What is the square root of 81?',
    options: ['7', '8', '9', '10'],
    correctIndex: 2,
  ),
  Quiz(
    question: 'If x = 3, what is 2x + 4?',
    options: ['8', '10', '12', '14'],
    correctIndex: 3,
  ),
  Quiz(
    question: 'What is 3/4 as a decimal?',
    options: ['0.25', '0.50', '0.75', '1.00'],
    correctIndex: 2,
  ),
  Quiz(
    question: 'What is the area of a rectangle with length 6 and width 4?',
    options: ['12', '18', '24', '30'],
    correctIndex: 2,
  ),
  Quiz(
    question: 'What is the next prime number after 17?',
    options: ['19', '20', '21', '22'],
    correctIndex: 0,
  ),
  Quiz(
    question: 'What is the value of pi (π) approximately?',
    options: ['2.71', '3.14', '3.50', '4.00'],
    correctIndex: 1,
  ),
  Quiz(
    question: 'Simplify: 2(x + 3) - 4',
    options: ['2x + 2', '2x + 6', '2x - 2', '2x - 6'],
    correctIndex: 1,
  ),
  Quiz(
    question: 'What is the smallest positive integer?',
    options: ['0', '1', '2', '3'],
    correctIndex: 1,
  ),
];


List<Quiz> englishQuestions = [
  Quiz(
    question: 'What is the plural form of "child"?',
    options: ['childs', 'child', 'children', 'childes'],
    correctIndex: 2,
  ),
  Quiz(
    question: 'Which of the following words is a synonym for "joy"?',
    options: ['sadness', 'happiness', 'anger', 'fear'],
    correctIndex: 1,
  ),
  Quiz(
    question: 'What is the past tense of "run"?',
    options: ['running', 'ran', 'runned', 'runs'],
    correctIndex: 1,
  ),
  Quiz(
    question: 'What is the opposite of "brave"?',
    options: ['cowardly', 'fearless', 'strong', 'kind'],
    correctIndex: 0,
  ),
  Quiz(
    question: 'Which word means the same as "tiny"?',
    options: ['large', 'huge', 'small', 'big'],
    correctIndex: 2,
  ),
  Quiz(
    question: 'What is the correct spelling?',
    options: ['happend', 'happened', 'happenned', 'happend'],
    correctIndex: 1,
  ),
  Quiz(
    question: 'Which of these is a pronoun?',
    options: ['run', 'apple', 'he', 'jump'],
    correctIndex: 2,
  ),
  Quiz(
    question: 'What is the main character of "Romeo and Juliet"?',
    options: ['Romeo', 'Juliet', 'Mercutio', 'Tybalt'],
    correctIndex: 0,
  ),
  Quiz(
    question: 'What is the opposite of "victory"?',
    options: ['defeat', 'win', 'success', 'achievement'],
    correctIndex: 0,
  ),
  Quiz(
    question: 'Which of the following is a preposition?',
    options: ['jumped', 'in', 'happy', 'dog'],
    correctIndex: 1,
  ),
];


List<Quiz> physicsQuestions = [
  Quiz(
    question: 'What is the SI unit of electric current?',
    options: ['Volt', 'Ampere', 'Ohm', 'Watt'],
    correctIndex: 1,
  ),
  Quiz(
    question: 'What force keeps planets in orbit around the sun?',
    options: ['Gravitational force', 'Magnetic force', 'Electrostatic force', 'Nuclear force'],
    correctIndex: 0,
  ),
  Quiz(
    question: 'Which color has the shortest wavelength in the visible spectrum?',
    options: ['Red', 'Blue', 'Green', 'Yellow'],
    correctIndex: 1,
  ),
  Quiz(
    question: 'What is the acceleration due to gravity on Earth?',
    options: ['9.8 m/s²', '1 m/s²', '5.6 m/s²', '12.3 m/s²'],
    correctIndex: 0,
  ),
  Quiz(
    question: 'What is the SI unit of capacitance?',
    options: ['Hertz', 'Watt', 'Ampere', 'Farad'],
    correctIndex: 3,
  ),
  Quiz(
    question: 'What type of energy does a moving car have?',
    options: ['Chemical energy', 'Thermal energy', 'Kinetic energy', 'Potential energy'],
    correctIndex: 2,
  ),
  Quiz(
    question: 'What is the speed of light in a vacuum?',
    options: ['300,000 km/s', '100,000 m/s', '3,000,000 m/s', '299,792,458 m/s'],
    correctIndex: 3,
  ),
  Quiz(
    question: 'What is the law of conservation of energy?',
    options: ['Energy can be created and destroyed', 'Energy cannot be created or destroyed', 'Energy can only be created', 'Energy can only be destroyed'],
    correctIndex: 1,
  ),
  Quiz(
    question: 'Which particle carries a positive electric charge?',
    options: ['Proton', 'Neutron', 'Electron', 'Photon'],
    correctIndex: 0,
  ),
  Quiz(
    question: 'What is the primary function of a concave lens?',
    options: ['To converge light', 'To diverge light', 'To block light', 'To absorb light'],
    correctIndex: 1,
  ),
];

