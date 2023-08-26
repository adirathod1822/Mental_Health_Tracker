class QuestionModel {
  String? question;
  String? keyword;
  Map<String, int>? answers;
  QuestionModel(this.question, this.keyword, this.answers);
}
// ['Age', 'Gender', 'family_history', 'benefits', 'care_options', 'anonymity', 'leave', 'work_interfere']
List<QuestionModel> questions = [
  QuestionModel(
    "What is your age?",
    "age",
    {
      "0-20": 18,
      "20-40": 30,
      "40-60": 50,
      "60-80": 70,
      " 80-100": 90,
    },
  ),
  QuestionModel('What is your gender?', "gender", {
    'Male': 1,
    'Female': 0,
    'other':2,
  }),
  QuestionModel(
    'Do you have a family history of mental illness?', "family_history", {
    'Yes': 1,
    'No': 0,
  }),
  QuestionModel(
    'Does your employer provide mental health benefits?', "benefits", {
    'Yes': 2,
    "Don't know": 0,
    "No": 1,
  }),

  QuestionModel(
    'Do you know the options for mental health care your employer provides?',
    "care_options", {
    'Yes': 2,
    'No': 0,
    'Not Sure': 1,
  }),
  QuestionModel(
    'Is your anonymity protected if you choose to take advantage of mental health or substance abuse treatment?',
    "anonymity", {
    'Yes': 2,
    "Don't know": 0,
    "No": 1,
  }),
  QuestionModel(
    'How easy is it for you to take medical leave for a mental health condition?',
    "leave", {
    "Somewhat easy": 2,
    "Don't know": 0,
    "Somewhat difficult": 1,
    "Very easy": 4,
    "Very difficult": 3,
  }),
  QuestionModel(
    'If you have a mental health condition, do you feel that it interferes with your work?',
    "work_interfere", {
    'Sometimes': 4,
    'Rarely': 3,
    'Often': 2,
    'Never': 1,
    "Don't know": 0,
  }),
  QuestionModel(
    'Have you sought treatment for a mental health condition?', "treatment", {
    'Yes': 1,
    "No": 0,
  }),
  QuestionModel(
    'Do you feel overwhelmed by your work?', "workload", {
    'Yes': 0,
    "No": 1,
    'Sometimes': 2,
    'Often': 3,
  }),
  QuestionModel(
    'Have you ever been to a mental health wellness program?', "wellness_program", {
    'Yes': 1,
    "No": 0,
  }),

];

