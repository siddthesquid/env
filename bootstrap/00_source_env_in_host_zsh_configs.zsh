#!/usr/bin/env zsh

# Includes autogenerated text for zshrc and zshenv

ZSHENV_FILE="$HOME/.zshenv"
ZSHRC_FILE="$HOME/.zshrc"

TAG_ZSHENV_SOURCE_BEGIN="# BEGIN: source_zshenv"
TAG_ZSHENV_SOURCE_END="# END: source_zshenv"

TAG_ZSHRC_SOURCE_BEGIN="# BEGIN: source_zshrc"
TAG_ZSHRC_SOURCE_END="# END: source_zshrc"

# Function to generate zshrc output
generate_zshrc_source() {
  cat <<EOF
. \$HOME/env/configs/zsh/zshrc
EOF
}

# Function to generate zshenv output
generate_zshenv_source() {
  cat <<EOF
. \$HOME/env/configs/zsh/zshenv
# Add paths manually below this section
# Ex:
#  add_home JAVA_HOME ~/opt/java/jdk
#  add_path ~/opt/java/jdk/bin
EOF
}

# 1. We append the autogenerated sections if they are not already present

# Append zshenv source if not already present
append_zshenv_source() {
  grep -q "$TAG_ZSHENV_SOURCE_BEGIN" $ZSHENV_FILE || {
    echo "Appending zshenv source to $ZSHENV_FILE"
    [[ -s $ZSHENV_FILE ]] && echo "\n" >> $ZSHENV_FILE
    echo "$TAG_ZSHENV_SOURCE_BEGIN" >> $ZSHENV_FILE
    echo "$TAG_ZSHENV_SOURCE_END" >> $ZSHENV_FILE
  }
}

# Append zshrc source if not already present
append_zshrc_source() {
  grep -q "$TAG_ZSHRC_SOURCE_BEGIN" $ZSHRC_FILE || {
    echo "Appending zshrc source to $ZSHRC_FILE"
    [[ -s $ZSHRC_FILE ]] && echo "" >> $ZSHRC_FILE
    echo "$TAG_ZSHRC_SOURCE_BEGIN" >> $ZSHRC_FILE
    echo "$TAG_ZSHRC_SOURCE_END" >> $ZSHRC_FILE
  }
}

# 2. We update the autogenerated sections
# We need to find the start and end lines and replace the content in between

# Function to update the zshenv file with autogenerated content using awk
update_zshenv_source_with_awk() {
  echo "Updating zshenv source"

  # Generate new source content, ensuring newlines are properly escaped
  local new_source=$(generate_zshenv_source | awk '{ print $0 "\\n" }' ORS='')

  awk -v begin_tag="$TAG_ZSHENV_SOURCE_BEGIN" -v end_tag="$TAG_ZSHENV_SOURCE_END" -v new_content="$new_source" '
BEGIN { print_it = 1 }
$0 == begin_tag {
    print $0
    print new_content
    print_it = 0
    next
}
$0 == end_tag {
    print_it = 1
}
print_it { print }
  ' "$ZSHENV_FILE" > tmpfile && mv tmpfile "$ZSHENV_FILE"
}

# Function to update the zshrc file with autogenerated content using awk
update_zshrc_source_with_awk() {
  echo "Updating zshrc source"

  # Generate new source content, ensuring newlines are properly escaped
  local new_source=$(generate_zshrc_source | awk '{ print $0 "\\n" }' ORS='')

  awk -v begin_tag="$TAG_ZSHRC_SOURCE_BEGIN" -v end_tag="$TAG_ZSHRC_SOURCE_END" -v new_content="$new_source" '
BEGIN { print_it = 1 }
$0 == begin_tag {
    print $0
    print new_content
    print_it = 0
    next
}
$0 == end_tag {
    print_it = 1
}
print_it { print }
  ' "$ZSHRC_FILE" > tmpfile && mv tmpfile "$ZSHRC_FILE"
}

# Execute updates
append_zshenv_source
append_zshrc_source
update_zshenv_source_with_awk
update_zshrc_source_with_awk