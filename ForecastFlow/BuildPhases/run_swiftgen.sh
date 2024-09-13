#  Add homebrew directory
export PATH="$PATH:/opt/homebrew/bin"
if which swiftgen &>/dev/null; then
  echo "warning: Starting SwiftGen..."
  swiftgen
  echo "warning: SwiftGen run completed."
else
  echo "warning: SwiftGen not installed, download it from https://github.com/SwiftGen/SwiftGen"
fi
