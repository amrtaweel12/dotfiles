##################################################
# Settings
##################################################

# Make tmux read bash colors
set -g default-terminal "screen-256color"
set -g terminal-overrides ",xterm-256color:Tc"

# Enable mouse support
set -g mouse on

# Start window indexing at 1
set -g base-index 1
# Start pane indexing at 1
setw -g pane-base-index 1

# Keep the window numbers consistent
set -g renumber-windows on

# Address Vim window switching delay
set -s escape-time 0

# Increase scroll-back buffer size
set -g history-limit 50000

# Messages are displayed for x seconds
set -g display-time 4000

# Focus events enabled for terminals that support them
set -g focus-events on

##################################################
# Panes
##################################################

# Pane border styles
set -g pane-border-style $PANE_BORDER_STYLE
set -g pane-active-border-style $PANE_ACTIVE_BORDER_STYLE

# Display pane numbers colors
set -g display-panes-colour $DISPLAY_PANES_COLOR
set -g display-panes-active-colour $DISPLAY_PANES_ACTIVE_COLOR

##################################################
# Windows
##################################################

# Enable activity alerts
set -g visual-activity on

##################################################
# Status Bar
##################################################

# The number of status bars
set -g status 2

# Update status bar every x seconds
set -g status-interval 1

# Global status bar and message styles
set -g message-style $MSG_STYLE
set -g status-style $STATUS_STYLE

##################################################
## Top Left Status Bar
##################################################

# Display session name
set -g status-format[0] "#[align=left]$LEFT_STATUS_FORMAT #S "

##################################################
## Top Center Status Bar
##################################################

# Set the formatting for active and inactive windows
set -g window-status-current-format "$WINDOW_STATUS_CURRENT_FORMAT #I #W "
set -g window-status-format "$WINDOW_STATUS_FORMAT #I #W "

# Display windows in the top center
set -ag status-format[0] "#[align=centre]#{W:#{E:window-status-format},#{E:window-status-current-format}}"

##################################################
## Top Right Status Bar
##################################################

# Customize top right status bar
# Padding username and hostname awk for alignment
set -g @status-top-right "$HOSTNAME_FORMAT 💻 #(echo "$(whoami)"@"$(hostname)" | awk '{ printf \"%-28s\", $0 }')"
# set -ag status-format[0] "#[align=right]$HOSTNAME_FORMAT 💻 #U@#H "
set -ag @status-top-right "$DATE_FORMAT 📅 #(date +'%a, %d %b %Y') "
set -ag @status-top-right "$TIME_FORMAT 🕜 #(date +'%H:%M') "

set -ag status-format[0] "#[align=right]#{E:@status-top-right}"

##################################################
## Bottom Left Status Bar
##################################################
set -g status-left "#{prefix_highlight}"
# Show mode (currently only rich and zen modes)
set -g status-format[1] "#{?window_zoomed_flag,$MODE_FORMAT 🔎 ZEN MODE , RICH MODE }#{E:status-left}"
set -g @prefix_highlight_fg "#{E:PREFIX_HIGHLIGHT_FG}"
set -g @prefix_highlight_bg "#{E:PREFIX_HIGHLIGHT_BG}"
##################################################
## Bottom Center Status Bar
##################################################

# Not implemented yet

##################################################
## Bottom Right Status Bar
##################################################

# CPU Usage
# Plugin: Tmux CPU
# Padding #{cpu_percentage} to with awk for alignment
set -g status-right "#{cpu_bg_color} \
CPU: #(~/.tmux/plugins/tmux-cpu/scripts/cpu_percentage.sh \
| awk '{ printf \"%-10s\", $0 }')"

# RAM Usage
# Padding #{ram_percentage} to with awk for alignment
set -ag status-right "#{ram_bg_color} \
RAM: #(~/.tmux/plugins/tmux-cpu/scripts/ram_percentage.sh \
| awk '{ printf \"%-10s\", $0 }')"

# Battery Status
# Plugin: Tmux Battery
# Padding #{battery_percentage} with awk for alignment
set -ag status-right "#{battery_color_bg}#{battery_color_fg} \
Battery 🔋: #(~/.tmux/plugins/tmux-battery/scripts/battery_percentage.sh \
| awk '{ printf \"%-8s\", $0 }')"

# Connectivity Status
# Plugin: Tmux Online Status
set -g @online_icon "$CONNECTIVITY_STATUS_ON_STYLE  Online  "
set -g @offline_icon "$CONNECTIVITY_STATUS_OFF_STYLE  Offline "
set -ag status-right "#{online_status}"

# Put the content of status right in bottom right status bar
set -ag status-format[1] "#[align=right]#{E:status-right}"