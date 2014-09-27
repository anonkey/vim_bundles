" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    cmain.vim                                          :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: tseguier <tseguier@student.42.fr>          +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2014/01/09 23:25:41 by tseguier          #+#    #+#              "
"    Updated: 2014/09/27 15:31:52 by tseguier         ###   ########.fr        "
"                                                                              "
" **************************************************************************** "

"Vim plugin to add standard header and default content of a C main file
execute "normal! iint\t\tmain(int argc, char **argv)"
execute "normal! o{"
execute "normal! o"
execute "normal! oreturn (0);"
execute "normal! o}"
execute "normal! kki\t"
