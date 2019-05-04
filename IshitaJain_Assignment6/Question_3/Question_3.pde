PFont fnt;  
String sb;
int table_dim = 9; // table dimensions

void setup() {
  size(800, 800);
  noStroke();
  smooth();  // Step 3: Load Font
  noLoop();  // only draw once 
  fnt = loadFont( "ArialMT-48.vlw" );
  int il = 1;
  int jl = 1;
  int kl = 1;
  print("      ");
  while (kl < (table_dim + 1)) {  // print header row 
    // printf("%3i",kl);

    sb = nf(kl, 2);  // nf converts integer to string with 3 characters (weak version of printf)
    print(sb);  // Prints "040"
    print(" ");
    kl++;
  }
  print("\n-----");
  kl = 1;
  while (kl < (table_dim + 1)) {  // print separator
    print("----");
    kl++;
  }
  print("\n");
  while (il < (table_dim + 1)) {
    // printf("%3i",il); // print first entry of row 
    sb = nf(il, 2);
    print(sb);  // Prints "040"
    print(" | ");
    jl = 1;
    while (jl < (table_dim + 1)) {
      // printf("%3i", il*jl );
      sb = nf(il*jl, 3);
      print(sb);  // Prints "040"
      print(" ");
      jl++;
    }
    print("\n"); 
    il++;
  }
}

void draw() {
  background(255);
  textFont(fnt, 16); // Step 4: Specify font to be used
  fill(0);        // Step 5: Specify font color

  // Step 6: Display Text
  // text ( "Mmmmm ... Strings ..." ,10,100);
  int jl = 1;
  int il = 1;
  int kl = 1;
  print("      ");
  while (kl < (table_dim + 1)) {  // print header row at y = 50 
    // printf("%3i",kl);

    // sb = nf(kl, 3);
    sb = str(kl);
    fill(255, 0, 0);
    text (sb, 20+40*kl, 50);    
    kl++;
  }

  print("\n");
  while (il < (table_dim + 1)) {
    // printf("%3i",il); // print first entry of row 
    sb = nf(il, 3);
    fill(255, 0, 0);
    text (sb, 10, 40*il + 50 );    
    // print(" | ");
    jl = 1;
    fill(0); 
    while (jl < (table_dim + 1)) {
      // printf("%3i", il*jl );
      // sb = nf(il*jl, 3);
      sb = str(il*jl);
      text (sb, 20+40*jl, 40*il + 50 ); 
      jl++;
    }
    il++;
  }
}

