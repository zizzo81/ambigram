// Ambigram generator.scad
// https://github.com/zizzo81/ambigram
// Author: Christian Cristofori <github@christiancristofori.it>
// License: MIT license
//
// Thanks goes to:
// @Stephanos (https://makerworld.com/en/@Stephanos) - for the complete list of fonts and styles supported by MakerWorld.

/* [Texts] */
// Text visible from left side: (top side in Front-Top and 45° front-Top mode)
text_left = "SUSANNA";
// Text visible from right side: (front side in Front-Top and 45° front-Top mode)
text_right = "CHRISTIAN";
// Working mode:
text_mode = 0; // [0:Left-Right, 1:Front-Top, 2:45° front-Top]
// Text angle: (only in Left/Right mode)
text_angle = 45; // [0:1:180]

/* [Font] */
// Font:
font_name = "Merriweather Sans"; // [Liberation Mono, Liberation Sans, Liberation Sans Narrow, Liberation Serif,Harmony OS Sans,Inter,Inter Tight,Lora,Merriweather Sans,Montserrat,Noto Emoji,Noto Sans,Noto Sans Adlam,Noto Sans Adlam Unjoined,Noto Sans Arabic,Noto Sans Arabic UI,Noto Sans Armenian,Noto Sans Balinese,Noto Sans Bamum,Noto Sans Bassa Vah,Noto Sans Bengali,Noto Sans Bengali UI,Noto Sans Canadian Aboriginal,Noto Sans Cham,Noto Sans Cherokee,Noto Sans Devanagari,Noto Sans Display,Noto Sans Ethiopic,Noto Sans Georgian,Noto Sans Gujarati,Noto Sans Gunjala Gondi,Noto Sans Gurmukhi,Noto Sans Gurmukhi UI,Noto Sans HK,Noto Sans Hanifi Rohingya,Noto Sans Hebrew,Noto Sans JP,Noto Sans Javanese,Noto Sans KR,Noto Sans Kannada,Noto Sans Kannada UI,Noto Sans Kawi,Noto Sans Kayah Li,Noto Sans Khmer,Noto Sans Khmer UI,Noto Sans Lao,Noto Sans Lao Looped,Noto Sans Lao UI,Noto Sans Lisu,Noto Sans Malayalam,Noto Sans Malayalam UI,Noto Sans Medefaidrin,Noto Sans Meetei Mayek,Noto Sans Mono,Noto Sans Myanmar,Noto Sans NKo Unjoined,Noto Sans Nag Mundari,Noto Sans New Tai Lue,Noto Sans Ol Chiki,Noto Sans Oriya,Noto Sans SC,Noto Sans Sinhala,Noto Sans Sinhala UI,Noto Sans Sora Sompeng,Noto Sans Sundanese,Noto Sans Symbols,Noto Sans Syriac,Noto Sans Syriac Eastern,Noto Sans TC,Noto Sans Tai Tham,Noto Sans Tamil,Noto Sans Tamil UI,Noto Sans Tangsa,Noto Sans Telugu,Noto Sans Telugu UI,Noto Sans Thaana,Noto Sans Thai,Noto Sans Thai UI,Noto Sans Vithkuqi,Nunito,Nunito Sans,Open Sans,Open Sans Condensed,Oswald,Playfair Display,Plus Jakarta Sans,Raleway,Roboto,Roboto Condensed,Roboto Flex,Roboto Mono,Roboto Serif,Roboto Slab,Rubik,Source Sans 3,Ubuntu Sans,Ubuntu Sans Mono,Work Sans]
// Custom font: (enter font name, overrides above setting)
font_custom = "";
// Style: (not all styles work will all fonts)
font_style = "Bold"; // [Regular,Bold,Medium,SemiBold,Light,ExtraBold,Black,ExtraLight,Thin,Bold Italic,Italic,Light Italic,Medium Italic]
// Size: (in mm)
font_size = 20.0; // [1:.1:72]
// Letters spacing:
font_spacing = 0.75; // [.1:.01:5]

/* [Base] */
// Select the base type: (in Left-Right mode text is not supported)
base_type = 2; // [0:None, 1:Solid, 2:Text]
// The height of the base: (in mm)
base_height = 3.0; // [.2:.1:25]
// Base position correction on the X-axis: (in mm)
base_x_correction = 6.0; // [-100:.1:100]
// Base position correction on the Y-axis: (in mm)
base_y_correction = 0.0; // [-100:.1:100]
// Base position correction on the Z-axis: (in mm)
base_z_correction = 0.4; // [-100:.1:100]
// Base position correction on the Z-axis: (in mm)
base_width_correction = 0.0; // [-100:.1:100]

/* [Tweaks (fix things up)] */
// Curves quality
curves_quality = 30; // [10:Draft, 20:Printable draft, 30:Normal, 100:High quality]
// Font magic ratio: (is the ratio between the height and the width of a single letter)
font_ratio = 1.33; // [.1:.01:3]

// ========================== //
// DON'T EDIT BELOW THIS LINE //
// ========================== //

// Include all of these calculations inside a let so they don't appear in the parameters.
let() {
  // Precalculate things.
  max_len = max(len(text_right), len(text_left));

  text_width = max_len * font_size / font_ratio;
  text_depth = len(text_right) > len(text_left) ? font_size : font_size * len(text_left) / len(text_right);
  font_full = str(len(font_custom) > 0 ? font_custom : font_name, ":style=", font_style);

  text_left_rotation = text_mode == 0 ? [90, 0, text_angle] : [text_mode == 1 ? 90 : 45, 0, 0];
  text_right_rotation = text_mode == 0 ? [90, 0, -text_angle] : [0, 0, 0];

  union() {
    intersection() {
      rotate(a = text_left_rotation)
      linear_extrude(height = text_depth * max_len, center = true)
      resize(newsize = [text_width, text_depth, 0])
      text(text = text_right, size = font_size, font = font_full, halign = "center", valign = "center", spacing = font_spacing, $fn = curves_quality);
      
      rotate(a = text_right_rotation)
      linear_extrude(height = text_depth * max_len, center = true)
      resize(newsize = [text_width, text_depth, 0])
      text(text = text_left, size = font_size, font = font_full, halign = "center", valign = "center", spacing = font_spacing, $fn = curves_quality);

      cube(size = [text_width * 2, font_size, font_size], center = true);
    } // intersection
    
    if (base_type != 0) {
      
      translate(v = [text_mode == 0 ? base_x_correction : 0, base_y_correction, -font_size / 2 - base_height / 2 + base_z_correction]) {
        if (text_mode == 0) {
          intersection() {
            // Create the base for left text.
            rotate(a = [0, 0, text_angle])
            cube(size = [text_width + base_width_correction, text_depth * max_len, base_height], center = true);
            
            // Intersect with the base for right text.
            rotate(a = [0, 0, -text_angle])
            cube(size = [text_width + base_width_correction, text_depth * max_len, base_height], center = true);
            
            // Slice it down to the correct depth.
            cube(size = [(text_width + base_width_correction) * 2, font_size, font_size], center = true);
          } // intersection
        
        } else { // text_mode != 0
          if (base_type == 1) {
            translate([-text_width / 2 + base_x_correction / 2, -font_size / 2, -base_height / 2]) {
            cube([text_width + base_width_correction, font_size, base_height]);
            } // translate
          } else {
            // Add a flat horizontal text at bottom.
            linear_extrude(height = base_height, center = true)
            resize(newsize = [text_width, text_depth, 0])
            text(text = text_left, size = font_size, font = font_full, halign = "center", valign = "center", spacing = font_spacing, $fn = curves_quality);
          } // if (base_type == 0)
        } // if (text_mode)
      } // translate
    } // if (create_base)
  } // union
} // let