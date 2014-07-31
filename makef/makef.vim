" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    makef.vim                                          :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: tseguier <tseguier@student.42.fr>          +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2014/01/09 23:26:04 by tseguier          #+#    #+#              "
"    Updated: 2014/07/31 10:19:07 by tseguier         ###   ########.fr        "
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
execute "normal! oNAME = "
execute "r !basename `pwd`"
execute "normal! kJ"
if isdirectory("./libft")
	execute "normal! oINCDIR = ./libft/headers"
	execute "normal! oLIBDIR = ./libft/"
	execute "normal! oLIBNAME = libft"
	execute "normal! oLIB = -lft"
endif
execute "normal! oSRC = "
"execute "r !ls *.c | sed \"s/c$/c \\\\\\/g\" | sed \"\\\$s/ \\\\\\\\$//g\" "
execute "r !ls *.c | tr -s \"\\n\" \" \" | sed \"s/ $//g\""
execute "normal! kJ"
execute "s/\\\.c /\.c \\\\\r/g"
execute "normal! oOBJ = $(SRC:.c=.o)"
execute "normal! o"
execute "normal! oall: $(NAME)"
if isdirectory("./libft")
	execute "normal! o"
	execute "normal! o$(LIBNAME):"
	execute "normal! omake -C $(LIBDIR)"
	execute "normal! o"
	execute "normal! o$(LIBNAME)_fclean:"
	execute "normal! omake -C $(LIBDIR) fclean"
endif
execute "normal! o"
execute "normal! ogcc: $(OBJ)"
execute "normal! ogcc $(CFLAGS) $(OBJ) -o $(NAME)"
execute "normal! o"
if isdirectory("./libft")
	execute "normal! o$(NAME): $(OBJ)"
	execute "normal! o$(CC) $(CFLAGS) -L$(LIBDIR) $(LIB) $(OBJ) -o $(NAME) -I $(INCDIR)"
	execute "normal! o%.o: %.c"
	execute "normal! o$(CC) -I$(LIBDIR) $(CFLAGS) -c $< -o $@ -I $(INCDIR)"
else
	execute "normal! o$(NAME): $(OBJ)"
	execute "normal! o$(CC) $(CFLAGS) $(OBJ) -o $(NAME)"
	execute "normal! o"
	execute "normal! o%.o: %.c"
	execute "normal! o$(CC) -o $@ -c $< $(CFLAGS)"
endif
execute "normal! o"
execute "normal! oclean:"
execute "normal! orm -rf $(OBJ)"
execute "normal! o"
if isdirectory("./libft")
	execute "normal! ofclean: $(LIBNAME)_fclean clean"
	execute "normal! orm -rf $(NAME)"
	execute "normal! o"
	execute "normal! ore: $(LIBNAME)_fclean fclean all"
	execute "normal! o"
	execute "normal! o.PHONY: $(LIBNAME) $(LIBNAME)_fclean clean fclean all re"
else
	execute "normal! ofclean: clean"
	execute "normal! orm -rf $(NAME)"
	execute "normal! o"
	execute "normal! ore: fclean all"
	execute "normal! o"
	execute "normal! o.PHONY: clean fclean all re"
endif
execute "normal! gg"
execute ":Stdheader"
