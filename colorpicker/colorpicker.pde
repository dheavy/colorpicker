import java.util.*;

PImage img;
int xPos = 0;
int yPos = 0;
int[] colors;
Set<Integer> uniqueColors = new HashSet<Integer>();

void setup() {
  // Hard code dimensions of the loaded image. Not very elegant, I know.
  size(957, 565);
  noStroke();
  
  // Load image.
  img = loadImage("01.jpg");
  
  // Get number of pixels in image.
  int numOfPixels = img.width * img.height;
  
  for(int i = 0; i < numOfPixels; i++) {
    color c = img.pixels[i];
    
    // Add to discriminatory list (one occurence of each color only).
    uniqueColors.add(c);
  }
  
  // Inelegant, but efficient type conversion of elements in ArrayList
  // from Object to int (-> "color"s are in fact "int"s).
  ArrayList<Integer> tmpColors = new ArrayList<Integer>(uniqueColors);
  colors = new int[tmpColors.size()];
  for (int j = 0; j < colors.length; j++) {
   colors[j] = tmpColors.get(j);
  }
  
  // Sort colors out based on their numeric value.
  Arrays.sort(colors);
  
  // Create colored pattern to illustrate what we just did.
  for(color c : colors) {
    fill(c);
    
    if (xPos > img.width) {
      yPos++;
      xPos = 0;  
    }
    
    rect(xPos, yPos, 5, 5);
    xPos += 5;
  }
}
