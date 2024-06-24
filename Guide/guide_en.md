# Ambigram generator (fully customizable)

This is an [OpenSCAD](https://openscad.org/) script to generate two-sided 3D texts that merge, each text is visible from a different point of view.

This is a PDF version of the README.md file you can find [on original GitHub repository](https://github.com/zizzo81/ambigram).

This script has been published and can be found and used directly on [MakerWorld](https://makerworld.com/en)'s [page](https://makerworld.com/en/models/489660).

This page is also available in Italian. Questa guida è disponibile in italiano.

[![Published on MakerWorld](./maker_world_en.png)](https://makerworld.com/en/models/489660)

### Summary

- [A guide through the tabs of parameters](#a-guide-through-the-tabs-of-parameters)
  - [Texts](#texts)
  - [Font](#font)
  - [Base](#base)
  - [Top](#top)
  - [Tweaks (fix thing up)](#tweaks-fix-things-up)

- [How to remove floating objects](#how-to-remove-floating-objects)
- [How to use symbols in texts](#how-to-use-symbols-in-texts)
  - [How to insert a heart](#how-to-insert-a-heart)
  - [On Windows](#on-windows)
  - [On macOS](#on-macos)
  - [Using the available cheat sheets](#using-the-available-cheat-sheets)
  
- [Version history](#version-history)
- [Thanks](#thanks)

## A guide through the tabs of parameters

Here's an detailed explanation of every possible setting. Feel free to explore the endless possibilities of combining these values.

### Texts

In this tab you can set the basic parameters about displayed texts.

| Parameter            | Description                                                  | unit    | min  | max  | default     |
| -------------------- | ------------------------------------------------------------ | ------- | ---- | ---- | ----------------- |
| text_1               | This is the text which is visible:<br />- from left if *text_mode* is *Left-Right*;<br />- from the top in other modes. | text    |      |      | "SUSANNA"         |
| text_2               | This is the text which is visible:<br />- from right if *text_mode* is *Left-Right*;<br />- from front in other modes. | text    |      |      | "CHRISTIAN"       |
| text_mode            | This defines the mode of rendering of texts, this value can be:<br />- **Left-Right** - one text is visible from an angled left point of view, the other one is visible from an angled right point of view;<br />- **Front-Top** - one text is visible from the top of the object, the other one from the front;<br />- **45° front-Top** - one text is visible from the top of the object, the other one from a 45 degrees angled position between the top and the front. |         |      |      | Left-Right  |
| render_engine        | This enables user to choose which rendering engine to use with this script, providing some sort or retro-compatibility. This value can be:<br />- **v1.0 - legacy** - this uses the legacy rendering engine of version 1.0, which is know to have some limitations;<br />- **v2.0 - NEW! produces a cleaner object** - this value enables the use of new version 2.0 engine which renders better, creating cleaner objects, solving a lot of problems and being more precise with calculations, giving user new opportunities and features. |         |      |      | v2.0              |
| text_angle           | This value, which is valid only in the *Left-Right* mode, allows you to set the angle from which the texts will be visible. | degrees | 0    | 180  | 45                |
| text_shape           | This value can change the shape of the object, possible values are:<br />- **Rectangle** - the same as in original released version, seen from above the object is a rectangle or a rectangle with arrows:<br />- **Circle** - seen from above the object is a circle;<br />- **Heart** - seen from above the object is an heart;<br />- **Rounded rectangle** - a rectangle with rounded corners (only available when using new rendering engine). |         |      |      | Rounded rectangle |
| text_roundness       | If *text_shape* is set as *Rounded rectangle*, this is the percentage of roundness to give to corners. A value of zero will create a pure rectangle. | %       | 0    | 100  | 50                |
| text_heart_direction | If *text_shape* is set as *Heart*, this specifies where the pointing end of the heart is directed, this value can be:<br />- **Left** - the heart points in the same direction of the left text;<br />- **Right** - the heart points in the same direction of the right text;<br />- **Middle** - the heart points in the middle between the two texts. |         |      |      | Left              |
| text_padding | Selects the character to be used when padding texts to match lengths, this can be:<br />- **Space** - a whitespace is inserted, meaning a small object will be created;<br />- **Heart** - a heart shape will be inserted; | | | | Space |

### Font

In this tab you can set all parameters about the font to be used for the texts.

| Parameter    | Description                                                  | unit | min  | max  | default           |
| ------------ | ------------------------------------------------------------ | ---- | ---- | ---- | ----------------- |
| font_name    | Choose one of the supported fonts from the list to apply it to the text.<br /><br />**Be warned!**<br />Complex fonts and fonts with serifs tend to generate floating objects which will result in waste of material and time. Consider using sans serif fonts and/or check my guide on how to easily get rid of floating objects using Fusion 360 down below. |      |      |      | Merriweather Sans |
| font_custom  | Here you can override the above setting by putting the name of a font installed in the system where this script is executed. Please keep in mind that when you use Parametric Model Maker, the system the script is running on is MakerWorld's server, not your computer. |      |      |      | *empty*           |
| font_style   | Choose the style of the text.<br />This can also be set to *None*, which will use font's default style.<br />**Note:** not all fonts support all styles. |      |      |      | Bold              |
| font_size    | The size of the text, which will result in being the height of the object (excluding base and top plate) and also the depth of the object. | mm   | 1    | 72   | 20                |
| font_spacing | Spacing between letters, the greater the number, the far the letters are. Better results are achieved when the letters touch one another, if they don't, a solid base will be required to keep them together. |      | 0.1  | 5    | 1                 |

### Base

To keep the letters united, you need to generate a base plate, these parameters allows you to personalize it's creation.

| Parameter            | Description                                                  | unit | min  | max  | default |
| -------------------- | ------------------------------------------------------------ | ---- | ---- | ---- | ------- |
| base_type            | The type of base to be created, this value can be:<br />- **None** - no base is created at all;<br />- **Solid** - a solid base is created at bottom of object;<br />- **Text** - a top-text shaped base is being created at bottom of object, please note that this is mode not supported in *Left-Right* mode and *Solid* will be used instead. |      |      |      | Text    |
| base_height          | The height of the base.                                      | mm   | 0.2  | 25   | 3       |
| base_x_correction    | Since OpenSCAD does not provide functionalities to compute texts' widths and heights, calculus about the base are approximated, with this parameter you can offset the base position on the X-axis to correct those calculus. | mm   | -100 | 100  | 0       |
| base_y_correction    | Same as *base_x_correction*, but for the Y-axis.             | mm   | -100 | 100  | 0       |
| base_z_correction    | Same as *base_x_correction*, but for the Z-axis.             | mm   | -100 | 100  | 0.4     |
| base_size_correction | Same reason as for *base_x_correction*, this parameter allows you to shrink on enlarge the base size. | mm   | -100 | 100  | 0       |
| base_heart_size      | The correction of the size of the heart when it's being created. | mm   | -100 | 100  | 0       |
| base_heart_x         | Heart X-axis correction.                                     | mm   | -100 | 100  | 0       |
| base_heart_y         | Heart Y-axis correction.                                     | mm   | -100 | 100  | 0       |

### Top

Parameters that will create a top plate over the texts.

| Parameter           | Description                                                  | unit | min  | max  | default |
| ------------------- | ------------------------------------------------------------ | ---- | ---- | ---- | ------- |
| top_type            | The type of plate to be created, this value can be:<br />- **None** - no top plate is created at all:<br />- **Solid** - a solid plate is created at top of object:<br />- **Text** - a top-text shaped plate is being created at top of object, please note that this is mode not supported in *Left-Right* model mode and *Solid* will be used instead. |      |      |      | None    |
| top_height          | The height of the top plate.                                 | mm   | 0.2  | 25   | 3       |
| top_x_correction    | Since OpenSCAD does not provide functionalities to compute texts' widths and heights, calculus about the top plate are approximated, with this parameter you can offset the plate position on the X-axis to correct those calculus. | mm   | -100 | 100  | 0       |
| top_y_correction    | Same as *top_x_correction*, but for the Y-axis.              | mm   | -100 | 100  | 0       |
| top_z_correction    | Same as *top_x_correction*, but for the Z-axis.              | mm   | -100 | 100  | 0.4     |
| top_size_correction | Same reason as for *top_x_correction*, this parameter allows you to shrink on enlarge the top plate size. | mm   | -100 | 100  | 0       |
| top_heart_size      | The correction of the size of the heart when it's being created. | mm   | -100 | 100  | 0       |
| top_heart_x         | Heart X-axis correction.                                     | mm   | -100 | 100  | 0       |
| top_heart_y         | Heart Y-axis correction.                                     | mm   | -100 | 100  | 0       |

### Tweaks (fix things up)

Some parameters that can help you fix things that come out weird.

| Parameter              | Description                                                  | min  | max  | default         |
| ---------------------- | ------------------------------------------------------------ | ---- | ---- | --------------- |
| curves_quality | Selects the quality of curves to be used when generating the model, the lowest the quality, the faster generation will take. You can work in Draft all the time for fast refresh, but you need to remember to switch back to Normal or something higher before exporting the model to be printed.<br /><br />Possible values:<br />- **Draft** - low quality, not suitable for printing;<br />- **Printable draft** - not for production, yet printable;<br />- **Normal**: normal quality, ready to print;<br />- **Good quality**: good quality for printing;<br />- **High quality**: very good quality for printing;<br />- **Very high quality**: good quality for high resolution printers.<br /><br />**Be warned:** Parametric Model Maker has a short timeout for script execution to avoid DDoS attacks, for this reason setting a quality too high could create a timeout error |      |      | Normal  |
| font_ratio             | Since OpenSCAD does not provide functionalities to compute texts' widths and heights, calculus are approximated, with this parameter, which represents the ratio between the height and the width of a single letter of the font used, you can correct those calculations. | 0.1  | 3    | 1.33            |
| small_characters       | This is the list of the characters that will be considered small and will have a smaller depth (see *small_characters_ratio*). |      |      | "!()1I[]fijlt{" |
| small_characters_ratio | This is the ratio between the depth of a normal character and the depth of a character considered small. | 0.01 | 3    | 0.3            |
| space_ratio            | This is the ratio between the depth of a normal character and the depth of a rectangle created in place of a white space. | 0.01 | 3    | 0.1            |
| disable_warnings       | Check this option to disable showing warning and proceed with object generation anyway. |      |      | false           |
| running_at             | This parameter defines where the script is being executed:<br />- **MakerWorld's Parametric Model Maker** - the script will make sure you're using one of the supported fonts - style combinations supported by the MakerWorld's servers and show a warning if you enter an unsupported font / style or combination of the two;<br />- **My computer** - the above check is skipped. |      |      | MakerWorld      |

## How to remove floating objects

As said before, complex texts and fonts with serifs tend to generate floating objects which will result in waste of material and time. This step by step guide will teach anyone, also with no experience of using [AutoDesk Fusion 360](https://www.autodesk.it/products/fusion-360) at all, to remove them from the resulting object.

First of all generate the desired design, you will notice some floating objects that are not connected to other object and not supported by material in any way.

![Floating objects](./floating_objects.png)

Save the design as STL

If using MakerWorld's Parametric Model Maker, click on the ![Generate](./generate_button.png) button to have the last modifications to the parameters be reflected on your model, then click on the ![Download](./download_button.png) button.

When this popup shows up

![Format selection window](./download_selection.png)

Click on the ![Download STL](./download_stl.png) button to download the STL version.

![Save file dialog](./save_as.png)

If your computer offers the possibility to save the file to a desired location, select a folder where you want to save it and choose a proper name, e. g. “floating_objects”, which fill create “floating_objects.stl”.

If your browser is configured to automatically save files, you will find the file named “Ambigram generator.stl” in the location you usually receive downloaded file, usually called the “Downloads” folder.

Now open a new Fusion 360 project, and from the top toolbar, in SOLID tab, choose INSERT => Insert Mesh

![Insert Mesh menu](./insert_mesh_menu_en.png)

When this popup window will appear, click on **Select from my computer…** button.

![Select from my computer...](./select_from_my_computer.png)

A file selection dialog will be shown, locate the freshly downloaded file and click on **Open**.

The object will be placed in the center of the scene, just click on **OK**.

![Insert mesh on scene](./insert_mesh_en.png)

Now we need to convert this to an object body.

![Mesh to object conversion](./convert_mesh_en.png)

With the object selected, follow these steps:

1. Click on the **MESH** tab in the top toolbar;
2. Click on the **MODIFY** menu in the toolbar;
3. Select the **Convert Mesh** menu from the popup menu;
4. Click on **OK** to start the conversion.

Depending on the object complexity and your computer computational power, this could take some time.

Once finish, we need to disable the design history to be able to work on this freely.

Expand the **Bodies** group in the object browser by clicking on the left-pointing triangle on group name's left side.

![Bodies in object browser](./object_browser_en.png)

In the object browser, right click on the top nome e. g. *(Unsaved)*, and from the popup menu that appears choose **Do not capture Design History**.

![Do not capture Design History](./design_history_menu_en.png)

A confirmation dialog will appear, select **Continue** to stop capturing design history.

![Disable design history](./design_history_en.png)

Now start selecting one by one the bodies, in the object browser's Bodies trunk.

![Delete floating object](./delete_floating_object_en.png)

The corresponding object will be blue highlighted on the screen, it this is a floating object, right click on his name in the object browser and select **Delete** from the popup menu that appeared.

![Delete menu](./delete_menu_en.png)

**Important:** once you deleted all unwanted bodies (you should only have one object left), left click on the **Bodies** trunk in the object browser.

![Select bodies group](./select_bodies_en.png)

Now that we cleaned the object, we need to export the file back to STL.

![Utilities - Make button](./utilities_make_en.png)

Follow these steps:

1. Select the **UTILITIES** tab in the top toolbar;
2. Select the **MAKE** icon.

![Utilities - Make - Ok](./utilities_make_ok_en.png)

When in Make mode, the object will be light-blue highlighted, please ensure to select the **STL format** (binary is preferred, but not mandatory), then click on **OK**.

![Save as](./save_to_stl_en.png)

A dialog will popup, please be sure to check the **Save to my computer** option and select a valid folder, enter a name like cleaned_text, which will create cleaned_text.stl file, and finally click on **Save**.

Open [Bambu Studio](https://bambulab.com/en/download/studio) or your preferred slicer, start a new project and drag the file onto it.

![Drag STL over Bambu Studio](./dragndrop_en.png)

You will almost surely need to enable supports for printing this, so please be sure to be in the **Global** section, then go to the **Support** tab, activate **Enable support** and select *tree(auto)* as **Type** - I've got the most efficient and beautiful results using this.

![Enable support](./enable_support_en.png)

## How to use symbols in texts

If you want to use symbols in texts, you can with certain restrictions.

### How to insert a heart

Since not all fonts include the glyph of an heart and those who sometimes do have different codes, I created a special escape characters sequence to insert an heart. In the position where you want to insert a heart glyph, just insert **\h** in place.

### On Windows

From the start menu, open **Characters Map**.

![Windows Characters Map](./charmap_en.png)

Select from the combobox the font you're using in your design, then scroll through characters to find the glyph you want to use, click on it, and press the **Select** button, then use the **Copy** button to copy it to the clipboard, go to the Parametric Model Maker, focus the input field and paste from the clipboard.

Optionally you can copy the character code in the lower left corner and insert its hexadecimal value in the text field pre-pending the "\u" escape character sequence, e. g. : U+2665 becomes \u2665

Alternatively you can use [**Character Map UWP**](https://apps.microsoft.com/detail/9wzdncrdxf41)

![UWP Characters Map](./charmap_uwp_en.png)

Select the font you're using from the left list, scroll through the glyphs to search the one you like most, then click it to focus it. Use the **Copy** button in the lower-right corner to copy it to the clipboard.

Optionally you can copy the character code in the lower right corner and insert its hexadecimal value in the text field pre-pending the "\u" escape character sequence, e. g. : U+263B becomes \u263B

### On macOS

On the Apple system you have a similar tool which is **Font Book**, open it from the Applications folder.

![Font Book list](./fontbook_list_en.png)

On startup you will be presented the full list of fonts installed on your system, search for the font you're using in the script and double click on it's icon to open up the font details.

![Font Book detail](./fontbook_detail_en.png)

Scroll through the glyphs to search the one you like most, then click it to open it up and use the **Copy** button in the lower-right corner to copy it to the clipboard. Paste it into the script's input field.

Optionally you can copy the character code in the lower left corner and insert its hexadecimal value in the text field pre-pending the "\u" escape character sequence, e. g. : U+263C becomes \u263C.

### Using the available cheat sheets

I made some cheat sheets, due to limitations of upload size and count to MakerWorld I only uploaded the index there, you will find all the font-specific files in the [Fonts cheat sheet folder](https://github.com/zizzo81/ambigram/tree/main/Fonts cheat sheet) here on GitHub.

![Cheat sheet index](./cheat_sheet_index.png)

Open up the [Fonts cheat sheet.pdf](https://github.com/zizzo81/ambigram/blob/main/Fonts cheat sheet/Fonts cheat sheet.pdf) file and click the font you're using, you will be brought to the PDF file containing the cheat sheet for that font.

![Cheat sheet for Noto Sans](./cheat_sheet.png)

Scroll through the pages and search the glyph you're looking for, copy the code below it and paste it into the input fields.

## Version history

| Date       | Description                                                  |
| ---------- | ------------------------------------------------------------ |
| 2024-06-19 | - improvement: added the escape character sequence *\h* to insert an heart;<br />- abandoned the old list of fonts and style provided by  [@Stephanos](https://makerworld.com/en/@Stephanos) for using a custom list created by information I've got from MakerWorld's staff;<br />- updated the cheat sheets for the font list that I've got from MakerWorld's staff;<br />- introduced a system for showing errors and warnings to the user;<br />- fixed Tweaks (fix thing up) tab, the open curly bracket was breaking the list of parameters;<br />- fixed the [Hidden] section, was not appearing just because there was the above problem;<br />- translated the guide in Italian, which can be found [here](Guida generatore di ambigrammi.pdf). |
| 2024-06-16 | - a completely new rendering engine has been introduced, this engine creates cleaner objects, solves a lot of problems, is more precise with calculations and gives new opportunities for new features;<br />- fix: when text_left was longer than text_right, the font was cut in half vertically;<br />- fix: top was positioned a lot above the end of the object;<br />- other minor fixes that prevented the script running as intended;<br />- feature: new rendering engine allows to create rounded rectangle base and top plate;<br />- feature: escaping of texts allows to specify ASCII and UNICODE characters;<br />- improvement: heart shape is not considered experimental anymore, since with new rendering engine it's almost perfect;<br />- improvement: font_style has a new possible value of "None";<br />- the new rendering engine has been set as default, but you can switch back to the legacy one by setting the render_engine parameter;<br />- improvement: since rendering engine is default and more precise with calculations, correction offsets and parameters have been zeroed, still available because you can still switch to the legacy engine;<br />- improvement: small characters can be defined and they will be rendered with a specific ratio in depth (only with new rendering engine);<br />- improvement: spaces will be rendered as a very thin shape so corresponding letter can be seen (only with new rendering engine);<br />- improvement: for texts that have different lengths, trailing and leading spaces will be equally added to match the length (only with new rendering engine);<br />- a new PDF called "Fonts cheat sheet.pdf" including all standard fonts with all their glyphs has been added. |
| 2024-06-11 | - fix: uses baseline for text creation, this prevents letters like "J" (uppercase j) to break the design;<br />- fix: cuts out all that goes below the baseline, preventing floating letters;<br />- added selection of the shape mode between rectangle (legacy) and circle;<br />- added selection of the shape heart (experimental);<br />- added top plate creation (request from a user). |
| 2024-06-08 | First public release.                                        |

## Thanks

Thanks to [@Stephanos](https://makerworld.com/en/@Stephanos) for the complete list of fonts and styles supported by MakerWorld he gave me access with his script **Parametric Model Maker ALL TEXT FONTS TEMPLATE** you can find [here](https://makerworld.com/en/models/484918).

![Proudly created in Italy with love](./Guide/italy_en.png)
