import 'package:flutter/material.dart';
import 'package:phresident/customs/appbar/appbar.dart';
import 'package:phresident/navigator.dart';
import 'package:phresident/themes/themes.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    String bullet = "\u2022 ";
    return WillPopScope(
      onWillPop: () async {
        AppNavigator().pop(context);
        return false;
      },
      child: Scaffold(
        appBar: const CustomAppbar(
            title: 'About', hasLeftIcon: false, hasRightIcon: false),
        body: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: spacingL,
            vertical: spacingM,
          ),
          children: [
            Text('About', style: headingM),
            Text(
              '"PHresident," is an innovative educational quiz app designed to engage users in an immersive learning experience about the historical and contemporary leaders of the Philippines. The app aims to enhance users knowledge of Philippine presidential history, fostering a deeper understanding of the political landscape and contributing to civic education. ',
              style: paragraphM,
              textAlign: TextAlign.justify,
            ),
            const Divider(),
            Text('Creators', style: headingS),
            Text('$bullet Sagaral Jessa Marie - leader', style: headingS),
            Text('$bullet Ricafort Jomari', style: headingS),
            Text('$bullet Salaveria Michael', style: headingS),
            Text('$bullet Romero Keith', style: headingS),
            Text('$bullet Salangsang Garado', style: headingS),
            Text('$bullet Subaan Vhejay', style: headingS),
            const Divider(),
            Text('Source', style: headingM),
            Text('Emilio Aguinaldo', style: headingS),
            InkWell(
                child: Text(
                    '$bullet https://philpad.com/presidents-philippines-achievements-contributions/?expand_article=1',
                    style: paragraphS),
                onTap: () => launchUrlString(
                    'https://philpad.com/presidents-philippines-achievements-contributions/?expand_article=1')),
            InkWell(
              child: Text(
                '$bullet https://www.biography.com/political-figures/emilio-aguinaldo',
                style: paragraphS,
              ),
              onTap: () => launchUrlString(
                  'https://www.biography.com/political-figures/emilio-aguinaldo'),
            ),
            InkWell(
              child: Text(
                '$bullet https://kidskonnect.com/people/emilio-aguinaldo/',
                style: paragraphS,
              ),
              onTap: () => launchUrlString(
                  'https://kidskonnect.com/people/emilio-aguinaldo/'),
            ),
            const Divider(),
            Text('Manuel Luis Quezon', style: headingS),
            InkWell(
              child: Text(
                '$bullet https://en.wikipedia.org/wiki/Manuel_L._Quezon',
                style: paragraphS,
              ),
              onTap: () => launchUrlString(
                  'https://en.wikipedia.org/wiki/Manuel_L._Quezon'),
            ),
            InkWell(
              child: Text(
                '$bullet https://philpad.com/presidents-philippines-achievements-contributions/?expand_article=1',
                style: paragraphS,
              ),
              onTap: () => launchUrlString(
                  'https://philpad.com/presidents-philippines-achievements-contributions/?expand_article=1'),
            ),
            InkWell(
              child: Text(
                '$bullet https://www.britannica.com/biography/Manuel-Quezon',
                style: paragraphS,
              ),
              onTap: () => launchUrlString(
                  'https://www.britannica.com/biography/Manuel-Quezon'),
            ),
            const Divider(),
            Text('José Paciano Laurel y García', style: headingS),
            InkWell(
              child: Text(
                '$bullet https://en.wikipedia.org/wiki/Jose_P._Laurel',
                style: paragraphS,
              ),
              onTap: () => launchUrlString(
                  'https://en.wikipedia.org/wiki/Jose_P._Laurel'),
            ),
            InkWell(
              child: Text(
                '$bullet https://kami.com.ph/108485-jose-p-laurel-biography-quotes-political-philosophy-education.html',
                style: paragraphS,
              ),
              onTap: () => launchUrlString(
                  'https://kami.com.ph/108485-jose-p-laurel-biography-quotes-political-philosophy-education.html'),
            ),
            const Divider(),
            Text('Sergio Osmeña Sr.', style: headingS),
            InkWell(
              child: Text(
                '$bullet https://www.britannica.com/biography/Sergio-Osmena',
                style: paragraphS,
              ),
              onTap: () => launchUrlString(
                  'https://www.britannica.com/biography/Sergio-Osmena'),
            ),
            InkWell(
              child: Text(
                '$bullet https://en.wikipedia.org/wiki/Sergio_Osme%C3%B1a',
                style: paragraphS,
              ),
              onTap: () => launchUrlString(
                  'https://en.wikipedia.org/wiki/Sergio_Osme%C3%B1a'),
            ),
            InkWell(
              child: Text(
                '$bullet https://philpad.com/presidents-philippines-achievements-contributions/?expand_article=1',
                style: paragraphS,
              ),
              onTap: () => launchUrlString(
                  'https://philpad.com/presidents-philippines-achievements-contributions/?expand_article=1'),
            ),
            const Divider(),
            Text('Manuel A. Roxas', style: headingS),
            InkWell(
              child: Text(
                '$bullet https://en.wikipedia.org/wiki/Manuel_Roxas',
                style: paragraphS,
              ),
              onTap: () =>
                  launchUrlString('https://en.wikipedia.org/wiki/Manuel_Roxas'),
            ),
            InkWell(
              child: Text(
                '$bullet https://philpad.com/presidents-philippines-achievements-contributions/?expand_article=1',
                style: paragraphS,
              ),
              onTap: () => launchUrlString(
                  'https://philpad.com/presidents-philippines-achievements-contributions/?expand_article=1'),
            ),
            const Divider(),
            Text('Elpidio R. Quirino ', style: headingS),
            InkWell(
              child: Text(
                '$bullet https://en.wikipedia.org/wiki/Elpidio_Quirino',
                style: paragraphS,
              ),
              onTap: () => launchUrlString(
                  'https://en.wikipedia.org/wiki/Elpidio_Quirino'),
            ),
            const Divider(),
            Text('Ramon del Fierro Magsaysay Sr.', style: headingS),
            InkWell(
              child: Text(
                '$bullet https://philpad.com/presidents-philippines-achievements-contributions/?expand_article=1',
                style: paragraphS,
              ),
              onTap: () => launchUrlString(
                  'https://philpad.com/presidents-philippines-achievements-contributions/?expand_article=1'),
            ),
            InkWell(
              child: Text(
                '$bullet https://en.wikipedia.org/wiki/Ramon_Magsaysay',
                style: paragraphS,
              ),
              onTap: () => launchUrlString(
                  'https://en.wikipedia.org/wiki/Ramon_Magsaysay'),
            ),
            const Divider(),
            Text('Carlos P. Garcia ', style: headingS),
            InkWell(
              child: Text(
                '$bullet https://philpad.com/presidents-philippines-achievements-contributions/?expand_article=1',
                style: paragraphS,
              ),
              onTap: () => launchUrlString(
                  'https://philpad.com/presidents-philippines-achievements-contributions/?expand_article=1'),
            ),
            InkWell(
              child: Text(
                '$bullet https://en.wikipedia.org/wiki/Carlos_P._Garcia',
                style: paragraphS,
              ),
              onTap: () => launchUrlString(
                  'https://en.wikipedia.org/wiki/Carlos_P._Garcia'),
            ),
            const Divider(),
            Text('Diosdado P. Macapagal ', style: headingS),
            InkWell(
              child: Text(
                '$bullet https://philpad.com/presidents-philippines-achievements-contributions/?expand_article=1',
                style: paragraphS,
              ),
              onTap: () => launchUrlString(
                  'https://philpad.com/presidents-philippines-achievements-contributions/?expand_article=1'),
            ),
            InkWell(
              child: Text(
                '$bullet https://en.wikipedia.org/wiki/Diosdado_Macapagal',
                style: paragraphS,
              ),
              onTap: () => launchUrlString(
                  'https://en.wikipedia.org/wiki/Diosdado_Macapagal'),
            ),
            const Divider(),
            Text('Ferdinand Emmanuel Edralin Marcos Sr. ', style: headingS),
            InkWell(
              child: Text(
                '$bullet https://philpad.com/presidents-philippines-achievements-contributions/?expand_article=1',
                style: paragraphS,
              ),
              onTap: () => launchUrlString(
                  'https://philpad.com/presidents-philippines-achievements-contributions/?expand_article=1'),
            ),
            InkWell(
              child: Text(
                '$bullet https://en.wikipedia.org/wiki/Ferdinand_Marcos',
                style: paragraphS,
              ),
              onTap: () => launchUrlString(
                  'https://en.wikipedia.org/wiki/Ferdinand_Marcos'),
            ),
            const Divider(),
            Text('Maria Corazon Sumulong Cojuangco-Aquino', style: headingS),
            InkWell(
              child: Text(
                '$bullet https://philpad.com/presidents-philippines-achievements-contributions/?expand_article=1',
                style: paragraphS,
              ),
              onTap: () => launchUrlString(
                  'https://philpad.com/presidents-philippines-achievements-contributions/?expand_article=1'),
            ),
            InkWell(
              child: Text(
                '$bullet https://en.wikipedia.org/wiki/Corazon_Aquino',
                style: paragraphS,
              ),
              onTap: () => launchUrlString(
                  'https://en.wikipedia.org/wiki/Corazon_Aquino'),
            ),
            const Divider(),
            Text('Fidel V. Ramos', style: headingS),
            InkWell(
              child: Text(
                '$bullet https://philpad.com/presidents-philippines-achievements-contributions/?expand_article=1',
                style: paragraphS,
              ),
              onTap: () => launchUrlString(
                  'https://philpad.com/presidents-philippines-achievements-contributions/?expand_article=1'),
            ),
            InkWell(
              child: Text(
                '$bullet https://en.wikipedia.org/wiki/Fidel_V._Ramos',
                style: paragraphS,
              ),
              onTap: () => launchUrlString(
                  'https://en.wikipedia.org/wiki/Fidel_V._Ramos'),
            ),
            const Divider(),
            Text('Joseph Estrada', style: headingS),
            InkWell(
              child: Text(
                '$bullet https://philpad.com/presidents-philippines-achievements-contributions/?expand_article=1',
                style: paragraphS,
              ),
              onTap: () => launchUrlString(
                  'https://philpad.com/presidents-philippines-achievements-contributions/?expand_article=1'),
            ),
            InkWell(
              child: Text(
                '$bullet https://en.wikipedia.org/wiki/Joseph_Estrada',
                style: paragraphS,
              ),
              onTap: () => launchUrlString(
                  'https://en.wikipedia.org/wiki/Joseph_Estrada'),
            ),
            const Divider(),
            Text('Maria Gloria Macaraeg Macapagal Arroyo', style: headingS),
            InkWell(
              child: Text(
                '$bullet https://philpad.com/presidents-philippines-achievements-contributions/?expand_article=1',
                style: paragraphS,
              ),
              onTap: () => launchUrlString(
                  'https://philpad.com/presidents-philippines-achievements-contributions/?expand_article=1'),
            ),
            InkWell(
              child: Text(
                '$bullet https://en.wikipedia.org/wiki/Gloria_Macapagal_Arroyo',
                style: paragraphS,
              ),
              onTap: () => launchUrlString(
                  'https://en.wikipedia.org/wiki/Gloria_Macapagal_Arroyo'),
            ),
            const Divider(),
            Text('Benigno Aquino III', style: headingS),
            InkWell(
              child: Text(
                '$bullet https://philpad.com/presidents-philippines-achievements-contributions/?expand_article=1',
                style: paragraphS,
              ),
              onTap: () => launchUrlString(
                  'https://philpad.com/presidents-philippines-achievements-contributions/?expand_article=1'),
            ),
            InkWell(
              child: Text(
                '$bullet https://en.wikipedia.org/wiki/Benigno_Aquino_III',
                style: paragraphS,
              ),
              onTap: () => launchUrlString(
                  'https://en.wikipedia.org/wiki/Benigno_Aquino_III'),
            ),
            const Divider(),
            Text('Rodrigo Roa Duterte', style: headingS),
            InkWell(
              child: Text(
                '$bullet https://philpad.com/presidents-philippines-achievements-contributions/?expand_article=1',
                style: paragraphS,
              ),
              onTap: () => launchUrlString(
                  'https://philpad.com/presidents-philippines-achievements-contributions/?expand_article=1'),
            ),
            InkWell(
              child: Text(
                '$bullet https://en.wikipedia.org/wiki/Rodrigo_Duterte',
                style: paragraphS,
              ),
              onTap: () => launchUrlString(
                  'https://en.wikipedia.org/wiki/Rodrigo_Duterte'),
            ),
            const Divider(),
            Text('Ferdinand "Bongbong" Romualdez Marcos Jr.', style: headingS),
            InkWell(
              child: Text(
                '$bullet https://philpad.com/presidents-philippines-achievements-contributions/?expand_article=1',
                style: paragraphS,
              ),
              onTap: () => launchUrlString(
                  'https://philpad.com/presidents-philippines-achievements-contributions/?expand_article=1'),
            ),
            InkWell(
              child: Text(
                '$bullet https://en.wikipedia.org/wiki/Bongbong_Marcos',
                style: paragraphS,
              ),
              onTap: () => launchUrlString(
                  'https://en.wikipedia.org/wiki/Bongbong_Marcos'),
            ),
            const Divider(),
            Text('Images', style: headingS),
            Text('$bullet www.britannica.com', style: paragraphS),
            Text('$bullet www.officialgazette.gov.ph/', style: paragraphS),
            Text('$bullet en.wikipedia.org', style: paragraphS),
            Text('$bullet aralingpinoy.blogspot.com', style: paragraphS),
            Text('$bullet www.flickr.com', style: paragraphS),
            Text('$bullet upload.wikimedia.org', style: paragraphS),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
