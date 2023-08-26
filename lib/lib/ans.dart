import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

List<int> answers = [];
bool googleAlreadylogged = false;
List username = [];
List lastans = [];
List<String> vtitle = [
  "There's no shame in taking care of your mental health",
  'Mental Health for All by Involving All',
  'Your words may predict your future mental health',
  'Why students should have mental health days',
  'Mental Health Care That Disrupts Cycles of Violence',
  'Wendy Suzuki: The brain-changing benefits of exercise',
  'How sleep affects your emotions | Sleeping with Science'
];
List<String> vlink = [
  'https://www.youtube.com/watch?v=BvpmZktlBFs',
  'https://youtu.be/yzm4gpAKrBk',
  'https://youtu.be/uTL9tm7S1Io',
  'https://youtu.be/1qq7lDL-bzY',
  'https://youtu.be/lGkh7-xOb3I',
  'https://youtu.be/BHY0FxzoKZE',
  'https://youtu.be/6F8wFkScnME',
];

class docdetails {
  String? name;
  String? specialization;
  String? Experience;
  String? location;
  String? image;
  
  docdetails(this.name, this.specialization, this.Experience, this.location,this.image);
}

List<docdetails> doc = [
  docdetails("Dr Gorav Gupta", "MBBS MD - Psychiatry", "22 Years of Experience",
      "Andheria Morde, Mehrauli, Delhi-NCR","https://medmonks.com/home/img/doctors/1560488323.jpg"),
  docdetails("Dr Samir Parikh", "MBBS MD - Psychiatry", "18 Years of Experience",
      "A Block, Shalimar Bagh, Delhi-NCR","https://medmonks.com/home/img/doctors/1548676310.jpeg"),
  docdetails("Dr Sameer Malhotra", "HOD - Mental Health & Behavioral Sciences", "22 Years of Experience",
      "Andheria Morde, Mehrauli, Delhi-NCR","https://medmonks.com/home/img/doctors/1548737264.jpeg"),
  docdetails("Dr. Timir C. Shah", "MBBS MD - Psychiatry", "22 Years of Experience",
      "Block no 84 Canal Road, Palsana","https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png"),
];

Map<String, String> blog = {
  "topic": "data",
  "topic": "data",
  "topic": "data",
};

Map<String, String> moods = {
  'Happy': 'assets/images/emoji/happy.png',
  'Excited': 'assets/images/emoji/excited.png',
  'Moodless': 'assets/images/emoji/not happy.png',
  'Bossy': 'assets/images/emoji/imTheBoss.png',
  'Sad': 'assets/images/emoji/sad.png',
  'Angry': 'assets/images/emoji/angry.png',
  'Confused': 'assets/images/emoji/confused.png',
  'Bored': 'assets/images/emoji/bored.png',
  'Crying': 'assets/images/emoji/crying.png',
};
void launchURL(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }


class BlogPost {
  final String title;
  final String description;
  final String websiteUrl;

  BlogPost({
    required this.title,
    required this.description,
    required this.websiteUrl,
  });
}

class BlogPage extends StatelessWidget {
  final List<BlogPost> blogPosts = [
    BlogPost(
      title: 'Releasing Fascia: A Simple Way to Reduce Tension, Pain, and Disease',
      description: '“Take care of your body, it’s the only place you have to live.” ~Jim Rohn',
      websiteUrl: 'https://tinybuddha.com/blog/releasing-fascia-a-simple-way-to-reduce-tension-pain-and-disease/',
    ),
    BlogPost(
      title: '4 Things to Try When You Want Change but Don’t Know What to Do',
      description: '“If you get stuck, draw with a different pen. Change your tools; it may free your thinking.” ~Paul Arden',
      websiteUrl: 'https://tinybuddha.com/blog/4-things-to-try-when-you-want-change-but-dont-know-what-to-do/',
    ), BlogPost(
      title: 'Learning to Have Faith That All Is Well',
      description: '“If you believe it will work out, you’ll see opportunities. If you believe it won’t, you will see obstacles.” ~Wayne Dyer',
      websiteUrl: 'https://tinybuddha.com/blog/learning-to-have-faith-that-all-is-well/',
    ), BlogPost(
      title: 'How I Stopped Worrying About What Others Think of Me',
      description: '“Live your life for you not for anyone else. Don’t let the fear of being judged, rejected or disliked stop you from being yourself.” ~Sonya Parker',
      websiteUrl: 'https://tinybuddha.com/blog/how-i-stopped-worrying-about-what-others-think-of-me/',
    ), BlogPost(
      title: '5 Ways to Explore the World and Feel Excited About Life',
      description: '"Keep away from people who try to belittle your ambitions. Small people always do that, but the really great make you feel that you, too, can become great." - Mark Twain',
      websiteUrl: 'https://tinybuddha.com/blog/5-ways-to-explore-the-world-and-feel-excited-about-life/',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 282,
                width: MediaQuery.of(context).size.width,

        
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: blogPosts.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(bottom:8.0),
                child: Container(
                  height: 150,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 183, 197, 255),
                  border: Border.all(
                    color: Colors.white,
                    // backgroundColor = Color.fromARGB(255, 221, 208, 255),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                  child: ListTile(
                    title: Text(blogPosts[index].title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w800),),
                    subtitle: Text(blogPosts[index].description,textAlign: TextAlign.justify,style: TextStyle(fontSize: 15,),),
                    onTap: () {
                      launchURL(Uri.parse(blogPosts[index].websiteUrl));
                    },
                  ),
                ),
              );
            },
          ),
        ),

    );
  }

}








  class fdate extends StatefulWidget {
  @override
  State<fdate> createState() => _fdateState();
}

class _fdateState extends State<fdate> {
         String _currentDate = '';

  String _currentTime = '';

  @override
  void initState() {

    _getCurrentDate();
    _getCurrentTime();
    super.initState();
  }

  void _getCurrentDate() {
    final now = DateTime.now();
    final formatter = DateFormat('EEEE');
    final formattedDate = formatter.format(now);
    setState(() {
      _currentDate = formattedDate;
    });
  }

  void _getCurrentTime() {
    final now = DateTime.now();
    final formatter = DateFormat('HH:mm:ss');
    final formattedTime = formatter.format(now);
    setState(() {
      _currentTime = formattedTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(_currentDate);
  }
}