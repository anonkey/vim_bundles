" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    makef.vim                                          :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: tseguier <tseguier@student.42.fr>          +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2014/01/09 23:26:04 by tseguier          #+#    #+#              "
"    Updated: 2014/10/01 01:15:44 by tseguier         ###   ########.fr        "
"                                                                              "
" **************************************************************************** "

"Vim plugin to add standard header and default content of a basic makefile
"
execute "normal! oifeq ($(GCC), 1)"
execute "normal! oCC = gcc"
execute "normal! oelse"
execute "normal! oCC = clang"
execute "normal! oendif"
execute "normal! oifeq ($(DEBUG), 1)"
execute "normal! oCFLAGS = -Wall -Wextra -Werror -ggdb3"
execute "normal! oelse"
execute "normal! oCFLAGS = -Wall -Wextra -Werror"
execute "normal! oendif"
execute "normal! oLDFLAGS = rc"
execute "normal! oNAME = "
execute "r !basename `pwd`;echo -n '.a'"
execute "normal! kJ"
execute "normal! oSRC = "
execute "r !ls **/*.c | tr -s \"\\n\" \" \" | sed \"s/ $//g\""
execute "normal! kJ"
execute "s/\\\.c /\.c \\\\\r/g"
execute "normal! oOBJ = $(SRC:.c=.o)"
execute "normal! oHEADERS = headers/"
execute "normal! oSRCDIR = srcs/"
execute "normal! o"
execute "normal! o"
execute "normal! oall: $(NAME)"
execute "normal! o"
execute "normal! o$(NAME): $(OBJ)"
execute "normal! o\t$(AR) $(LDFLAGS) $(NAME) $(OBJ)"
execute "normal! o<Tab>ranlib $(NAME)"
execute "normal! o"
execute "normal! o%.o: %.c"
execute "normal! o\t$(CC) -o $@ -c $< $(CFLAGS) -I$(HEADERS)"
execute "normal! o"
execute "normal! o.PHONY: clean fclean all re $(NAME)"
execute "normal! o"
execute "normal! oclean:"
execute "normal! o\trm -rf $(OBJ)"
execute "normal! o"
execute "normal! ofclean: clean"
execute "normal! o\trm -rf $(NAME)"
execute "normal! o"
execute "normal! ore: fclean all"
execute "normal! o"
execute "normal! gg"
execute ":Stdheader"
