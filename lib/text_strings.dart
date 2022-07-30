List<String> urduText = [];
List<String> arabicText = [];
List<String> audioPaths = [];
fillList() {
  for (int i = 1; i < 85; i++) {
    audioPaths.add("assets/audio_$i.m4a");
    arabicText.add(
        "بسم الللہ الرحمن الرحیم، اَلسَّلامُ عَلى آدَمَ صِفْوَةِ اللهِ مِنْ خَليقَتِهِ،");
    urduText
        .add("شروع اللہ کے نام سے جو بے حد مہرباں اور نہایت رحم کرنے والا ہے ");
  }
}
