PImage img;
ArrayList<String> codes;
void setup() {
  codes = new ArrayList<String>();
  img = loadImage("image.gif");
  img.loadPixels();
  size(400,400);
  image(img, 0, 0);
  int last = img.pixels[0];
  boolean overflow = false;
  int acc = 0;
  for (int i = 0; i < img.width*img.height; i++) {
    if ( img.pixels[i] == last) {
      if (overflow) {
        codes.add(",0x" + hex(acc,2).toString());
        overflow = false;
      }
      acc++;
      if (acc > 254) {
        codes.add(",0x" + hex(acc,2).toString());
        overflow = true;
        acc = 0;
      }
    }
    else {
      codes.add(",0x" + hex(acc,2).toString());
      last = img.pixels[i];
      overflow = false;
      acc = 0;
      acc++;
    }
  }
  
  String[] finalText = new String[codes.size()+2];
  finalText[0] = "const common::uint8_t g_image[" + codes.size() + "] = {";
  for (int i = 0; i < codes.size(); i++) {
    finalText[i+1] = codes.get(i);
  }
  finalText[codes.size()+1] = "}";
  saveStrings("image.txt", finalText);
}
