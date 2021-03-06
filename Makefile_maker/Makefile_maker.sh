#!/bin/bash
if [ ! -n "$1" ] ;then
    echo ""
    echo 'Error!'
    echo 'Uage:makecreate [objectName]'
    echo ""
    exit
fi
:>Makefile
echo 'cc = gcc' >> Makefile
echo 'prom = '$1 >> Makefile
echo 'deps = $(shell find ./ -maxdepth 1 -name '"'"'*.h'"'"'|sed '"'"'s%.*/%%'"'"')' >> Makefile
echo 'src = $(shell find ./ -maxdepth 1 -name '"'"'*.c'"'"'|sed '"'"'s%.*/%%'"'"')' >> Makefile
echo 'obj = $(src:%.c=%.o)' >> Makefile
echo 'lib = '$2 $3 $4 >> Makefile
echo '' >> Makefile
echo '$(prom):$(obj)' >> Makefile

echo '	$(cc) -o $(prom) $(obj) $(lib)' >> Makefile
echo '' >> Makefile
echo '%.o:%.c $(deps)' >> Makefile
echo '	$(cc) -c $< -o $@ $(lib)' >> Makefile



echo '' >> Makefile
echo 'clean:' >> Makefile
echo '	rm -rf $(obj) $(prom)' >> Makefile
