# Defined in - @ line 1
function grepsrc --wraps='grep -rn --exclude="*.o" --exclude="*.a" --exclude="*.so*" --exclude-dir="lib"' --description 'alias grepsrc=grep -rn --exclude="*.o" --exclude="*.a" --exclude="*.so*" --exclude-dir="lib"'
  grep -rn --exclude="*.o" --exclude="*.a" --exclude="*.so*" --exclude-dir="lib" $argv;
end
