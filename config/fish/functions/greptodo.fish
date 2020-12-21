# Defined in - @ line 1
function greptodo --wraps='grep -rn --exclude=*.o --exclude=*.a --exclude=*.so* --exclude-dir=lib TODO' --wraps='grep -rn --exclude="*.o" --exclude="*.a" --exclude="*.so*" --exclude-dir="lib" "TODO"' --description 'alias greptodo=grep -rn --exclude="*.o" --exclude="*.a" --exclude="*.so*" --exclude-dir="lib" "TODO"'
  grep -rn --exclude="*.o" --exclude="*.a" --exclude="*.so*" --exclude-dir="lib" "TODO" $argv;
end
