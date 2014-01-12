" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    hheader.vim                                        :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: tseguier <tseguier@student.42.fr>          +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2014/01/09 23:25:56 by tseguier          #+#    #+#              "
"    Updated: 2014/01/09 23:30:51 by tseguier         ###   ########.fr        "
"                                                                              "
" **************************************************************************** "

"Vim plugin to add standard header and multiple header inclusion protect
"in .h files
let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
execute "normal! i#ifndef " . gatename
execute "normal! o# define " . gatename
execute "normal! Go"
execute "normal! Go#endif /* !" . gatename . " */"
execute "normal! gg"
execute ":Stdheader"
execute "normal! jj"
