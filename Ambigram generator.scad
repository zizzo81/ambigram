// Ambigram generator.scad
// https://github.com/zizzo81/ambigram
// Author: Christian Cristofori <github@christiancristofori.it>
// License: MIT license
//
// Thanks goes to:
// @Stephanos (https://makerworld.com/en/@Stephanos) - for the complete list of fonts and styles supported by MakerWorld.

/* [Texts] */
// Text visible from left side in Left-Right mode and top side in Front-Top and 45° front-Top mode:
text_1 = "SUSANNA";
// Text visible from right side in Left-Right mode and front side in Front-Top and 45° front-Top mode:
text_2 = "CHRISTIAN";
// Working mode:
text_mode = 0; // [0:Left-Right, 1:Front-Top, 2:45° front-Top]
// How to render texts:
render_engine = 1; // [0:v1.0 - legacy, 1:v2.0 - NEW! produces a cleaner object]
// Text angle: (only in Left-Right mode)
text_angle = 45; // [0:1:180]
// Top shape: (only in Left-Right mode)
text_shape = 3; // [0:Rectangle, 1:Circle, 2:Heart, 3:Rounded rectangle]
// The percentage of roundness in Rounded rectangle shape:
text_roundness = 50.0; // [0:0.1:100]
// Heart direction: (only in Left-Right mode)
text_heart_direction = 0; // [0: Left, 1: Right, 2: Middle]

/* [Font] */
// Font:
font_name = "Merriweather Sans"; // [Liberation Mono, Liberation Sans, Liberation Sans Narrow, Liberation Serif,Harmony OS Sans,Inter,Inter Tight,Lora,Merriweather Sans,Montserrat,Noto Emoji,Noto Sans,Noto Sans Adlam,Noto Sans Adlam Unjoined,Noto Sans Arabic,Noto Sans Arabic UI,Noto Sans Armenian,Noto Sans Balinese,Noto Sans Bamum,Noto Sans Bassa Vah,Noto Sans Bengali,Noto Sans Bengali UI,Noto Sans Canadian Aboriginal,Noto Sans Cham,Noto Sans Cherokee,Noto Sans Devanagari,Noto Sans Display,Noto Sans Ethiopic,Noto Sans Georgian,Noto Sans Gujarati,Noto Sans Gunjala Gondi,Noto Sans Gurmukhi,Noto Sans Gurmukhi UI,Noto Sans HK,Noto Sans Hanifi Rohingya,Noto Sans Hebrew,Noto Sans JP,Noto Sans Javanese,Noto Sans KR,Noto Sans Kannada,Noto Sans Kannada UI,Noto Sans Kawi,Noto Sans Kayah Li,Noto Sans Khmer,Noto Sans Khmer UI,Noto Sans Lao,Noto Sans Lao Looped,Noto Sans Lao UI,Noto Sans Lisu,Noto Sans Malayalam,Noto Sans Malayalam UI,Noto Sans Medefaidrin,Noto Sans Meetei Mayek,Noto Sans Mono,Noto Sans Myanmar,Noto Sans NKo Unjoined,Noto Sans Nag Mundari,Noto Sans New Tai Lue,Noto Sans Ol Chiki,Noto Sans Oriya,Noto Sans SC,Noto Sans Sinhala,Noto Sans Sinhala UI,Noto Sans Sora Sompeng,Noto Sans Sundanese,Noto Sans Symbols,Noto Sans Syriac,Noto Sans Syriac Eastern,Noto Sans TC,Noto Sans Tai Tham,Noto Sans Tamil,Noto Sans Tamil UI,Noto Sans Tangsa,Noto Sans Telugu,Noto Sans Telugu UI,Noto Sans Thaana,Noto Sans Thai,Noto Sans Thai UI,Noto Sans Vithkuqi,Nunito,Nunito Sans,Open Sans,Open Sans Condensed,Oswald,Playfair Display,Plus Jakarta Sans,Raleway,Roboto,Roboto Condensed,Roboto Flex,Roboto Mono,Roboto Serif,Roboto Slab,Rubik,Source Sans 3,Ubuntu Sans,Ubuntu Sans Mono,Work Sans]
// Custom font: (enter font name, overrides above setting)
font_custom = "";
// Style: (not all styles work will all fonts)
font_style = "Bold"; // [None,Regular,Bold,Medium,SemiBold,Light,ExtraBold,Black,ExtraLight,Thin,Bold Italic,Italic,Light Italic,Medium Italic]
// Size: (in mm)
font_size = 20.0; // [1:.1:72]
// Characters spacing:
font_spacing = 0.75; // [.1:.01:5]

/* [Base] */
// Select the base type: (in Left-Right mode Text is not supported)
base_type = 2; // [0:None, 1:Solid, 2:Text]
// The height of the base: (in mm)
base_height = 3.0; // [.2:.1:25]
// Base position correction on the X-axis: (in mm)
base_x_correction = 0.0; // [-100:.1:100]
// Base position correction on the Y-axis: (in mm)
base_y_correction = 0.0; // [-100:.1:100]
// Base position correction on the Z-axis: (in mm)
base_z_correction = 0.4; // [-100:.1:100]
// Base size correction: (in mm)
base_size_correction = 0.0; // [-100:.1:100]
// Heart size correction: (in mm, experimental)
base_heart_size = 0.0; // [-100:.1:100]
// Heart X-axis position correction: (in mm, experimental)
base_heart_x = 0.0; // [-100:.1:100]
// Heart Y-axis position correction: (in mm, experimental)
base_heart_y = 0.0; // [-100:.1:100]

/* [Top] */
// Select the top plate type: (in Left-Right mode Text is not supported)
top_type = 0; // [0:None, 1:Solid, 2:Text]
// The height of the top: (in mm)
top_height = 3.0; // [.2:.1:25]
// Top position correction on the X-axis: (in mm)
top_x_correction = 0.0; // [-100:.1:100]
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
// Font magic ratio: (is the ratio between the height and the width of a single character)
font_ratio = 1.33; // [.1:.01:3]
// Small characters: (this is the list of the characters that will be considered small and merged with others)
small_characters = "!()1I[]fijlt{|}";
// When encountering one of the above characters applies this ratio to the depth of the solid:
small_characters_ratio = 0.30; // [.01:.01:3]
// Spaces are converted to a thin solid, this is the ratio between a normal character depth and the depth of the solid that replaces a space.
space_ratio = 0.10; // [.01:.01:3]

// ========================== //
// DON'T EDIT BELOW THIS LINE //
// ========================== //

/* [*Hidden*] */
// Returns true if the given character is to be considered a small character as included in the small_characters parameter.
function is_small_character(c = "") = len(chr([for (i = [0:1:len(small_characters) - 1]) ord(small_characters[i] == c ? "1" : "")]));

// Evenly distributes leading and trailing spaces to a string until it reaches the given length.
function add_trailing_spaces(s = "", l = 0) = len(s) >= l ? s : 
chr([for (i = [-ceil((l - len(s)) / 2):1:len(s) + (l - len(s)) - ceil((l - len(s)) / 2)]) ord(i < 0 || i >= len(s) ? " " : s[i])]);

// Converts a single hexadecimal char to it's decimal value, returns -1 if conversion failed because given character is not a valid hexadecimal character.
function hex_char(c = "") = (c == "" ? -1 : (
      let(v = ord(c[0])) (
        v >= 48 && v <= 57 ? v - 48 : (
          v >= 65 && v <= 70 ? v - 55 : (
            v >= 97 && v <= 102 ? v - 87 : -1
          )
        )
      )
    ));

function internal_hex_sum(v, i = 0, r = 0) = i < len(v) ? (v[i] < 0 ? -1 : internal_hex_sum(v = v, i = i + 1, r = r + v[i])) : r;
    
function internal_hex_to_int(s = "") = [for (i = [0:1:len(s) - 1]) hex_char(c = s[i]) < 0 ? -1 : (16 ^ (len(s) - i - 1) * hex_char(c = s[i]))];

// Converts an hexadecimal string to it's decimal value, returns -1 if given string is not a valid hexadecimal value.
function hex_to_int(s = "") = internal_hex_sum(v = internal_hex_to_int(s = s), i = 0, r = 0);

// Takes a portion of a string as a string copy of the subportion given start index and length.
function sub_str(t = "", s = 0, l = 0) = chr([for (i = [s:1:s + l - 1]) ord(t[i])]);

function internal_escape_explode(s = "", i = 0) = i < len(s) ? (
    s[i] == "\\" ? (
    (
      // has enough space
      (i + 1 < len(s)) &&
      // another slash
      (s[i + 1] == "\\")
    ) ? str("\\", internal_escape_explode(s = s, i = i + 2)) :
      (
        // has enough space
        (i + 3 < len(s)) && 
        // is "hex"
        (s[i + 1] == "x") &&
        // is hex value
        (hex_to_int(s = sub_str(t = s, s = i + 2, l = 2)) >= 0)
      ) ? str(chr(hex_to_int(sub_str(s, i + 2, 2))), internal_escape_explode(s, i + 4)) : (
        (
          // has enough space
          (i + 5 < len(s)) && 
          // is "unicode" with 4 digits
          (s[i + 1] == "u") &&
          // is hex value
          (hex_to_int(s = sub_str(t = s, s = i + 2, l = 4)) >= 0)
        ) ? str(chr(hex_to_int(sub_str(s, i + 2, 4))), internal_escape_explode(s, i + 6)) : (
          (
            // has enough space
            (i + 7 < len(s)) && 
            // is "unicode" with 46 digits
            (s[i + 1] == "U") &&
            // is hex value
            (hex_to_int(s = sub_str(t = s, s = i + 2, l = 2)) >= 0)
          ) ? str(chr(hex_to_int(sub_str(s, i + 2, 6))), internal_escape_explode(s, i + 8)) : str(s[i], internal_escape_explode(s, i + 1))
        )
      )
     ) : str(s[i], internal_escape_explode(s, i + 1))
  ) : "";

// Escapes special characters sequences in a string:
// \x00 - with 00 being a valid hexadecimal value in the range 00-FF, this gets replaced by the corresponding ASCII character;
// \u0000 - with 0000 being a valid hexadecimal value in the range 0000-FFFF, this gets replaced by the corresponding 2-bytes Unicode character;
// \u000000 - with 0000 being a valid hexadecimal value in the range 000000-FFFFFF, this gets replaced by the corresponding 3-bytes Unicode character;
// \\ -- prevent escaping, e. g.: "\x4D" will result in "M" character to be shown, "\\x4D" will display "\x4D".
function escape_string(s = "") = internal_escape_explode(s = s, i = 0);

// Generates a heart shape.
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
  // Escape input strings.
  text_left = escape_string(text_1);
  text_right = escape_string(text_2);
  
  // Precalculate things.
  max_len = max(len(text_right), len(text_left));

  text_out_left = render_engine == 1 ? add_trailing_spaces(text_left, max_len) : text_left;
  text_out_right = render_engine == 1 ? add_trailing_spaces(text_right, max_len) : text_right;

  character_width = font_size / font_ratio;

  text_width = max_len * character_width;
  //text_depth = font_size;//len(text_right) > len(text_left) ? font_size : font_size * len(text_left) / len(text_right);
  font_full = str(len(font_custom) > 0 ? font_custom : font_name, font_style != "None" ? str(":style=", font_style) : "");

  text_left_rotation = text_mode == 0 ? [90, 0, render_engine == 1 && (text_shape != 0 && text_shape != 3) ? 45 : text_angle] : [text_mode == 1 ? 90 : 45, 0, 0];
  text_right_rotation = text_mode == 0 ? [90, 0, -(render_engine == 1 && (text_shape != 0 && text_shape != 3) ? 45 : text_angle)] : [0, 0, 0];
  text_top_align = text_mode != 0 ? "center" : "baseline";

  heart_size = text_width / (3 * sin(45) + 1) + base_heart_size;
  heart_rotation = text_heart_direction == 0 ? -text_angle : (text_heart_direction == 1 ? text_angle : 0);

  character_distance = character_width + (font_size / 5) * font_ratio;
  character_start_X = -(max_len * character_distance / 2) + character_width / 2;

  round_corner_radius = ((font_size / 2) * text_roundness) / 100;

  union() {
    difference() {
      if (render_engine == 1 && text_mode == 0) {
        // new rendering mode
        
        intersection() {
          union() {
            
            y_min = (text_shape == 0 || text_shape == 3) ? 0 : -max_len;
            y_max = (text_shape == 0 || text_shape == 3) ? 0 : max_len;
            
            for (y = [y_min:1:y_max]) {
              
              character_x_offset = character_distance / 2;
              character_y_offset = character_distance / 2;
              
              for (i = [0:1:max_len - 1]) {
                
                if (i + y < max_len) {
                
                translate(v = [character_start_X + character_distance * i + character_x_offset * y, -character_y_offset * y, 0])
                intersection() {
                  rotate(a = text_left_rotation)
                  if (text_out_right[i] == " ") {
                    translate(v = [0, text_mode == 0 ? font_size / 2 : 0, 0])
                    cube(size = [character_width * space_ratio, font_size, font_size * max_len], center = true);
                  } else {
                    linear_extrude(height = font_size * max_len, center = true)
                    resize(newsize = [character_width * (is_small_character(text_out_right[i]) ? small_characters_ratio : 1), font_size, 0])
                    text(text = text_out_right[i], size = font_size, font = font_full, halign = "center", valign = "baseline", spacing = font_spacing, $fn = curves_quality);
                  } // if
                  
                  rotate(a = text_right_rotation)
                  if (text_out_left[i + y] == " ") {
                    translate(v = [0, text_mode == 0 ? font_size / 2 : 0, 0])
                    cube(size = [character_width * space_ratio, font_size, font_size * max_len], center = true);
                  } else {
                    linear_extrude(height = font_size * max_len, center = true)
                    resize(newsize = [character_width * (is_small_character(text_out_left[i + y]) ? small_characters_ratio : 1), font_size, 0])
                    text(text = text_out_left[i + y], size = font_size, font = font_full, halign = "center", valign = text_top_align, spacing = font_spacing, $fn = curves_quality);
                  }
                } // intersection
                }
              } // for
            }
          } // union

          translate(v = [0, 0, font_size / 2]) {
            if (text_shape == 0 || text_shape == 3) {
              cube(size = [max_len * character_distance + base_size_correction, font_size, font_size * 2], center = true);
            } else if (text_shape == 1) {
              cylinder(h = font_size, d = text_width + base_size_correction/*max_len * character_distance + base_size_correction*/, center = true, $fn = curves_quality);
            } else if (text_shape == 2) {
              rotate(a = heart_rotation)
              translate(v = [base_heart_x, base_heart_y, 0]) {
                heart(radius = heart_size, height = font_size);
              } // translate
            } // if (text_shape)
          } // translate

        } // intersection
        
      } else {  // legacy version
        intersection() {
          rotate(a = text_left_rotation)
          linear_extrude(height = font_size * max_len, center = true)
          resize(newsize = [text_width, font_size, 0])
          text(text = text_right, size = font_size, font = font_full, halign = "center", valign = "baseline", spacing = font_spacing, $fn = curves_quality);
          
          rotate(a = text_right_rotation)
          linear_extrude(height = font_size * max_len, center = true)
          resize(newsize = [text_width, font_size, 0])
          text(text = text_left, size = font_size, font = font_full, halign = "center", valign = text_top_align, spacing = font_spacing, $fn = curves_quality);

          if (text_shape == 0 || text_shape == 3) {
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
      } // if (render_engine)
      
      // Remove the part that goes below the surface.
      translate(v = [0, 0, -(font_size * max_len) / 2]) {
        if (text_shape == 0 || text_shape == 3) {
          cube(size = [text_width * 2, font_size, font_size * max_len], center = true);
        } else if (text_shape == 1) {
          cylinder(h = font_size * max_len, d = (text_width + base_size_correction) * 2, center = true, $fn = curves_quality);
        } else if (text_shape == 2) {
          rotate(a = heart_rotation)
          translate(v = [base_heart_x, base_heart_y, 0]) {
            heart(radius = heart_size, height = font_size * max_len);
          } // translate
        } // if (text_shape)
      } // translate
    } // difference
    
    if (base_type != 0) {
      translate(v = [base_x_correction, base_y_correction, - base_height / 2 + base_z_correction]) {
      //translate(v = [text_mode == 0 ? base_x_correction : 0, base_y_correction, - base_height / 2 + base_z_correction]) {
        if (text_mode == 0) {
          if (text_shape == 0 || (render_engine != 1 && text_shape == 3)) {
            intersection() {
              // Create the base for left text.
              rotate(a = [0, 0, text_angle])
              cube(size = [text_width + base_size_correction, font_size * max_len, base_height], center = true);
              
              // Intersect with the base for right text.
              rotate(a = [0, 0, -text_angle])
              cube(size = [text_width + base_size_correction, font_size * max_len, base_height], center = true);
              
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
          } else if (text_shape == 3) {
            dist = round_corner_radius == 0 ? 1 : round_corner_radius;
           
            hull() {
              translate(v = [-((max_len * character_distance + base_size_correction) / 2) + dist, -font_size / 2 + dist, 0]) {
                if (round_corner_radius == 0) {
                  cube(size = [dist * 2, dist * 2, base_height], center = true);
                } else {
                  cylinder(h = base_height, r = round_corner_radius, center = true);
                } // if
              } // translate

              translate(v = [-((max_len * character_distance + base_size_correction) / 2) + dist, font_size / 2 - dist, 0]) {
                if (round_corner_radius == 0) {
                  cube(size = [dist * 2, dist * 2, base_height], center = true);
                } else {
                  cylinder(h = base_height, r = round_corner_radius, center = true);
                } // if
              } // translate

              translate(v = [(max_len * character_distance + base_size_correction) / 2 - dist, -font_size / 2 + dist, 0]) {
                if (round_corner_radius == 0) {
                  cube(size = [dist * 2, dist * 2, base_height], center = true);
                } else {
                  cylinder(h = base_height, r = round_corner_radius, center = true);
                } // if
              } // translate

              translate(v = [(max_len * character_distance + base_size_correction) / 2 - dist, font_size / 2 - dist, 0]) {
                if (round_corner_radius == 0) {
                  cube(size = [dist * 2, dist * 2, base_height], center = true);
                } else {
                  cylinder(h = base_height, r = round_corner_radius, center = true);
                } // if
              } // translate
            } // hull
            
          } // if (text_shape)
        } else { // text_mode != 0
          if (base_type == 1) {
            translate(v = [-text_width / 2 + base_x_correction / 2, -font_size / 2, -base_height / 2]) {
              cube(size = [text_width + base_size_correction, font_size, base_height]);
            } // translate
          } else {
            // Add a flat horizontal text at bottom.
            linear_extrude(height = base_height, center = true)
            resize(newsize = [text_width, font_size, 0])
            text(text = text_left, size = font_size, font = font_full, halign = "center", valign = "center", spacing = font_spacing, $fn = curves_quality);
          } // if (base_type)
        } // if (text_mode)
      } // translate
    } // if (base_type)
    
    if (top_type != 0) {
      translate(v = [top_x_correction, top_y_correction, font_size + top_z_correction]) {
        if (text_mode == 0) {
          if (text_shape == 0 || (render_engine != 1 && text_shape == 3)) {
            intersection() {
              // Create the top for left text.
              rotate(a = [0, 0, text_angle])
              cube(size = [text_width + top_size_correction, font_size * max_len, top_height], center = true);
              
              // Intersect with the top for right text.
              rotate(a = [0, 0, -text_angle])
              cube(size = [text_width + top_size_correction, font_size * max_len, top_height], center = true);
              
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
          } else if (text_shape == 3) {
            dist = round_corner_radius == 0 ? 1 : round_corner_radius;
           
            hull() {
              translate(v = [-((max_len * character_distance + top_size_correction) / 2) + dist, -font_size / 2 + dist, 0]) {
                if (round_corner_radius == 0) {
                  cube(size = [dist * 2, dist * 2, top_height], center = true);
                } else {
                  cylinder(h = top_height, r = round_corner_radius, center = true);
                } // if
              } // translate

              translate(v = [-((max_len * character_distance + top_size_correction) / 2) + dist, font_size / 2 - dist, 0]) {
                if (round_corner_radius == 0) {
                  cube(size = [dist * 2, dist * 2, top_height], center = true);
                } else {
                  cylinder(h = top_height, r = round_corner_radius, center = true);
                } // if
              } // translate

              translate(v = [(max_len * character_distance + top_size_correction) / 2 - dist, -font_size / 2 + dist, 0]) {
                if (round_corner_radius == 0) {
                  cube(size = [dist * 2, dist * 2, top_height], center = true);
                } else {
                  cylinder(h = top_height, r = round_corner_radius, center = true);
                } // if
              } // translate

              translate(v = [(max_len * character_distance + top_size_correction) / 2 - dist, font_size / 2 - dist, 0]) {
                if (round_corner_radius == 0) {
                  cube(size = [dist * 2, dist * 2, top_height], center = true);
                } else {
                  cylinder(h = top_height, r = round_corner_radius, center = true);
                } // if
              } // translate
            } // hull
          } // if (text_shape)
        } else { // text_mode != 0
          if (top_type == 1) {
            translate(v = [-text_width / 2 + top_x_correction / 2, -font_size / 2, 0]) {
              cube(size = [text_width + top_size_correction, font_size, top_height]);
            } // translate
          } else {
            // Add a flat horizontal text at bottom.
            linear_extrude(height = top_height, center = true)
            resize(newsize = [text_width, font_size, 0])
            text(text = text_left, size = font_size, font = font_full, halign = "center", valign = "center", spacing = font_spacing, $fn = curves_quality);
          } // if (top_type)
        } // if (text_mode)
      } // translate
    } // if (top_type)
    
  } // union
} // let