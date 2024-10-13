/*hyprlang*/ ''
# Move focus with mainMod + arrow keys
bind = SUPER, h, scroller:movefocus, l
bind = SUPER, l, scroller:movefocus, r
bind = SUPER, k, scroller:movefocus, u
bind = SUPER, j, scroller:movefocus, d
bind = SUPER, home, scroller:movefocus, begin
bind = SUPER, end, scroller:movefocus, end

# Movement
bind = SUPER CTRL, h, scroller:movewindow, l
bind = SUPER CTRL, l, scroller:movewindow, r
bind = SUPER CTRL, k, scroller:movewindow, u
bind = SUPER CTRL, j, scroller:movewindow, d
bind = SUPER CTRL, home, scroller:movewindow, begin
bind = SUPER CTRL, end, scroller:movewindow, end

# Modes
bind = SUPER, bracketleft, scroller:setmode, row
bind = SUPER, bracketright, scroller:setmode, col

# Sizing keys
bind = SUPER, equal, scroller:cyclesize, next
bind = SUPER, minus, scroller:cyclesize, prev

# Admit/Expel
bind = SUPER, I, scroller:admitwindow,
bind = SUPER, O, scroller:expelwindow,

# Center submap
# will switch to a submap called center
bind = SUPER, C, submap, center
# will start a submap called "center"
submap = center
# sets repeatable binds for resizing the active window
bind = , C, scroller:alignwindow, c
bind = , C, submap, reset
bind = , l, scroller:alignwindow, r
bind = , l, submap, reset
bind = , h, scroller:alignwindow, l
bind = , h, submap, reset
bind = , k, scroller:alignwindow, u
bind = , k, submap, reset
bind = , j, scroller:alignwindow, d
bind = , j, submap, reset
# use reset to go back to the global submap
bind = , escape, submap, reset
# will reset the submap, meaning end the current one and return to the global one
submap = reset

# Resize submap
# will switch to a submap called resize
bind = SUPER, R, submap, resize
# will start a submap called "resize"
submap = resize
# sets repeatable binds for resizing the active window
binde = , l, resizeactive, 100 0
binde = , h, resizeactive, -100 0
binde = , k, resizeactive, 0 -100
binde = , j, resizeactive, 0 100
# use reset to go back to the global submap
bind = , escape, submap, reset
# will reset the submap, meaning end the current one and return to the global one
submap = reset

# Fit size submap
# will switch to a submap called fitsize
bind = SUPER, W, submap, fitsize
# will start a submap called "fitsize"
submap = fitsize
# sets binds for fitting columns/windows in the screen
bind = , W, scroller:fitsize, visible
bind = , W, submap, reset
bind = , l, scroller:fitsize, toend
bind = , l, submap, reset
bind = , h, scroller:fitsize, tobeg
bind = , h, submap, reset
bind = , k, scroller:fitsize, active
bind = , k, submap, reset
bind = , j, scroller:fitsize, all
bind = , j, submap, reset
# use reset to go back to the global submap
bind = , escape, submap, reset
# will reset the submap, meaning end the current one and return to the global one
submap = reset

# overview keys
# bind key to toggle overview (normal)
bind = SUPER, tab, scroller:toggleoverview
# overview submap
# will switch to a submap called overview
bind = SUPER, tab, submap, overview
# will start a submap called "overview"
submap = overview
bind = , l, scroller:movefocus, right
bind = , h, scroller:movefocus, left
bind = , k, scroller:movefocus, up
bind = , j, scroller:movefocus, down
# use reset to go back to the global submap
bind = , escape, scroller:toggleoverview,
bind = , escape, submap, reset
bind = , return, scroller:toggleoverview,
bind = , return, submap, reset
bind = SUPER, tab, scroller:toggleoverview,
bind = SUPER, tab, submap, reset
# will reset the submap, meaning end the current one and return to the global one
submap = reset

# Marks
bind = SUPER, M, submap, marksadd
submap = marksadd
bind = , a, scroller:marksadd, a
bind = , a, submap, reset
bind = , b, scroller:marksadd, b
bind = , b, submap, reset
bind = , c, scroller:marksadd, c
bind = , c, submap, reset
bind = , escape, submap, reset
submap = reset

bind = SUPER SHIFT, M, submap, marksdelete
submap = marksdelete
bind = , a, scroller:marksdelete, a
bind = , a, submap, reset
bind = , b, scroller:marksdelete, b
bind = , b, submap, reset
bind = , c, scroller:marksdelete, c
bind = , c, submap, reset
bind = , escape, submap, reset
submap = reset

bind = SUPER, apostrophe, submap, marksvisit
submap = marksvisit
bind = , a, scroller:marksvisit, a
bind = , a, submap, reset
bind = , b, scroller:marksvisit, b
bind = , b, submap, reset
bind = , c, scroller:marksvisit, c
bind = , c, submap, reset
bind = , escape, submap, reset
submap = reset

bind = SUPER CTRL, M, scroller:marksreset
''
