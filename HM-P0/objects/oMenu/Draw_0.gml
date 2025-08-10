// Draw the menu background
draw_sprite_stretched(sBox, 0, x, y, widthFull, heightFull);
draw_set_color(c_white);
draw_set_font(fnM5x7);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// Safety check - if no options exist, abort drawing
if (!is_array(options) || array_length(options) == 0) {
    draw_text(x, y, "MENU ERROR: No options");
    return;
}

var _desc = !(description == -1);
var _scrollPush = max(0, hover - (visibleOptionsMax - 1));

// Draw all visible options
for (var l = 0; l < (visibleOptionsMax + _desc); l++) {
    // Triple safety check:
    // 1. Check if we've exceeded total options
    // 2. Validate calculated index
    // 3. Check option array structure
    if (l >= array_length(options)) break;
    
    var _optionToShow = l - _desc + _scrollPush;
    if (_optionToShow < 0 || _optionToShow >= array_length(options)) continue;
    if (!is_array(options[_optionToShow]) || array_length(options[_optionToShow]) < 4) continue;
    
    draw_set_color(c_white);
    
    // Draw description if this is the first line and description exists
    if (l == 0 && _desc) {
        draw_text(x + xmargin, y + ymargin, description);
    }
    else {
        var _str = options[_optionToShow][0];
        
        // Highlight hovered option
        if (hover == _optionToShow) {
            draw_set_color(c_yellow);
        }
        
        // Gray out disabled options
        if (options[_optionToShow][3] == false) {
            draw_set_color(c_gray);
        }
        
        draw_text(x + xmargin, y + ymargin + l * heightline, _str);
    }
}

// Draw pointer if hover is valid
if (hover >= 0 && hover < array_length(options)) {
    draw_sprite(sPointer, 0, 
        x + xmargin + 8, 
        y + ymargin + ((hover - _scrollPush) * heightline) + 7
    );
}

// Draw scroll indicator if needed
if (visibleOptionsMax < array_length(options)) && (hover > array_length(options) - 1) {
    draw_sprite(sDownArrow, 0, x + widthFull * 0.5, y + heightFull - 7);
}