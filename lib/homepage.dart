// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_login1/lyricspage.dart';
import 'login_screen.dart';


class HomePage extends StatelessWidget {
  final List<Map<String, String>> songs = [

    {
      'title': 'Perfect',
      'lyrics': '''
      I found a love for me
      Oh, darling, just dive right in and follow my lead
      Well, I found a girl, beautiful and sweet
      Oh, I never knew you were the someone waitin' for me
      'Cause we were just kids when we fell in love, not knowin' what it was
      I will not give you up this time
      Oh, darling, just kiss me slow, your heart is all I own
      And in your eyes, you're holding mine
      Baby, I'm dancin' in the dark with you between my arms
      Barefoot on the grass while listenin' to our favourite song
      When you said you looked a mess, I whispered underneath my breath
      But you heard it, "Darling, you look perfect tonight"
      Well, I found a woman, stronger than anyone I know
      She shares my dreams, I hope that someday, I'll share her home
      I found a love to carry more than just my secrets
      To carry love, to carry children of our own
      We are still kids, but we're so in love, fightin' against all odds
      I know we'll be alright this time
      Darling, just hold my hand, be my girl, I'll be your man
      I see my future in your eyes
      Oh, baby, I'm dancin' in the dark with you between my arms
      Barefoot on the grass while listenin' to our favourite song
      When I saw you in that dress, lookin' so beautiful
      I don't deserve this, darling, you look perfect tonight
      No, no, no
      Mm, oh
      Baby, I'm dancin' in the dark with you between my arms
      Barefoot on the grass, oh, listenin' to our favourite song
      I have faith in what I see, now I know I have met
      An angel in person, and she looks perfect
      Though I don't deserve this, you look perfect tonight
      ''',
      'file': 'Perfect.mp3',
    },

    {
      'title': 'Binibini',
      'lyrics': '''Kay ganda mo binibini
        Tuwing ika'y nakangiti nang dahil sakin
        Tingnan mo ang kalangitan pininturahan dinisenyuhan (dinisenyuhan)
        O ang sarap mong kasama
        Para bang wala nang bukas pa
        Orasan gumagalaw kay bilis
        Kapag ika'y aking kasama
        Orasan gumagalaw kay bilis
        Kapag ika'y aking kasama
        Halika na sumama sakin
        San man tayo dalhin ng mga paa natin
        Tingnan mo ang kalangitan pininturahan dinisenyuhan (dinisenyuhan)
        O ang sarap mong kasama
        Para bang wala nang bukas pa
        Orasan gumagalaw kay bilis
        Kapag ika'y aking kasama
        Orasan gumagalaw kay bilis
        Kapag ika'y aking kasama
      ''',
      'file': 'Binibini.mp3',
    },

    {
      'title': 'Ngiti',
      'lyrics': '''Nakatingin sa salamin
        Ang dami nang nagbago sa ‘kin (Sa ‘kin)
        ‘Di na gano’n kabigat
        Tumama na ang lahat
        Nakahanap na ng katapat, woah

        ‘Di ko inakala, na may makikilala
        Sa ‘di inaasahang pagkakataon
        Napapangiti na naman ako
        At ikaw ang dahilan nito
        Bumabalik ang kulay ng aking mundo
        Napapangiti na naman ako
        Napapangiti na naman ako
        At ikaw ang dahilan nito
        Bumabalik ang kulay ng aking mundo
        Napapangiti na naman ako, oh-woah

        Minsan na rin akong sumuko
        Sa lungkot din ako’y nalunod (Oh)
        Kalimutan ang nakaraan
        Meron nang bagong dahilan
        Habangbuhay kang sasamahan, woah

        ‘Di ko inakala, na may makikilala
        Sa ‘di inaasahang pagkakataon

        Napapangiti na naman ako
        At ikaw ang dahilan nito
        Bumabalik ang kulay ng aking mundo
        Napapangiti na naman ako
        Napapangiti na naman ako
        At ikaw ang dahilan nito
        Bumabalik ang kulay ng aking mundo
        Napapangiti na naman ako, oh-woah
      ''',
      'file': 'Ngiti.mp3',
    },

    {
      'title': 'Sagip',
      'lyrics': '''Handa akong manatili
        Hanggang sa'yong pagkalma
        Magsisilbing lakas mo
        Tuwing nanghihina ka
        Patatahanin kita kapag
        May problema ka
        Dadamayan ka sa lahat
        Aking sinta
        Kahit ga'no man kalalim
        Ay akin yang lalanguyin
        Kahit ga'no man kalalim
        Ay akin yang lalanguyin
        Sasagipin kita
        Sasagipin kita
        Sasagipin
        Sasagipin kita
        Handa akong manatili
        Hanggang sa'yong pagkalma
        Magsisilbing lakas mo
        Tuwing nanghihina ka
        Patatahanin kita kapag
        May problema ka
        Dadamayan ka sa lahat
        Aking sinta
        Kahit ga'no man kalalim
        Ay akin yang lalanguyin
        Kahit ga'no man kalalim
        Ay akin yang lalanguyin
        Sasagipin kita (Sasagipin)
        Sasagipin kita (Sasagipin)
        Sasagipin
        Sasagipin kita
        Handa akong manatili
        Hanggang sa'yong pagkalma
        Magsisilbing lakas mo
        Tuwing nanghihina ka
        Patatahanin kita kapag
        May problema ka
        Gagabayan ka sa lahat mahal kita
      ''',
      'file': 'Sagip.mp3',
    },

    {
      'title': 'Your Universe',
      'lyrics': '''Tell me something
      When the rain falls on my face
      How do you quickly replace it
      With a golden summer smile?
      Tell me something
      When I'm feelin' tired and afraid
      How do you know just what to say
      To make everything alright?
      I don't think that you even realize
      The joy you make me feel when I'm inside your universe
      You hold me like I'm the one who's precious
      I hate to break it to you, but it's just the other way around
      You can thank your stars all you want
      But I'll always be the lucky one
      Tell me something
      When I'm 'bout to lose control
      How do you patiently hold my hand
      And gently calm me down?
      Tell me something
      When you sing and when you laugh
      Why do I always photograph
      My heart flying way above the clouds?
      I don't think that you even realize
      The joy you make me feel when I'm inside your universe
      You hold me like I'm the one who's precious
      I hate to break it to you, but it's just the other way around
      You can thank your stars all you want
      But I'll always be the lucky one
      Whoa, ooh
      Whoa, ooh
      Whoa, ooh, ooh
      I don't think that you even realize
      The joy you make me feel when I'm inside your universe
      You hold me like I'm the one who's precious
      I hate to break it to you, but it's just the other way around
      You can thank your stars all you want
      But I'll always be the lucky one
      You can thank your stars all you want
      But I'll always be the lucky one
      I'll always be the lucky one
      I'll always be the lucky one
      ''',
      'file': 'YourUniverse.mp3',
    },

    {
      'title': 'My Kind Of Woman',
      'lyrics': '''Oh, baby
        Oh, man
        You're making me crazy
        Really driving me mad
        That's alright with me
        It's really no fuss
        As long as you're next to me
        Just the two of us
        You're my, my, my
        My kind of woman
        My, oh, my
        What a girl
        You're my, my, my
        My kind of woman
        And I'm down on my hands and knees
        Begging you please, baby
        Show me your world
        Oh, brother
        Sweetheart
        I'm feeling so tired
        Really falling apart
        And it just don't make sense to me
        I really don't know
        Why you stick right next to me
        Wherever I go
        You're my, my, my
        My kind of woman
        My, oh, my
        What a girl
        You're my, my, my
        My kind of woman
        And I'm down on my hands and knees
        Begging you please, baby
        Show me your world
      ''',
      'file': 'mykindofwoman.mp3',
    },

    {
      'title': 'Ill Be',
      'lyrics': '''The strands in your eyes that color them wonderful
        Stop me, and steal my breath
        And emeralds from mountains, the thrust towards the sky
        Never revealing their depth
        And tell me that we belong together
        Dress it up with the trappings of love
        I'll be captivated, I'll hang from your lips
        Instead of the gallows of heartache that hang from above
        And I'll be your cryin' shoulder
        I'll be love's suicide
        And I'll be better when I'm older
        I'll be the greatest fan of your life
        And rain falls, angry on the tin roof
        As we lie awake in my bed
        And you're my survival, you're my living proof
        My love is alive and not dead
        And tell me that we belong together
        Dress it up with the trappings of love
        I'll be captivated, I'll hang from your lips
        Instead of the gallows of heartache that hang from above
        And I'll be your cryin' shoulder
        I'll be love's suicide
        And I'll be better when I'm older
        I'll be the greatest fan of your life
        Well, I've dropped out
        I've burned up
        I've fought my way back from the dead
        Tuned in
        Turned on
        Remembered the things that you said
        And I'll be your cryin' shoulder
        I'll be love's suicide
        And I'll be better when I'm older
        I'll be the greatest fan of your
        And I'll be your cryin' shoulder
        I'll be love's suicide
        And I'll be better when I'm older
        I'll be the greatest fan of your life
        The greatest fan of your life
      ''',
      'file': 'IllBe.mp3',
    },

    {
      'title': 'No1 Party Athem',
      'lyrics': '''So you're on the prowl wondering whether
        She left already or not
        Leather jacket, collar popped like Cantona
        Never knowing when to stop
        Sunglasses indoor is par for the course
        Lights in the floors and sweat on the walls
        Cages and poles
        Call off the search for your soul
        Or put it on hold again
        She's having a sly indoor smoke
        And she calls the folks who run this, her oldest friends
        Sipping a drink and laughing at imaginary jokes
        As all the signals are sent, her eyes invite you to approach
        And it seems as though those lumps in your throat
        That you just swallowed have got you going
        Come on, come on, come on
        Come on, come on, come on
        Number one party anthem
        She's a certified mind blower
        Knowing full, well, that I don't
        May suggest there's somewhere from which I might know her
        Just to get the ball to roll
        Drunken monologues, confused because
        It's not like I'm falling in love, I just want ya
        To do me no good
        And you look like you could
        Come on, come on, come on
        Come on, come on, come on
        Number one party anthem
        Come on, come on, come on
        Before the moment's gone
        Number one party anthem, yeah, yeah
        The look of love, the rush of blood
        The "She's with me" is the Gallic shrug
        The shutterbugs, the Camera Plus
        The black and white and the color dodge
        The good time girls, the cubicles
        The house of fun, the number one
        Party anthem, oh
        Come on, come on, come on
        Come on, come on, come on
        Come on, come on, come on
        Come on, come on, come on
        Before the moment's gone
        Number one party anthem
        Number one party anthem
        Number one party anthem
        Yeah, yeah
      ''',
      'file': 'no1partyanthem.mp3',
    },

    {
      'title': 'Creep',
      'lyrics': '''When you were here before
        Couldn't look you in the eye
        You're just like an angel
        Your skin makes me cry

        You float like a feather
        In a beautiful world
        I wish I was special
        You're so fucking special

        But I'm a creep, I'm a weirdo
        What the hell am I doing here?
        I don't belong here

        I don't care if it hurts
        I want to have control
        I want a perfect body
        I want a perfect soul

        I want you to notice
        When I'm not around
        You're so fucking special
        I wish I was special

        But I'm a creep, I'm a weirdo
        What the hell am I doing here?
        I don't belong here

        She's running out the door
        She's running
        She run, run, run, run
        Run

        Whatever makes you happy
        Whatever you want
        You're so fucking special
        I wish I was special

        But I'm a creep, I'm a weirdo
        What the hell am I doing here?
        I don't belong here
        I don't belong here
      ''',
      'file': 'Creep.mp3',
    },

    {
      'title': 'Sorry Na',
      'lyrics': '''Sorry na kung nagalit ka
        'Di naman sinasadya
        Kung may nasabi man ako, init lang ng ulo
        Pipilitin kong magbago, pangako sa iyo
        Sorry na, nakikinig ka ba?
        Malamang sawa ka na
        Sa ugali kong ito na ayaw magpatalo
        At parang sirang tambutso na hindi humihinto
        Sorry na talaga kung ako'y medyo tanga
        Hindi ako nag-iisip, nauuna ang galit
        Sorry na talaga sa aking nagawa
        Tanggap ko na mali ako, 'wag sanang magtampo, sorry na
        Sorry na, 'wag kang madadala
        Alam kong medyo nahihirapan ka
        Ang ibigin ang isang katulad kong parang timang
        Na paulit-ulit kang hindi sadyang nasasaktan
        Sorry na, saan ka pupunta?
        Please naman, 'wag kang mawawala
        Kapag ako ay iwan mo, mamamatay ako
        'Pagkat hawak mo sa iyong kamay ang puso ko
        Sorry na talaga kung ako'y medyo tanga
        Hindi ako nag-iisip, nauuna ang galit
        Sorry na talaga sa aking nagawa
        Tanggap ko na mali ako, 'wag sanang magtampo, sorry na
        Sorry na
        Mahal kita, sobrang mahal kita
        Wala na 'kong pwedeng sabihin pang iba
        Kundi sorry talaga, 'di ko sinasadya
        Talagang sobrang mahal kita, 'wag kang mawawala, sorry na
      ''',
      'file': 'SorryNa.mp3',
    },
  ];
  
  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text(
        '🎵 Song Lyrics Display',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.grey.shade50.withOpacity(0.8),
      elevation: 1,
      shadowColor: Colors.grey.shade300,
      iconTheme: const IconThemeData(color: Colors.black),
      actions: [
        TextButton(
          onPressed: () {
            _showLogoutDialog(context);
          },
          child: const Text(
            "Logout",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
      flexibleSpace: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade50.withOpacity(0.6),
        ),
      ),
    ),

    body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/Music-Core-Wallpaper.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: ListView.builder(
        itemCount: songs.length,
        itemBuilder: (context, index) {
          final song = songs[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            color: Colors.white.withOpacity(0.85), // semi-transparent for image to show
            elevation: 1.5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: Icon(
                Icons.music_note,
                color: Colors.grey.shade800,
              ),
              title: Text(
                song['title']!,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: Colors.grey.shade600,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LyricsPage(
                      title: song['title']!,
                      lyrics: song['lyrics']!,
                      audioFile: song['file']!,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    ),
  );
}
  

  // ==========================
  // 🔐 Logout Confirmation
  // ==========================
  void _showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text(
          "Confirm Logout",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: const Text("Are you sure you want to logout?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // close dialog
              Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginScreen(), // <-- Use your login widget class
              ),
            );
            },
            child: const Text(
              "Logout",
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      );
    },
  );
}
}
