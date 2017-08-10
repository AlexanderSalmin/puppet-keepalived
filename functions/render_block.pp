function keepalived::render_block(Data $value, $indent = '  ') {
  if $value =~ Hash {
    join($value.map |$k, $v| {
      if $v =~ Hash or $v =~ Array {
        $t = keepalived::render_block($v, "${indent}  ")
        "${indent}${k} {\n${t}\n${indent}}"
      } elsif $v == undef {
        undef
      } elsif $v !~ Boolean or ($v =~ Boolean and $v) {
        $t = keepalived::render_block($v, "${indent}  ")
        "${indent}${k} ${t}"
      }
    }.filter |$k, $v| { $v != undef }, "\n")
  } elsif $value =~ Array {
    join($value.map |$v| {
      $t = keepalived::render_block($v, "${indent}  ")
      "${indent}${t}"
    }, "\n")
  } elsif $value =~ Boolean and $value {
    ''
  } elsif $value =~ String and ' ' in $value {
    "\"${value}\""
  } elsif $value != undef {
    $value
  }
}
