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
// Text angle: (only in Left-Right mode)
text_angle = 45; // [0:1:180]
// Top shape: (only in Left-Right mode)
text_shape = 0; // [0:Rectangle, 1:Circle, 2:Heart (sperimental)]
// Heart direction: (only in Left-Right mode)
text_heart_direction = 0; // [0: Left, 1: Right, 2: Middle]

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
// Select the base type: (in Left-Right mode Text is not supported)
base_type = 2; // [0:None, 1:Solid, 2:Text]
// The height of the base: (in mm)
base_height = 3.0; // [.2:.1:25]
// Base position correction on the X-axis: (in mm)
base_x_correction = 6.0; // [-100:.1:100]
// Base position correction on the Y-axis: (in mm)
base_y_correction = 0.0; // [-100:.1:100]
// Base position correction on the Z-axis: (in mm)
base_z_correction = 0.4; // [-100:.1:100]
// Base size correction: (in mm)
base_size_correction = 0.0; // [-100:.1:100]
// Heart size correction: (in mm, sperimental)
base_heart_size = 0.0; // [-100:.1:100]
// Heart X-axis position correction: (in mm, sperimental)
base_heart_x = 0.0; // [-100:.1:100]
// Heart Y-axis position correction: (in mm, sperimental)
base_heart_y = 0.0; // [-100:.1:100]

/* [Top] */
// Select the top plate type: (in Left-Right mode Text is not supported)
top_type = 0; // [0:None, 1:Solid, 2:Text]
// The height of the top: (in mm)
top_height = 3.0; // [.2:.1:25]
// Top position correction on the X-axis: (in mm)
top_x_correction = 6.0; // [-100:.1:100]
// Top position correction on the Y-axis: (in mm)
top_y_correction = 0.0; // [-100:.1:100]
// Top position correction on the Z-axis: (in mm)
top_z_correction = -0.6; // [-100:.1:100]
// Tope size correction: (in mm)
top_size_correction = 0.0; // [-100:.1:100]
// Heart size correction: (in mm, sperimental)
top_heart_size = 0.0; // [-100:.1:100]
// Heart X-axis position correction: (in mm, sperimental)
top_heart_x = 0.0; // [-100:.1:100]
// Heart Y-axis position correction: (in mm, sperimental)
top_heart_y = 0.0; // [-100:.1:100]

/* [Tweaks (fix things up)] */
// Curves quality
curves_quality = 30; // [10:Draft, 20:Printable draft, 30:Normal, 50:Good quality, 75:High quality, 100:Very high quality]
// Font magic ratio: (is the ratio between the height and the width of a single letter)
font_ratio = 1.33; // [.1:.01:3]

// ========================== //
// DON'T EDIT BELOW THIS LINE //
// ========================== //

module heart(radius = 0, height = 0) {
  linear_extrude(height = height, center = true)
  translate(v = [0, 1.5 * radius * sin(45) - 0.5 * radius, 0])
  union() {
    translate(v = [-radius * cos(45), 0, 0]) 
    rotate(a = -45)
    union() {
      circle(r = radius, $fn = curves_quality);
      translate(v = [0, -radius, 0]) 
      square(size = radius * 2);
    } // union
    mirror([1, 0, 0])
    translate(v = [-radius * cos(45), 0, 0]) 
    rotate(a = -45)
    union() {
      circle(r = radius, $fn = curves_quality);
      translate(v = [0, -radius, 0]) 
      square(size = radius * 2);
    } // union
  } // union
} // module heart

// Include all of these calculations inside a let so they don't appear in the parameters.
let() {
  // Precalculate things.
  max_len = max(len(text_right), len(text_left));

  text_width = max_len * font_size / font_ratio;
  text_depth = len(text_right) > len(text_left) ? font_size : font_size * len(text_left) / len(text_right);
  font_full = str(len(font_custom) > 0 ? font_custom : font_name, ":style=", font_style);

  text_left_rotation = text_mode == 0 ? [90, 0, text_angle] : [text_mode == 1 ? 90 : 45, 0, 0];
  text_right_rotation = text_mode == 0 ? [90, 0, -text_angle] : [0, 0, 0];
  text_top_align = text_mode != 0 ? "center" : "baseline";

  heart_size = text_width / (3 * sin(45) + 1) + base_heart_size;
  heart_rotation = text_heart_direction == 0 ? -text_angle : (text_heart_direction == 1 ? text_angle : 0);

  union() {
    difference() {
      intersection() {
        rotate(a = text_left_rotation)
        linear_extrude(height = text_depth * max_len, center = true)
        resize(newsize = [text_width, text_depth, 0])
        text(text = text_right, size = font_size, font = font_full, halign = "center", valign = "baseline", spacing = font_spacing, $fn = curves_quality);
        
        rotate(a = text_right_rotation)
        linear_extrude(height = text_depth * max_len, center = true)
        resize(newsize = [text_width, text_depth, 0])
        text(text = text_left, size = font_size, font = font_full, halign = "center", valign = text_top_align, spacing = font_spacing, $fn = curves_quality);

        if (text_shape == 0) {
          cube(size = [text_width * 2, font_size, font_size * 2], center = true);
        } else if (text_shape == 1) {
          cylinder(h = font_size * 2, d = text_width + base_size_correction, center = true, $fn = curves_quality);
        } else if (text_shape == 2) {
          rotate(a = heart_rotation)
          translate(v = [base_heart_x, base_heart_y, 0]) {
            heart(radius = heart_size, height = font_size * 2);
          } // translate
        }
      } // intersection
      
      // Remove the part that goes below the surface.
      translate(v = [0, 0, -(text_depth * max_len) / 2]) {
        if (text_shape == 0) {
          cube(size = [text_width * 2, font_size, text_depth * max_len], center = true);
        } else if (text_shape == 1) {
          cylinder(h = text_depth * max_len, d = (text_width + base_size_correction) * 2, center = true, $fn = curves_quality);
        } else if (text_shape == 2) {
          rotate(a = heart_rotation)
          translate(v = [base_heart_x, base_heart_y, 0]) {
            heart(radius = heart_size, height = text_depth * max_len);
          } // translate
        } // if (text_shape)
      } // translate
    } // difference
    
    if (base_type != 0) {
      
      translate(v = [text_mode == 0 ? base_x_correction : 0, base_y_correction, - base_height / 2 + base_z_correction]) {
        if (text_mode == 0) {
          if (text_shape == 0) {
            intersection() {
              // Create the base for left text.
              rotate(a = [0, 0, text_angle])
              cube(size = [text_width + base_size_correction, text_depth * max_len, base_height], center = true);
              
              // Intersect with the base for right text.
              rotate(a = [0, 0, -text_angle])
              cube(size = [text_width + base_size_correction, text_depth * max_len, base_height], center = true);
              
              // Slice it down to the correct depth.
              cube(size = [(text_width + base_size_correction) * 2, font_size, font_size], center = true);
            } // intersection
          } else if (text_shape == 1) {
            cylinder(h = base_height, d = text_width + base_size_correction, center = true, $fn = curves_quality);
          } else if (text_shape == 2) {
            rotate(a = heart_rotation)
            translate(v = [base_heart_x, base_heart_y, 0]) {
              heart(radius = heart_size, height = base_height);
            } // translate
          } // if (text_shape)
        } else { // text_mode != 0
          if (base_type == 1) {
            translate(v = [-text_width / 2 + base_x_correction / 2, -font_size / 2, -base_height / 2]) {
            cube(size = [text_width + base_width_correction, font_size, base_height]);
            } // translate
          } else {
            // Add a flat horizontal text at bottom.
            linear_extrude(height = base_height, center = true)
            resize(newsize = [text_width, text_depth, 0])
            text(text = text_left, size = font_size, font = font_full, halign = "center", valign = "center", spacing = font_spacing, $fn = curves_quality);
          } // if (base_type)
        } // if (text_mode)
      } // translate
    } // if (base_type)
    
    if (top_type != 0) {
        translate(v = [text_mode == 0 ? top_x_correction : 0, top_y_correction, font_size + top_height / 2 + top_z_correction]) {
        if (text_mode == 0) {
          if (text_shape == 0) {
            intersection() {
              // Create the top for left text.
              rotate(a = [0, 0, text_angle])
              cube(size = [text_width + top_size_correction, text_depth * max_len, top_height], center = true);
              
              // Intersect with the top for right text.
              rotate(a = [0, 0, -text_angle])
              cube(size = [text_width + top_size_correction, text_depth * max_len, top_height], center = true);
              
              // Slice it down to the correct depth.
              cube(size = [(text_width + top_size_correction) * 2, font_size, font_size], center = true);
            } // intersection
          } else if (text_shape == 1) {
            cylinder(h = top_height, d = text_width + top_size_correction, center = true, $fn = curves_quality);
          } else if (text_shape == 2) {
            rotate(a = heart_rotation)
            translate(v = [top_heart_x, top_heart_y, 0]) {
              heart(radius = heart_size, height = top_height);
            } // translate
          } // if (text_shape)
        } else { // text_mode != 0
          if (top_type == 1) {
            translate(v = [-text_width / 2 + top_x_correction / 2, -font_size / 2, font_size +top_height / 2]) {
            cube(size = [text_width + top_width_correction, font_size, top_height]);
            } // translate
          } else {
            // Add a flat horizontal text at bottom.
            linear_extrude(height = top_height, center = true)
            resize(newsize = [text_width, text_depth, 0])
            text(text = text_left, size = font_size, font = font_full, halign = "center", valign = "center", spacing = font_spacing, $fn = curves_quality);
          } // if (top_type)
        } // if (text_mode)
      } // translate
    } // if (top_type)
    
  } // union
} // let